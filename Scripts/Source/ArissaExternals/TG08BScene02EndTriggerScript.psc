Scriptname TG08BScene02EndTriggerScript extends ObjectReference  Conditional

ObjectReference Property pTG08BToggle  Auto  Conditional
ReferenceAlias Property pTG08BMercerAlias  Auto  
ObjectReference Property pTG08BMercerEndMarker  Auto  
int Property pTG08BTriggered  Auto
Quest Property pTG08BQuest Auto
Scene Property pTG08BScene  Auto  Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BTriggered == 0
			pTG08BScene.Stop()
			pTG08BMercerAlias.GetActorRef().MoveTo(pTG08BMercerEndMarker)
			(pTG08BQuest as TG08BQuestScript).pTG08BScene02Done = 1
			pTG08BToggle.Enable()
			pTG08BTriggered = 1
		endif
	endif

endEvent
