scriptname giantActorSCRIPT extends actor

import objectReference

EVENT onLoad()
	; call reg function inside if statement.  If the event isn't found in the graph, function returns a false
	if (!RegisterForAnimationEvent(self, "giantStompEffect"))
; 	  debug.trace(self + "could not register for giantStompEffect")
	else
; 		debug.trace( self + " registered for animation event")
	endif
endEvent

EVENT onAnimationEvent(objectReference deliverator, string eventName)
	if eventName == "giantStompEffect"
; 		;Debug.Trace(self + " Got " + eventName + " from " + deliverator)
		; stagger nearby actors and apply some controller/screen shake if the player is nearby
		KnockAreaEffect(0.5, 2*getLength())
		rampRumble()
	endif
endEVENT
