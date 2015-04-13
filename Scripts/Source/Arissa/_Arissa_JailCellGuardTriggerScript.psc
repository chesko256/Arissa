Scriptname _Arissa_JailCellGuardTriggerScript extends ObjectReference  

ObjectReference property CellDoor auto
Faction property GuardDialogueFaction auto
Scene property _Arissa_MQ01_GoToJailScene auto
Quest property JailQuest auto
Quest property _Arissa_MQ01 auto
Faction property GuardFactionFalkreath auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef as Actor).IsInFaction(GuardDialogueFaction) && !(_Arissa_MQ01_GoToJailScene.IsPlaying())
		if CellDoor.GetOpenState() == 1
			CellDoor.Activate(akActionRef)
		endif
	endif
endEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if (akActionRef as Actor) == Game.GetPlayer() && JailQuest.IsRunning() && _Arissa_MQ01_GoToJailScene.IsPlaying()
		GuardFactionFalkreath.SendAssaultAlarm()

		;Arissa makes a run for it
		_Arissa_MQ01.SetStage(100)
		if _Arissa_MQ01.IsObjectiveDisplayed(101)
			_Arissa_MQ01.SetObjectiveCompleted(101)
		endif
	endif
endEvent