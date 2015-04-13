Scriptname ResourceObjectSawMillScript extends ResourceObjectScript  conditional
{This script controls saw mills and extends ResourceObjectScript}

;Description:
;This script is extending the parent script ResourceObjectScript.psc in which most of the properties and functions are declared. See that script for specifics.

;*** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;*** 	EVERY resource object MUST have an animation event named "DestructionComplete" that is sent when the sabotage animation is finished			***
;*** 	EVERY child script (like this one) MUST Register/Unregister for animation event named "DestructionComplete" in it's OnLoad/OnUnLoad events	***
;*** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

;Request:
;*** !!!! PLEASE DO NOT EDIT THIS SCRIPT WITHOUT SPEAKING TO ME FIRST. THANK YOU! --jduvall !!!! ***



;<ANIMATION EVENTS> -----------
Event OnLoad()
	RegisterForAnimationEvent(self, "DestructionComplete")			; sabotage complete -- *** ALL children scripts of ResourceObjectScript MUST register for this animation

	RegisterForAnimationEvent(self, "MillLogChuteIdle")			; log is loaded, ready to cut
	RegisterForAnimationEvent(self, "MillLogIdleReset")			; log cutting animation complete
	RegisterForAnimationEvent(self, "MillLogPileLoadStart")			; log loading animation started
endEvent

Event OnUnload()
	UnRegisterForAnimationEvent(self, "DestructionComplete")		;*** ALL children scripts of ResourceObjectScript MUST unregister for this animation

	UnRegisterForAnimationEvent(self, "MillLogChuteIdle")
	UnRegisterForAnimationEvent(self, "MillLogIdleReset")
	UnRegisterForAnimationEvent(self, "MillLogPileLoadStart")			
endEvent

;</ANIMATION EVENTS> -----------


;The parent script grabs the OnAnimationEvent and then calls this function passing in the Event Name
;The reason we do this is because the parent script needs to be the one that grabs the OnAnimationEvent to process the DestructionComplete event... but it passes along the asEventName from that event to this Function
;So by extending the ProcessAnimationEvent function in each child script, we can add control for each type of resource.
function ProcessAnimationEvent(string asEventName)
; 		debug.trace(self + "ProcessAnimationEvent(" + asEventName + ")")
		if asEventName == "MillLogPileLoadStart"
			ChangeState(busy)
		elseif asEventName == "MillLogChuteIdle"
			ChangeState(ready)
		elseif asEventName == "MillLogIdleReset"
			ChangeState(waiting)
		endif
EndFunction


;<ANIMATION CONTROL FUNCTIONS> -- called by GAME PLAY FUNCTIONS in parent script
function DestroyResource()
	playAnimation("MillLogCutSabotage")
 endFunction

function RepairResource()
	playAnimation("MillLogIdleReset")
endFunction
 
function WorkResource()
	playAnimationAndWait("MillLogChuteCut", "MillLogIdleReset")
EndFunction
;</ANIMATION CONTROL FUNCTIONS> -- called by GAME PLAY FUNCTIONS above

