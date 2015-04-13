ScriptName DA10DeadBodyScript extends ReferenceAlias

Cell Property MarkarthAbandonedHouse Auto
Location Property MarkarthAbandonedHouseLocation Auto


Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	If (MarkarthAbandonedHouseLocation == Self.GetActorRef().GetCurrentLocation())
		;do nothing
	Elseif GetOwningQuest().GetStage() >= 10
		if (akTarget == Game.GetPlayer())
			if (aeCombatState == 1)
				GetOwningQuest().SetStage(500)
			EndIf
		EndIf
	EndIf
endEvent

Event OnDeath(Actor akKiller)
	If (MarkarthAbandonedHouseLocation == Self.GetActorRef().GetCurrentLocation())
		GetOwningQuest().SetStage(70)
	Elseif GetOwningQuest().GetStage() >= 10
		GetOwningQuest().SetStage(500)
	EndIf
EndEvent

Event OnUnload()
	If Self.GetActorRef().IsDead() == True
		Self.GetActorRef().Delete()
	EndIf
EndEvent