Scriptname FXTimeWoundReadyScript extends ObjectReference  
{Triggers the time wound art to react when the player is holding the elder scroll}



Event OnTriggerEnter(ObjectReference akActionRef)
	self.SetAnimationVariableFloat("fToggleBlend", 1)
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	self.SetAnimationVariableFloat("fToggleBlend", 0)
EndEvent
