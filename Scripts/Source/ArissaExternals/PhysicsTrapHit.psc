scriptName PhysicsTrapHit extends TrapHitBase
;
;
;
;=========================================

import utility

float property damageVelocityThreshold = 6.0 auto
{This sets the velocity needed to apply damage
	It is non-squareroot of the delta velocity as recieved from the TrapHit
	Default = 6.0
	This should NOT be changed on the Ref except in rare cases}

Auto state CanHit	
	Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
		;goToState("CannotHit")
		
		if acceptableVelocityDelta(damageVelocityThreshold, afXVel, afYVel, afZVel)
; 			debug.Trace(self + "               is dealing damage!!!")
			;damage = 40 ;THIS IS FOR A TEST ONLY
			if !(akTarget as actor).hasSpell(ghostAbility) && !(akTarget as actor).IsInFaction(noHitFaction)
				if hitOnlyOnce
					goToState("CannotHit")
				endif
				if akTarget == game.GetPlayer()
					if rumble
						game.ShakeController(rumbleAmount, rumbleAmount, rumbleDuration)
					EndIf
					if cameraShake
						game.ShakeCamera(afStrength = cameraShakeAmount)
					endif
				endif
				akTarget.ProcessTrapHit(self, damage, trapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, staggerAmount)
				if TrapHitSound
					TrapHitSound.play( self as ObjectReference)		;play hit sound
				endif
				;hitFX.fire(self, hitFxAmmo)
				CreateDetectionEvent(akTarget as actor, soundLevel) ; creates a detection event
			endif
		endif
			
	endEvent
endState

state CannotHit
	Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
	endEvent
endState
	
	
bool function acceptableVelocityDelta(float targetVelocity, float afXVel, float afYVel, float afZVel)
	float actualDeltaVelocity
	float xyDelta
	
	;xyDelta = math.sqrt(math.pow(afXVel, 2) + math.pow(afYVel, 2))
	
	;actualDeltaVelocity = math.sqrt(math.pow(xyDelta, 2) + math.pow(afZVel, 2))
	
	;actualDeltaVelocity = (math.abs(afxVel) + math.abs(afYVel) + math.abs(afZVel))
	actualDeltaVelocity = ((afxVel * afxVel) + (afyVel * afyVel) + (afZVel * afZVel))
	
	if actualDeltaVelocity >= targetVelocity
; 		debug.trace(self + " actualVelocity >= targetVelocity")
; 		debug.trace(self + " deltaX = " + afXVel)
; 		debug.trace(self + " deltaY = " + afYVel)
; 		debug.trace(self + " deltaZ = " + afZVel)
; 		debug.trace(self + " targetVelocity = " + targetVelocity)
; 		debug.trace(self + " totalDelta = " + actualDeltaVelocity)
		return True
	Else
; 		debug.trace(self + " actualVelocity < targetVelocity")
; 		debug.trace(self + " deltaX = " + afXVel)
; 		debug.trace(self + " deltaY = " + afYVel)
; 		debug.trace(self + " deltaZ = " + afZVel)
; 		debug.trace(self + " targetVelocity = " + targetVelocity)
; 		debug.trace(self + " totalDelta = " + actualDeltaVelocity)
		return False
	endif
	
	
endFunction
	