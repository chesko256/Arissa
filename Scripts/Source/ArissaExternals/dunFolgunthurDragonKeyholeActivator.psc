scriptName dunFolgunthurDragonKeyholeActivator extends ObjectReference
{Script for the freestanding dragon claw activators in Folgunthur.}

MiscObject property myClawObject Auto
{The claw used by the activator.}

Message property ActivateDuringCombatMessage Auto
{Message if the player tries to activate this during combat.}

Message property ActivateWithoutObjMessage Auto
{Message if the player tries to activate this without the claw.}

Keyword property InitialActivationLink Auto
{Linkedref to activate as soon as the player activates the activator.}

Keyword property MainActivationLink Auto
{Linkedref to activate once the animation has played.}

auto State Ready
	Event OnActivate(ObjectReference triggerRef)
		if (game.GetPlayer().GetItemCount(myClawObject) >= 1)
			GetLinkedRef(InitialActivationLink).Activate(Self)
			playAnimation("Trigger01")
			Utility.Wait(3)
			GetLinkedRef(MainActivationLink).Activate(Self)
		Else
			ActivateWithoutObjMessage.show()
		EndIf
	EndEvent
EndState