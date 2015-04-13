Scriptname TG06BreadTriggerScript extends ObjectReference  Conditional

TG06QuestScript Property TG06  Auto
Quest Property pTG06Quest Auto


Event OnTriggerEnter(ObjectReference akActionRef)

	if TG06.pTG06Bread == 2
		if pTG06Quest.IsRunning() == 1
			if akActionRef == Game.GetPlayer()
				TG06.pTG06Bread = 3
			endif
		endif
	endif

endEvent