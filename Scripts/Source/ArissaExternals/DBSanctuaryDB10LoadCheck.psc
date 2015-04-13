scriptName DBSanctuaryDB10LoadCheck extends objectReference
{Script to enable/disable the DB10 Imagespace Modifier, Smoke, and Rumble FX when the player enters or leaves the Sanctuary.}

Quest property DB10 Auto
Cell property DBSanctuaryInteriorCell Auto
ImageSpaceModifier property FireIM Auto
Sound property rumbleSound Auto

VisualEffect Property CameraAttachFX Auto 
{Particle art to attach to camera, fog by default}
VisualEffect Property CameraAttachFX2 Auto 
{2nd Particle art to attach to camera, not used by default}
int instanceID ;used to store sound ref

bool PlayerInSanctuaryOnce = False
bool FireShakeRumbleActive = False

int tmpCount = 0


Event OnCellAttach()
	RunLoadCheck()
EndEvent

Function RunLoadCheck()
	if (DB10.GetStage() > 0 && DB10.GetStage() <= 50 && Game.GetPlayer().GetParentCell() == DBSanctuaryInteriorCell)
		FireIM.Apply(1)
		DBSanctuaryInteriorCell.SetFogPlanes(-500, 2000)
		DBSanctuaryInteriorCell.SetFogColor(226, 152, 69, 97, 70, 41)
		;Burning Sanctuary fog layer should turn on here, when available.
		FireShakeRumbleActive = True
		RunFireShakeRumble()
		PlayerInSanctuaryOnce = True
	ElseIf (DB10.GetStage() > 50 || Game.GetPlayer().GetParentCell() != DBSanctuaryInteriorCell)
		FireIM.Remove()
		DBSanctuaryInteriorCell.SetFogPlanes(0, 6000)
		DBSanctuaryInteriorCell.SetFogColor(91, 85,60, 96, 88, 43)
		;Burning Sanctuary fog layer should turn off here.
		DisableSmokeAttachFX()
		FireShakeRumbleActive = False
	EndIf
EndFunction

Function RunFireShakeRumble()
	While (FireShakeRumbleActive && DB10.GetStage() < 55)
		Game.GetPlayer().RampRumble(0.25, 1, 1600)
		Game.ShakeCamera()
		rumbleSound.Play(Self)
		Utility.Wait(Utility.RandomInt(4, 8))
	EndWhile
EndFunction



Function EnableSmokeAttachFX()
	if (DB10.GetStage() > 0 && DB10.GetStage() < 50 && Game.GetPlayer().GetParentCell() == DBSanctuaryInteriorCell)
		;Trigger the camera attach fx.
		CameraAttachFX.Play(Game.GetPlayer(), -1)
		if (CameraAttachFX2)
			CameraAttachFX2.Play(Game.GetPlayer(), -1)
		endif
	EndIf
EndFunction

Function DisableSmokeAttachFX()
	CameraAttachFX.Stop(Game.GetPlayer())
	if (CameraAttachFX2)
		CameraAttachFX2.Stop(Game.GetPlayer())
	endif
EndFunction

