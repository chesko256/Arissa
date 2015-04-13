scriptname dunReachwaterRockPedestalManager extends ObjectReference
{Handles the amulet pedestals in Reachwater Rock.}

ObjectReference property FolgunthurPedestal Auto
ObjectReference property SaarthalPedestal Auto
ObjectReference property GeirmundPedestal Auto

ObjectReference property FolgunthurPedestalAct Auto
ObjectReference property SaarthalPedestalAct Auto
ObjectReference property GeirmundPedestalAct Auto

ObjectReference property FolgunthurPedestalBeam Auto
ObjectReference property SaarthalPedestalBeam Auto
ObjectReference property GeirmundPedestalBeam Auto
ObjectReference property FolgunthurPedestalBeam02 Auto
ObjectReference property SaarthalPedestalBeam02 Auto
ObjectReference property GeirmundPedestalBeam02 Auto
ObjectReference property GauldurAmuletBeam1 Auto
ObjectReference property GauldurAmuletBeam2 Auto

Armor property FolgunthurAmulet Auto
Armor property SaarthalAmulet Auto
Armor property GeirmundAmulet Auto
ObjectReference property GauldurAmulet Auto

ObjectReference property FolgunthurAmuletAct Auto
ObjectReference property SaarthalAmuletAct Auto
ObjectReference property GeirmundAmuletAct Auto

EffectShader property AmuletFX Auto

Message property FailMessage Auto

Quest property dunGauldursonQST Auto

Explosion property VFXRemoveFragment Auto


Event OnActivate(ObjectReference obj)
	if (obj == FolgunthurPedestalAct && Game.GetPlayer().GetItemCount(FolgunthurAmulet) > 0)
		FolgunthurPedestalAct.Disable()
		Game.GetPlayer().RemoveItem(FolgunthurAmulet)
		FolgunthurAmuletAct.Enable()
		Utility.Wait(0.5)
		AmuletFX.Play(FolgunthurAmuletAct)
		AmuletFX.Play(FolgunthurPedestal)
		Game.GetPlayer().RampRumble(0.1, 1, 1600)
		FolgunthurPedestalBeam.EnableNoWait(True)
		dunGauldursonQST.SetStage(101)
	ElseIf (obj == SaarthalPedestalAct && Game.GetPlayer().GetItemCount(SaarthalAmulet) > 0)
		SaarthalPedestalAct.Disable()
		Game.GetPlayer().RemoveItem(SaarthalAmulet)
		SaarthalAmuletAct.Enable()
		Utility.Wait(0.5)
		AmuletFX.Play(SaarthalAmuletAct)
		AmuletFX.Play(SaarthalPedestal)
		Game.GetPlayer().RampRumble(0.1, 1, 1600)
		SaarthalPedestalBeam.EnableNoWait(True)
		dunGauldursonQST.SetStage(102)
	ElseIf (obj == GeirmundPedestalAct && Game.GetPlayer().GetItemCount(GeirmundAmulet) > 0)
		GeirmundPedestalAct.Disable()
		Game.GetPlayer().RemoveItem(GeirmundAmulet)
		GeirmundAmuletAct.Enable()
		Utility.Wait(0.5)
		AmuletFX.Play(GeirmundAmuletAct)
		AmuletFX.Play(GeirmundPedestal)
		Game.GetPlayer().RampRumble(0.1, 1, 1600)
		GeirmundPedestalBeam.EnableNoWait(True)
		dunGauldursonQST.SetStage(103)
	Else
		FailMessage.Show()
	EndIf
EndEvent

Function EnableSupplementalBeams()
	FolgunthurPedestalBeam02.EnableNoWait(True)
	SaarthalPedestalBeam02.EnableNoWait(True)
	GeirmundPedestalBeam02.EnableNoWait(True)
EndFunction

Function ReforgeAmulet()
	;Deal with the Fragments
	FolgunthurAmuletAct.PlaceAtMe(VFXRemoveFragment).SetScale(0.5)
	SaarthalAmuletAct.PlaceAtMe(VFXRemoveFragment).SetScale(0.5)
	GeirmundAmuletAct.PlaceAtMe(VFXRemoveFragment).SetScale(0.5)
	Game.GetPlayer().RampRumble(1, 2, 1600)
	FolgunthurAmuletAct.DisableNoWait(True)
	SaarthalAmuletAct.DisableNoWait(True)
	GeirmundAmuletAct.DisableNoWait(True)
	Utility.Wait(0.15)
	GauldurAmulet.EnableNoWait(True)
	GauldurAmuletBeam1.EnableNoWait(True)
	GauldurAmuletBeam2.EnableNoWait(True)
	AmuletFX.Stop(FolgunthurAmuletAct)
	AmuletFX.Stop(FolgunthurPedestal)
	AmuletFX.Stop(SaarthalAmuletAct)
	AmuletFX.Stop(SaarthalPedestal)
	AmuletFX.Stop(GeirmundAmuletAct)
	AmuletFX.Stop(GeirmundPedestal)
	FolgunthurPedestalBeam.DisableNoWait(True)
	SaarthalPedestalBeam.DisableNoWait(True)
	GeirmundPedestalBeam.DisableNoWait(True)
	FolgunthurPedestalBeam02.DisableNoWait(True)
	SaarthalPedestalBeam02.DisableNoWait(True)
	GeirmundPedestalBeam02.DisableNoWait(True)
EndFunction

Function DisableBeams()
	GauldurAmuletBeam1.DisableNoWait(True)
	GauldurAmuletBeam2.DisableNoWait(True)
EndFunction


