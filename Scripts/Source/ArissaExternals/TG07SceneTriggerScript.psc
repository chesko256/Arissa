Scriptname TG07SceneTriggerScript extends ObjectReference  Conditional

int Property pTG07SceneStart  Auto  Conditional
Quest Property pTG07Quest  Auto  Conditional

event onTriggerEnter (objectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG07SceneStart == 0
			if pTG07Quest.GetStage() == 20
				pTG07Quest.SetStage(25)
				pTG07SceneStart = 1
				Disable()
			endif
		endif
	endif

endevent