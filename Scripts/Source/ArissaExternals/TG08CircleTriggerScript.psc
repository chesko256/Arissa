Scriptname TG08CircleTriggerScript extends ObjectReference  Conditional

int Property pTG08ASceneStarted Auto Conditional
Quest Property pTG08AQuest  Auto  Conditional
Scene Property pTG08OathScene  Auto  Conditional
TG08AQuestScript Property pTG08AQS  Auto  Conditional

event onTrigger (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG08ASceneStarted == 0
			if pTG08AQuest.getstage() == 52
				if pTG08AQS.pTG08ANPCCircle >= 2
					pTG08AQuest.SetStage(55)
					pTG08ASceneStarted = 1
				endif
			endif
		endif
	endif

endevent

