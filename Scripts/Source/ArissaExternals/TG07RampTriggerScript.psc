scriptName TG07RampTriggerScript extends objectReference

formList property flDoesNotTrigger auto
Quest Property pTG07Quest Auto

auto state waiting
	event OnTriggerEnter(objectReference triggerRef)
		;if the trigger ref is not in an excluded formlist or an actor
		if !flDoesNotTrigger.hasForm(triggerRef as form) && !(triggerRef as actor)
			;if we have a linked ref
			if getLinkedRef()
				;we are done, go to state and activate linkedRef
				goToState("done")
				getLinkedRef().Activate(getLinkedRef())
				if pTG07Quest.IsObjectiveDisplayed(41) == 1
					pTG07Quest.SetObjectiveCompleted(41,1)
				endif				
			endif
		endif
	endEvent
endState

state done
endState
