scriptName HazardBase extends objectReference
;
;
;============================================
import utility

int property damage auto hidden
int property soundLevel = 10 auto 
int property trapPushBack auto
sound property TrapHitSound auto
weapon property hitFX auto
ammo property hitFXAmmo auto
int property trapLevel = 1 auto
bool isWaitingToEvaluate = False
float property staggerAmount = 0.0 auto
bool property CheckAngle = false auto
{if true this will check the angle of the actors velocity to the "up" vector of the trap
	default == False}


auto State CanHit
	
	Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
; 		debug.Trace(self + ": TrapHit")
; 		debug.Trace(self + ": XYZ = (" + afXPos + "," + afYPos + "," +afZPos + ")")
		if !CheckAngle
			doLocalHit(akTarget, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, abInitialHit, aeMotionType)
		else
			if isAngleAcceptable(afXVel, afYVel, afZVel)
				doLocalHit(akTarget, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, abInitialHit, aeMotionType)
			endif
		endif
	endEvent
	
	
	Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
; 		debug.Trace(self + ": TrapHitStart")
; 		debug.Trace(self + ": XYZ = (" + afXPos + "," + afYPos + "," +afZPos + ")")
		if !CheckAngle
			doLocalHit(akTarget, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, abInitialHit, aeMotionType)
		else
			if isAngleAcceptable(afXVel, afYVel, afZVel)
				doLocalHit(akTarget, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, abInitialHit, aeMotionType)
			endif
		endif
	endEvent
EndState

State CannotHit
endState

event onLoad()
	ResolveLeveledDamage()				;set damage appropriate to player level
endEvent

event onUpdate()
	unRegisterForUpdate()
	;EvaluateStoredRefs()
	isWaitingToEvaluate = FALSE
endEvent

function doLocalHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
	akTarget.ProcessTrapHit(self, damage, trapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, staggerAmount)
; 	debug.Trace(self + " has hit " + akTarget)
	TrapHitSound.play( self as ObjectReference)		;play hit sound
	hitFX.fire(self, hitFxAmmo)
	CreateDetectionEvent(akTarget as actor, soundLevel) ; creates a detection event
endFunction



bool function isAngleAcceptable(float afXVel, float afYVel, float afZVel)
	float maxZVelocity = 1.0
	float minZVelocity = 0.3
	; float selfX
	; float selfY
	; float selfZ
	; float selfNodeX
	; float selfNodeY
	; float selfNodeZ
	
	
	
	; float dotProduct
	; dotProduct = sqrt()
	; if acos(MAXANGLE) < dotProduct
	
; 	debug.trace (self + ": X velocity = " + afXVel)
; 	debug.trace (self + ": Y velocity = " + afYVel)
; 	debug.trace (self + ": Z velocity = " + afZVel)
	
	float absoluteZ = (math.abs(afZVel))
	float absoluteY = math.abs(afYVel)
	float absoluteX = math.abs(afXVel)
	if  absoluteZ  >= maxZVelocity
		return true
	elseif absoluteZ  >= minZVelocity
		if (absoluteZ * (0.6)) >= absoluteY 
			return True
		elseif (absoluteZ * (0.6)) >= absoluteX
			Return True
		else
			return False
		endif
	else
		return false
	endif
endFunction

;======================================================

	
int property LvlThreshold1 auto
int property LvlDamage1 auto
int property LvlThreshold2 auto
int property LvlDamage2 auto
int property LvlThreshold3 auto
int property LvlDamage3 auto
int property LvlThreshold4 auto
int property LvlDamage4 auto
int property LvlThreshold5 auto
int property LvlDamage5 auto
int property LvlDamage6 auto

;int Function ResolveLeveledDamage (int damage)
Function ResolveLeveledDamage()
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	damage = LvlDamage1
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		damage = LvlDamage2
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		damage = LvlDamage3
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		damage = LvlDamage4
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		damage = LvlDamage5
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		damage = LvlDamage6
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	;Trace("damage =")
	;Trace(damage)
	
	;return damage
EndFunction

	