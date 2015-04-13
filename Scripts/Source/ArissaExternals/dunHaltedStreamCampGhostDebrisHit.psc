scriptName dunHaltedStreamCampGhostDebrisHit extends referenceAlias
;
;
;
;=========================================

import utility

int property damage auto hidden
int property soundLevel = 10 auto 
int property trapPushBack auto
sound property TrapHitSound auto
weapon property hitFX auto
ammo property hitFXAmmo auto

Auto state CanHit	
	Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
		goToState("CannotHit")
		;Trace("OnTrapHit has fired")
		;Trace("hitOnce =")
		;Trace(hitOnce)
		;if akTarget == game.getPlayer()
		;Trace("Has hit player")
		;endif
		akTarget.ProcessTrapHit(self.getReference(), damage, trapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, 0.0)
		TrapHitSound.play( self.getReference())		;play hit sound
		hitFX.fire(self.getReference(), hitFxAmmo)
		getReference().CreateDetectionEvent(akTarget as actor, soundLevel) ; creates a detection event
		;Trace("Damage =")
		;Trace(damage)
			
	endEvent
endState

state CannotHit
	Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
	endEvent
endState
	