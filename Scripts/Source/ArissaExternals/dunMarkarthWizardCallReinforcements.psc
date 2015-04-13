scriptName dunMarkarthWizardCallReinforcements extends ReferenceAlias
{Script for the Wizards' Guard to call for reinforcements during each major encounter.}

ObjectReference property reinforcementManager Auto

Event OnCombatStateChanged(Actor target, int aeCombatState)
	if (Self.GetActorRef().GetCombatState() == 1 && target == Game.GetPlayer()) ; 0 = not in combat, so non-zero means we entered combat
		reinforcementManager.Activate(Self.GetActorRef())
	EndIf
EndEvent