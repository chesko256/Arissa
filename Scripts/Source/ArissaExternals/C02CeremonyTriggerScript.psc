Scriptname C02CeremonyTriggerScript extends ObjectReference  

Quest Property OwnerQuest auto

Event OnTriggerEnter(ObjectReference akActivator)
	;Debug.MessageBox("IN THE BOX.")
	if (OwnerQuest.IsRunning())
		if (Game.GetPlayer() == akActivator)
			if (Game.GetPlayer().IsInCombat())
				Game.GetPlayer().StopCombatAlarm()
			endif
			Game.DisablePlayerControls()
			(OwnerQuest as C02QuestScript).PlayerEnteredCeremonyRoom = true
			(OwnerQuest as C02QuestScript).PlayerTalkedToQuestgiver = true
			Delete()
		endif
	endif
EndEvent
