Scriptname TG08APreOathTriggerScript extends ObjectReference  Conditional

Quest Property pTG08AQuest  Auto  Conditional
Scene Property pTG08APreOathScene Auto Conditional

Event OnTrigger(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08AQuest.GetStage() == 45
			pTG08APreOathScene.Start()
		endif
	endif

endEvent