Scriptname TG08GuildSceneTriggerScript extends ObjectReference  Conditional

int Property pTG08ASceneStart  Auto  Conditional
Quest Property pTG08AQuest  Auto  Conditional
TG08AQuestScript Property pTG08AQuestScript  Auto  Conditional

event onTrigger (objectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08AQuest.IsRunning() == 1
			if pTG08ASceneStart == 0
				if pTG08AQuest.GetStage() == 10
					if pTG08AQuestScript.pTG08AReady >= 2
						pTG08AQuest.SetStage(15)
						pTG08ASceneStart = 1
						Disable()
					endif
				endif
			endif
		endif
	endif

endevent