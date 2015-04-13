scriptname dunRebelsCairnSwordInStoneManager extends ObjectReference
{Activator for the 'Sword in the Stone' puzzle in Rebel's Cairn.}

Weapon property RebelsCairnBaseSword Auto
{The base sword the player can put into the activator.}

Weapon property RebelsCairnUpgradedSword Auto
{The upgraded sword the player can put into the activator.}

Message property NoSwordMessage Auto
{Message to display if the player doesn't have either.}

ObjectReference property RebelsCairnInvisibleActivator Auto
{The invisible box activator.}

ObjectReference property RebelsCairnBaseSwordActivator Auto
{The 'fake sword' activator for the base sword.}

ObjectReference property RebelsCairnUpgradedSwordActivator Auto
{The 'fake sword' activator for the upgraded sword.}

ObjectReference property secretDoor Auto
{The secret door ppened by the puzzle.}

ObjectReference property glowVFX Auto
{Effect to turn on when the player kills Red Eagle.}

ObjectReference property doorCollision Auto
{Backup collision for the secret door.}

Sound property rumbleSFX Auto
{Sound for the door opening.}

Quest property dunRebelsCairnQST Auto
{Quest for Rebel's Cairn / Red Eagle Redoubt.}

bool glowOn = False

Auto State Active
	Event OnActivate(ObjectReference triggerRef)
		gotoState("Busy")
		if (triggerRef == RebelsCairnInvisibleActivator)
			ActivateBox()
		Else
			ActivateSword(triggerRef)
		EndIf
		gotoState("Active")
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference triggerRef)
		;Do Nothing
	EndEvent
EndState


;If the player has activated the invisible trigger box, handle that activation.
Function ActivateBox()
	;Does the player have one of the swords we're looking for?
	bool hasSword = (Game.GetPlayer().GetItemCount(RebelsCairnBaseSword) > 0 || Game.GetPlayer().GetItemCount(RebelsCairnUpgradedSword) > 0)
	if (!hasSword)
		NoSwordMessage.Show()
	ElseIf (!(secretDoor.GetOpenState() == 2 || secretDoor.GetOpenState() == 4))
		if (Game.GetPlayer().GetItemCount(RebelsCairnBaseSword) > 0)
			Game.GetPlayer().RemoveItem(RebelsCairnBaseSword, 1, True)
			RebelsCairnInvisibleActivator.Disable()
			RebelsCairnBaseSwordActivator.Enable()
		Else
			Game.GetPlayer().RemoveItem(RebelsCairnUpgradedSword, 1, True)
			RebelsCairnInvisibleActivator.Disable()
			RebelsCairnUpgradedSwordActivator.Enable()
		EndIf
		dunRebelsCairnQST.SetStage(30)
		;doorCollision.Enable()
		secretDoor.Activate(Self)
		Utility.Wait(0.5)
		RebelsCairnInvisibleActivator.RampRumble()
		rumbleSFX.Play(doorCollision)
		;While (secretDoor.GetOpenState() == 2 || secretDoor.GetOpenState() == 4)
		;	Utility.Wait(0.25)
		;EndWhile
		;doorCollision.Disable()
	EndIf
EndFunction

Function ActivateSword(ObjectReference triggerRef)
; 	;Debug.Trace("Activating sword. " + triggerRef + " " + secretDoor.GetOpenState())
	If (!(secretDoor.GetOpenState() == 2 || secretDoor.GetOpenState() == 4))
		if (triggerRef == RebelsCairnBaseSwordActivator)
			Game.GetPlayer().AddItem(RebelsCairnBaseSword, 1, False)
		Else
			Game.GetPlayer().AddItem(RebelsCairnUpgradedSword, 1, False)
		EndIf
		RebelsCairnInvisibleActivator.Enable()
		RebelsCairnBaseSwordActivator.Disable()
		RebelsCairnUpgradedSwordActivator.Disable()
		doorCollision.Enable()
		secretDoor.Activate(Self)
		if (glowOn)
			glowOn = False
			glowVFX.DisableNoWait(True)
		EndIf
		While (secretDoor.GetOpenState() == 2 || secretDoor.GetOpenState() == 4)
			Utility.Wait(0.25)
		EndWhile
		doorCollision.Disable()
	EndIf
EndFunction

Function UpgradeSword()
; 	;Debug.Trace("Upgrading Sword")
	if (!RebelsCairnBaseSwordActivator.IsDisabled())
		RebelsCairnBaseSwordActivator.Disable()
		RebelsCairnUpgradedSwordActivator.Enable()
		glowVFX.EnableNoWait(True)
		glowOn = True
	EndIf
EndFunction


