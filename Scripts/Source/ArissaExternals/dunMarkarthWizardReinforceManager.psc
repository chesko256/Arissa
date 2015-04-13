scriptName dunMarkarthWizardReinforceManager extends ObjectReference
{Script for summoning reinforcements in the Wizards' Quarters.}

Quest property MarkarthWizardsQuest Auto
ReferenceAlias property CallerForHelp Auto
ReferenceAlias property ReinforcementSlot1 Auto
ReferenceAlias property ReinforcementSlot2 Auto
Faction property SecureAreaFaction Auto

ObjectReference property ReinforcementsEnabledMarker Auto

ActorBase property ReinforcementType1 Auto
ActorBase property ReinforcementType2 Auto
int property ReinforcementLevelMod Auto
EncounterZone property ReinforcementEncZone Auto

ObjectReference property CallerForHelpMarker Auto

ObjectReference property SpawnPoint1 Auto
ObjectReference property SpawnPoint2 Auto

ObjectReference property DoorForKey Auto

Actor tmp

Auto State Initial
Event OnActivate(ObjectReference akactivator)
	GoToState("AllDone")
	CallerForHelpMarker.MoveTo(akActivator)
	if (!ReinforcementsEnabledMarker.IsDisabled())
		ReinforcementsEnabledMarker.Disable()
		If (SpawnPoint1 != None)
			tmp = SpawnPoint1.PlaceActorAtMe(ReinforcementType1, ReinforcementLevelMod, ReinforcementEncZone)
			tmp.AddToFaction(SecureAreaFaction)
			ReinforcementSlot1.ForceRefTo(tmp)
			(tmp as dunMarkarthWizard_EVPReinforcements).EVPReinforcement()
			tmp.EvaluatePackage()
		EndIf
		If (SpawnPoint2 != None)
			tmp = SpawnPoint2.PlaceActorAtMe(ReinforcementType2, ReinforcementLevelMod, ReinforcementEncZone)
			tmp.AddToFaction(SecureAreaFaction)
			ReinforcementSlot2.ForceRefTo(tmp)
			(tmp as dunMarkarthWizard_EVPReinforcements).EVPReinforcement()
			tmp.EvaluatePackage()
		EndIf
	EndIf
EndEvent
EndState

State AllDone
	Event OnActivate(ObjectReference obj)
	   ;Do nothing.
	EndEvent
EndState