Scriptname WEDL06LetrushCleanupTriggerScript extends ObjectReference  

quest property MS03 auto
actorBase property LouisLetrush auto

event onTrigger(objectReference triggerRef)
	if MS03.getStageDone(200) && (triggerRef as actor).getActorBase() == LouisLetrush
		triggerRef.disable()	
		triggerRef.deleteWhenAble()
	endif
endEvent