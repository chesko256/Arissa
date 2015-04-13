Scriptname TG03BreadcrumbTriggerScript extends ObjectReference  Conditional

GlobalVariable Property pTG03BC Auto
Quest Property pTG03Quest Auto
int Property pBreadNumber Auto
int Property pNewBreadNumber Auto
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if pTG03Quest.GetStage() == 60
			if pTG03BC.Value == pBreadNumber
				pTG03BC.Value = pNewBreadNumber
				pTriggered = 1
			endif
		endif
	endif

endEvent