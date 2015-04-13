scriptName TrapDweThresherHit extends TrapHitBase
;
;
;
;=====================================================

state CannotHit
	Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
	endEvent
	
	Event OnAnimationEvent(objectReference eventObject, string eventString)
; 		debug.trace("animation event fired " + eventstring)
		if (eventObject == self)
			if (eventString == "hitReset")
				UnregisterForAnimationEvent(self, "hitReset")
; 				debug.trace("go to CanHit State")
				goToState("CanHit")
			endif
		endif
	endEvent
endState

;Event OnInit()
;			RegisterForAnimationEvent(self, "Apex")
;			RegisterForAnimationEvent(self, "Reset")
;endEvent



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Auto state CanHit	
	Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
		goToState("CannotHit")
		;Trace("OnTrapHit has fired")
		;Trace("hitOnce =")
		;Trace(hitOnce)
		;if akTarget == game.getPlayer()
		;Trace("Has hit player")
		;endif
		RegisterForAnimationEvent(self, "hitReset")
		;RegisterForAnimationEvent(self, "reset")
		
		akTarget.ProcessTrapHit(self, damage, trapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, 0.0)
		TrapHitSound.play( self as ObjectReference)		;play hit sound
		hitFX.fire(self, hitFxAmmo)
		CreateDetectionEvent(akTarget as actor, soundLevel) ; creates a detection event
		;Trace("Damage =")
		;Trace(damage)
			
	endEvent
endState
