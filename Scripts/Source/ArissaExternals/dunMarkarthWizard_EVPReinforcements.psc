scriptname dunMarkarthWizard_EVPReinforcements extends Actor
{For Wizards' Quarters Guards that are reinforcements, EVP them until they enter combat with the player to avoid awkward delays.}

bool runEVPLoop

;Stop the loop when the cell unloads.
Event OnUnload()
	runEVPLoop =  False
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	runEVPLoop =  False
EndEvent

Function EVPReinforcement()
	runEVPLoop = True
	While(runEVPLoop)
		Utility.Wait(2)
		Self.EvaluatePackage()
	EndWhile
EndFunction