scriptname dunFrostmereCryptSwordHolderManager extends ObjectReference
{Activator for the Pale Blade sword holder system in Frostmere Crypt.}

FormList property PaleBladeList Auto
Weapon property PaleBlade01 Auto
Weapon property PaleBlade02 Auto
Weapon property PaleBlade03 Auto
Weapon property PaleBlade04 Auto
Weapon property PaleBlade05 Auto
int PaleBladeCount

Message property NoSwordMessage Auto
{Message to display if the player doesn't have either.}

ObjectReference property InvisibleActivator Auto
{The invisible box activator.}

ObjectReference property SwordActivator Auto
{The 'fake sword' activator for the sword.}

Quest property dunFrostmereCryptQST Auto
{The primary quest for Frostmere Crypt.}

int property FrostmereStageToSetOnBanish Auto
{The stage to set when the player banishes the Pale Lady.}

Quest property dunFrostmereBanishToggleQST Auto
{The toggle quest for unbanishing/rebanishing the Pale Lady.}

int property ToggleStageToSetOnBanish Auto
{Stage to set when the player banishes the Pale Lady.}

int property ToggleStageToSetOnUnbanish Auto
{Stage to set when the player unbanishes the Pale Lady.}

EffectShader property swordVFXShader Auto
{VFX to play on the Pale Blade activator.}

ObjectReference property PaleLady Auto
{The Pale Lady.}

ObjectReference property PaleLadyRespawnPoint Auto
{Where the Pale Lady will reappear if the player takes the sword again.}

ObjectReference property Wisp1RespawnPoint Auto
ObjectReference property Wisp2RespawnPoint Auto
ObjectReference property Wisp3RespawnPoint Auto

ObjectReference property Wisp01 Auto
ObjectReference property Wisp02 Auto
ObjectReference property Wisp03 Auto

ObjectReference property PaleLadyFurniture Auto

Sound property rumbleSound Auto



Auto State Ready
	Event OnActivate(ObjectReference triggerRef)
		GoToState("Busy")
		if (triggerRef == InvisibleActivator)
			ActivateBox()
		Else
			ActivateSword(triggerRef)
		EndIf
		Utility.Wait(2)
		GoToState("Ready")
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference triggerRef)
		;Do nothing.
	EndEvent
EndState

;If the player has activated the invisible trigger box, handle that activation.
Function ActivateBox()
	;Does the player have the sword we're looking for?
	if (Game.GetPlayer().GetItemCount(PaleBladeList) == 0)
		NoSwordMessage.Show()
	Else
		if (Game.GetPlayer().GetItemCount(PaleBlade01) > 0)
			Game.GetPlayer().RemoveItem(PaleBlade01, 1, True)
			PaleBladeCount = 1
		ElseIf (Game.GetPlayer().GetItemCount(PaleBlade02) > 0)
			Game.GetPlayer().RemoveItem(PaleBlade02, 1, True)
			PaleBladeCount = 2
		ElseIf (Game.GetPlayer().GetItemCount(PaleBlade03) > 0)
			Game.GetPlayer().RemoveItem(PaleBlade03, 1, True)
			PaleBladeCount = 3
		ElseIf (Game.GetPlayer().GetItemCount(PaleBlade04) > 0)
			Game.GetPlayer().RemoveItem(PaleBlade04, 1, True)
			PaleBladeCount = 4
		ElseIf (Game.GetPlayer().GetItemCount(PaleBlade05) > 0)
			Game.GetPlayer().RemoveItem(PaleBlade05, 1, True)
			PaleBladeCount = 5
		EndIf
		InvisibleActivator.Disable()
		SwordActivator.Enable()
		Utility.Wait(0.5)
		swordVFXShader.Play(SwordActivator)
		If (!(PaleLady as Actor).IsDead())
			InvisibleActivator.RampRumble(0.25, 1, 1600)
			Game.ShakeCamera()
			rumbleSound.Play(Self)
			dunFrostmereCryptQST.SetStage(FrostmereStageToSetOnBanish)
			dunFrostmereBanishToggleQST.SetStage(ToggleStageToSetOnBanish)
			(PaleLady as Actor).SetAv("Variable06", 1)
			(PaleLady as Actor).EvaluatePackage()
			(PaleLady as dunFrostmereCryptFakeSummon).Banish()
			(Wisp01 as dunFrostmereCryptFakeSummon).Banish()
			(Wisp02 as dunFrostmereCryptFakeSummon).Banish()
			(Wisp03 as dunFrostmereCryptFakeSummon).Banish()
			PaleLadyFurniture.Disable()
		EndIf
	EndIf
EndFunction

Function ActivateSword(ObjectReference triggerRef)
	if (PaleBladeCount == 0)
; 		Debug.Trace("THIS IS A BUG!")
	ElseIf (PaleBladeCount == 1)
		Game.GetPlayer().AddItem(PaleBlade01, 1, True)
	ElseIf (PaleBladeCount == 2)
		Game.GetPlayer().AddItem(PaleBlade02, 1, True)
	ElseIf (PaleBladeCount == 3)
		Game.GetPlayer().AddItem(PaleBlade03, 1, True)
	ElseIf (PaleBladeCount == 4)
		Game.GetPlayer().AddItem(PaleBlade04, 1, True)
	ElseIf (PaleBladeCount == 5)
		Game.GetPlayer().AddItem(PaleBlade05, 1, True)
	EndIf
	InvisibleActivator.Enable()
	swordVFXShader.Stop(SwordActivator)
	SwordActivator.Disable()
	If (!(PaleLady as Actor).IsDead())
		PaleLady.Moveto(PaleLadyRespawnPoint)
		Wisp01.MoveTo(Wisp1RespawnPoint)
		Wisp02.MoveTo(Wisp2RespawnPoint)
		Wisp03.MoveTo(Wisp3RespawnPoint)
		dunFrostmereBanishToggleQST.SetStage(ToggleStageToSetOnUnbanish)
		(PaleLady as dunFrostmereCryptFakeSummon).Summon()
		(Wisp01 as dunFrostmereCryptFakeSummon).Summon()
		(Wisp02 as dunFrostmereCryptFakeSummon).Summon()
		(Wisp03 as dunFrostmereCryptFakeSummon).Summon()
		PaleLady.Moveto(PaleLadyRespawnPoint)
		(PaleLady as Actor).SetAv("Variable06", 0)
		(PaleLady as Actor).EvaluatePackage()
		(Wisp01 as Actor).EvaluatePackage()
		(Wisp02 as Actor).EvaluatePackage()
		(Wisp03 as Actor).EvaluatePackage()
	EndIf
EndFunction
