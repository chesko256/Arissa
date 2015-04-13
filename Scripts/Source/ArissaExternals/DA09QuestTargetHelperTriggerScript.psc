Scriptname DA09QuestTargetHelperTriggerScript extends ReferenceAlias  

Event OnTriggerEnter(ObjectReference akActionRef)
	
	if akActionRef == Game.GetPlayer()
; 		debug.trace("DA09QuestTargetHelperTriggerScript OnTriggerEnter() player entered")
		(GetOwningQuest() as DA09Script).PlayerInQTHelperTrigger += 1
	endif
	
	
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	
	if akActionRef == Game.GetPlayer()
; 		debug.trace("DA09QuestTargetHelperTriggerScript OnTriggerEnter() player left")
		(GetOwningQuest() as DA09Script).PlayerInQTHelperTrigger -= 1
	endif
	
EndEvent
