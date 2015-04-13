Scriptname DA09Script extends Quest  Conditional


ObjectReference Property DA09StatueGemReference Auto
ObjectReference Property DA09StatueGemMarker Auto
ObjectReference Property DA09StatueGemReturnMarker Auto

ObjectReference Property DA09StatueBeamTarget Auto
ObjectReference Property DA09StatueBeamTarget2 Auto

ObjectReference Property DA09MeridiaStatueFXRef Auto

spell Property beamSpell Auto 
{pointer to beam spell}

ObjectReference Property DA09FloatMarker1 Auto
ObjectReference Property DA09FloatMarker2 Auto

ObjectReference Property DA09FXBeamSkyRef Auto
ObjectReference Property DA09SkyBeam2 Auto

ObjectReference Property QSTBeamMeridiaStatueLPRef Auto

ImageSpaceModifier Property DA09SkyFadeInOut Auto 	;old version

ImageSpaceModifier Property DA09WhiteIMOD Auto 	
ImageSpaceModifier Property DA09BloomIMOD Auto 	


ObjectReference Property DA09MeridiaStartMarker Auto

ObjectReference Property DA09SkyMarker Auto
ObjectReference Property DA09SkyMarkerB Auto
ObjectReference Property DA09StatueMarker Auto

ObjectReference Property DA09SkyPlaneCollision Auto

ObjectReference Property DungeonBlockerToggle Auto

LeveledItem Property DA09DawnbreakerList Auto

Scene Property DA09SkyScene	Auto
Scene Property DA09GemScene	Auto
Scene Property DA09CaveInScene Auto

int Property QuestHook Auto hidden Conditional			;0 = unset, 1 = player got quest hook from Meridia

int Property GemSceneStage Auto Hidden Conditional 		;0 = unset, n = which line of dialogue to say in DA09GemScene

ReferenceAlias Property xMarkerVoice Auto

GlobalVariable Property DA09ChangeLocChance Auto

VisualEffect Property DA09Vision Auto	

int Property PlayerInQTHelperTrigger Auto hidden Conditional 	;see DA09QuestTargetHelperTriggerScript attached to QuestTargetHelperTrigger alias

Actor Property DA09MeridiaRef Auto


objectReference property DA09PedestalRef auto
objectReference property DA09PedestalEmptyRef auto
objectReference property FXNecroTendrilRingRef auto


Faction Property DA09TemporaryDragonFriendFaction Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property WINextDragon Auto


;OBSOLETE
;Function playVision()
;	DA09Vision.play(Game.GetPlayer(), 5.0)
;
;EndFunction

function ForceCameraAndDisableControls()
	Game.ForceFirstPerson() 
	Game.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = false, abSneaking = true, abMenu = true, abActivate = true)
endfunction

function SafeGuardAgainstDragons(bool PreventDragonAttacks = true)

; 	debug.trace("DA09Script: SafeGuardAgainstDragons(" + PreventDragonAttacks + ")")

	Actor PlayerActor = Game.GetPlayer()

	if PreventDragonAttacks
		WINextDragon.SetValue(GameDaysPassed.GetValue() + 1 )
		PlayerActor.AddToFaction(DA09TemporaryDragonFriendFaction)
		PlayerActor.StopCombat()
		PlayerActor.StopCombatAlarm()
	
	Else
		PlayerActor.RemoveFromFaction(DA09TemporaryDragonFriendFaction)
	
	EndIf

EndFunction


function movePlayerToSky()

; 	debug.trace("DA09Script: Player is sucked into sky.")

	Game.EnableFastTravel(false)
	ForceCameraAndDisableControls()

	SafeGuardAgainstDragons(true)
	
	DA09MeridiaStatueFXRef.PlayAnimation("playanim01")

	DA09SkyPlaneCollision.enable()
	DA09MeridiaRef.MoveTo(DA09MeridiaStartMarker)
	DA09MeridiaRef.enable()

	actor PlayerRef = Game.GetPlayer()


	DA09SkyFadeInOut.apply()

	utility.wait(1)

	PlayerRef.TranslateToRef(DA09FloatMarker1, 150)
	utility.wait(2.5)

	PlayerRef.TranslateToRef(DA09SkyMarker, 4000)
	utility.wait(4.5)
	PlayerRef.StopTranslation()

	DA09SkyBeam2.enable()

	;looping sound effect for the beam:
	QSTBeamMeridiaStatueLPRef.enable()

	PlayerRef.moveto(DA09SkyMarker)

	Game.EnableFastTravel(false)
	Game.EnablePlayerControls(abFighting = false, abCamSwitch  = false)

EndFunction

function movePlayerToEarth()

	actor PlayerRef = Game.GetPlayer()

	ForceCameraAndDisableControls()

	DA09SkyPlaneCollision.disable()

	;DA09SkyFadeInOut.apply()

	float FallTime = 6
	float preEffectTime = 1
	float FadeTime = 1.5

	utility.wait(preEffectTime)
	DA09BloomIMOD.ApplyCrossFade(FallTime - preEffectTime - FadeTime)
	utility.wait(FallTime - (FadeTime + preEffectTime))
	DA09WhiteIMOD.ApplyCrossFade(FadeTime)
	utility.wait(FadeTime)

	PlayerRef.moveto(DA09StatueMarker)

	DA09SkyBeam2.disable()
	DA09MeridiaRef.disable()

	ImageSpaceModifier.RemoveCrossFade(FallTime)



	if GetStage() > 300
		DA09FXBeamSkyRef.Disable()

		DA09MeridiaStatueFXRef.PlayAnimation("playanim02")

		;looping sound effect for the beam:
		QSTBeamMeridiaStatueLPRef.disable()
		
	EndIf


	Game.EnablePlayerControls()
	Game.EnableFastTravel(true)

	SafeGuardAgainstDragons(False)
	
EndFunction


Function TeleportPlayerToSky()

; 	debug.trace("DA09Script: Player is teleported into sky.")

	DA09SkyPlaneCollision.enable()
	DA09MeridiaRef.MoveTo(DA09MeridiaStartMarker)
	DA09MeridiaRef.enable()

	actor PlayerRef = Game.GetPlayer()

	Game.EnableFastTravel(false)
	ForceCameraAndDisableControls()

	SafeGuardAgainstDragons(true)
	
	DA09SkyFadeInOut.apply()

	Utility.Wait(7)

	DA09SkyBeam2.enable()

	PlayerRef.moveto(DA09SkyMarker)

	Game.EnableFastTravel(false)
	Game.EnablePlayerControls(abFighting = false, abCamSwitch  = false)


EndFunction



function startCaveIn()
	xMarkerVoice.GetReference().moveto(Game.GetPlayer())
	DA09CaveInScene.Start()

EndFunction

