Scriptname FXGreybeardShoutScript extends ObjectReference  
{automatically plays animation when it loads 3D}

auto State waiting

	event OnLoad()
		; when loaded, animate
		gotoState("playing")
		PlayAnimation("Play")
		; TEST - try moving sound here
		SoundEnableMarker.Enable()
		RegisterForAnimationEvent(self, "End")			; play animation complete
	endEvent

endState

state playing

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)

; 		debug.trace(self + "OnAnimationEvent() recieved " + asEventName)

		if asEventName == "End"
;			SoundEnableMarker.Enable()
			utility.wait(3)
			WordTrigger.Enable()
			gotoState("waiting")
		EndIf
	EndEvent

	; patch 1.9:
	event OnCellDetach()
			debug.trace(self + "playing: OnCellDetach - enable trigger")
			WordTrigger.Enable()
			gotoState("waiting")
	endEvent

endState

function GoAway()
; 	debug.trace(self + "GoAway()")
	while getState() =="playing"
		; do nothing
; 		debug.trace(self + " ... waiting for Play anim to finish...")
		utility.wait(1)
	endWhile
	gotoState("goingaway")
	LearnWordFadeLoop02.ApplyCrossfade(0.5)
	PlayAnimation("Away")
	utility.wait(1.5)
	ImageSpaceModifier.RemoveCrossFade(0.5)
endFunction

state goingaway

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)

; 		debug.trace(self + "OnAnimationEvent() recieved " + asEventName)

		if asEventName == "End"
			gotoState("done")
			; TEST - try not waitingn at all...
;			utility.wait(3)
			; disable the sounds
			SoundEnableMarker.Disable()
		EndIf
	EndEvent

endState

state done
	; do nothing
	event OnUnload()
		disable()
	endEvent
endState

ObjectReference Property WordTrigger  Auto  
{trigger box for learning the word}

ObjectReference Property SoundEnableMarker  Auto  
{enable marker for associated sounds}




ImageSpaceModifier Property LearnWordFadeLoop02  Auto  
