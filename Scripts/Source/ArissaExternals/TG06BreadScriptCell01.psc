Scriptname TG06BreadScriptCell01 extends ObjectReference  Conditional

TG06QuestScript Property TG06  Auto
Quest Property pTG06Quest Auto


Event OnTriggerEnter(ObjectReference akActionRef)

	if TG06.pTG06Bread == 0
		if pTG06Quest.IsRunning() == 1
			if pTG06Quest.GetStage() >= 20
				if akActionRef == Game.GetPlayer()
					TG06.pTG06Bread = 1
					TG06.SetStage(30)
				endif
			endif
		endif
	endif

endEvent
