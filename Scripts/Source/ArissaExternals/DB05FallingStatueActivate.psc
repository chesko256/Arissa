scriptName DB05FallingStatueActivate extends objectReference
;
;
;=========================================================
int property damage = 10000 auto hidden
int property soundLevel = 100 auto 
int property trapPushBack auto
sound property TrapHitSound auto
weapon property hitFX auto
ammo property hitFXAmmo auto
bool property trapCausesStagger = false Auto
{does this trap stagger actors
	default = false}
bool property rumble = false Auto
float property rumbleAmount = 0.7 Auto
float property rumbleDuration = 0.5 auto
bool property cameraShake = false Auto
float property cameraShakeAmount = 0.7 auto
float property staggerAmount = 0.0 auto
	
explosion property pushbackExplosion auto
explosion property placedExplosion auto

float property damageVelocityThreshold = 0.2 auto
objectReference property myTargetRef auto
{The only target that this will actually damage}
objectReference property fallingMarker Auto
float property moveSpeed = 300.0 auto
quest property myQuest auto 
int property stageToSet auto
bool property causeCrimeGold = True auto
{if this is true the cause actor is set as the player when this is used, which should result in crimegold
	default = TRUE}
	
bool property triggerOnHit = False auto
{if this is true when the statue is hit it will go to it's falling state
	default = FALSE}

;The following state is prequest so it cannot be used
state inactive
endState

;This state is started by the DB05 quest when the correct phase is active
auto State waiting
	event onActivate(objectReference TriggerRef)
		if TriggerRef == game.getPlayer()
			TriggerStatueFalling()
		endif
	endEvent

	event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if akAggressor == game.getPlayer() && TriggerOnHit
			TriggerStatueFalling()
		endif
	endEvent
endState

;This state is the falling state that should hurt vittoria
state Falling
	event onBeginState()
		
	endEvent

	Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
		;goToState("CannotHit")
		if akTarget == myTargetRef
			goToState("Complete")
			myQuest.SetStage(stageToSet)
			if acceptableVelocityDelta(damageVelocityThreshold, afXVel, afYVel, afZVel)
; 				debug.Trace(self + "               is dealing damage!!!")
				;damage = 40 ;THIS IS FOR A TEST ONLY
				self.setActorCause(game.GetPlayer())
				if causeCrimeGold
					(akTarget as actor).Kill(game.getPlayer())
				endif
				akTarget.ProcessTrapHit(self, damage, trapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, staggerAmount)
				if TrapHitSound
					TrapHitSound.play( self as ObjectReference)		;play hit sound
				endIf
				;hitFX.fire(self, hitFxAmmo)
				CreateDetectionEvent(akTarget as actor, soundLevel) ; creates a detection event
				CreateDetectionEvent(game.getPlayer(), 25)
				if rumble
					game.ShakeController(rumbleAmount, rumbleAmount, rumbleDuration)
				EndIf
				if cameraShake
					game.ShakeCamera(afStrength = cameraShakeAmount)
				endif
			endif
		endif
			
	endEvent
	
	event onAnimationEvent(ObjectReference akSource, string asEventName)
		if akSource == self && asEventName == "Done"
			UnregisterForAnimationEvent(self, "Done")
			goToState("Complete")
		endif
	endEvent
endState

;This state is the complete state for when it has finished falling or the quest phase is over
state Complete
	event onBeginState()
; 		debug.Trace(self + " has reached state Complete")
	endEvent

endState

event onLoad()
	;SetMotionType(4)
endEvent

;========================================================
function TriggerStatueFalling()
	;TranslateToRef(FallingMarker, moveSpeed)
	;SetMotionType(1)
	;ApplyHavokImpulse(0.0, 0.0, -1.0, 15.0)
	playAnimation("Down")
	registerForAnimationEvent(self, "Done")
	goToState("falling")
	utility.wait(0.2)
	if placedExplosion
		if getLinkedRef()
			getLinkedRef().placeAtMe(placedExplosion)	
		Else
			self.placeAtMe(placedExplosion)
		endif
	endif
endFunction

bool function acceptableVelocityDelta(float targetVelocity, float afXVel, float afYVel, float afZVel)
	float actualDeltaVelocity
	float xyDelta
	
	xyDelta = math.sqrt(math.pow(afXVel, 2) + math.pow(afYVel, 2))
	
	actualDeltaVelocity = math.sqrt(math.pow(xyDelta, 2) + math.pow(afZVel, 2))
	
	if actualDeltaVelocity >= targetVelocity
; 		;debug.trace(self + " actualVelocity >= targetVelocity")
; 		;debug.trace(self + " deltaX = " + afXVel)
; 		;debug.trace(self + " deltaY = " + afYVel)
; 		;debug.trace(self + " deltaZ = " + afZVel)
; 		;debug.trace(self + " targetVelocity = " + targetVelocity)
; 		;debug.trace(self + " totalDelta = " + actualDeltaVelocity)
		return True
	Else
; 		;debug.trace(self + " actualVelocity < targetVelocity")
; 		;debug.trace(self + " deltaX = " + afXVel)
; 		;debug.trace(self + " deltaY = " + afYVel)
; 		;debug.trace(self + " deltaZ = " + afZVel)
; 		;debug.trace(self + " targetVelocity = " + targetVelocity)
; 		;debug.trace(self + " totalDelta = " + actualDeltaVelocity)
		return False
	endif
endFunction


