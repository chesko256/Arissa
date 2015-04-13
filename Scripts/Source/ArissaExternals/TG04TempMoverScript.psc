Scriptname TG04TempMoverScript extends ObjectReference  Conditional

Quest Property pTG04Quest  Auto  Conditional
ReferenceAlias Property pTG04GulumEi  Auto  Conditional
ObjectReference Property pTG04GulumMarker Auto Conditional

event onActivate (objectReference activateRef)


	if activateRef == Game.GetPlayer()
		if pTG04Quest.getstage() == 40
			pTG04GulumEi.GetActorRef().moveto(pTG04GulumMarker)
			TG04QuestScript pTG04Script = pTG04Quest as TG04QuestScript
			pTG04Script.pTG04TempMove = 1
			pTG04Quest.setstage(50)
		endif
	endif

endevent

