Scriptname T01InnerSanctumTriggerScript extends ObjectReference

Quest Property T01 auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (Game.GetPlayer() == akActivator)
		(T01 as T01QuestScript).PlayerInInnerSanctum = True
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	if (Game.GetPlayer() == akActivator)
		(T01 as T01QuestScript).PlayerInInnerSanctum = False
	endif
EndEvent
