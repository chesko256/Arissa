Scriptname MQ103BookScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
; 	debug.trace(self + " OnContainerChanged to " + akNewContainer)
	if akNewContainer == Game.GetPlayer()
		GetOwningQuest().SetStage(180)
	endif
endEvent
