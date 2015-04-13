scriptName TrapFlamethrower Extends TrapBase
;
;
;
;=========================================

spell property magicWeapon auto hidden
;ammo property magicWeaponAmmo auto
float property initialDelay = 0.5 auto hidden
float property firingRate = 7.0 auto hidden
float property firingRateOverride = 0.0 auto
{Overrides the spedified firing rate if > 0.0
	only used for a few special uses}
float property firingSpinup = 0.5 auto hidden
int property castingAim = 0 auto
{use to determin how the aiming type of the magic cast
	0 = straight fire (default)
	1 = fire at linked Ref
	2 = fire at the object that activated my trigger}
objectReference property targetRef auto hidden
bool property forwardFiring = false auto
int property aaSpellToCast = 2 Auto
{The type of spell to cast, the leveled version is resolved internally
	0 = firebolt
	1 = fireball
	2 = flames
	3 = lightning bolt
	4 = chain lightning
	5 = sparks
	6 = ice spike
	7 = frostbite
	8 = ice storm
}
 
import utility
import game
import math

bool finishedFiring = false
bool weaponResolved = false
bool concentrationCastLoop = false

bool property isFiring auto hidden
bool property isLoaded auto hidden



event onLoad()
	if !weaponResolved
		ResolveLeveledWeapon ()
		weaponResolved = True
	endif
	isLoaded = TRUE
	if isFiring == True
		fireTrap()
	endif
EndEvent

event onUnload()
; 	debug.Trace(self + " has recieved onUnload event")
	isLoaded = FALSE
endEvent

Function fireTrap()
	isFiring = True
	if !weaponResolved
		ResolveLeveledWeapon()
		weaponResolved = True
	endif
	if trapDisarmed == false
		;playAnimation("alarm")
		;WindupSound.play( self as ObjectReference)		;play windup sound
		;wait( initialDelay )		;wait for windup
		wait(firingSpinup)
		while(finishedFiring == False) && isLoaded == TRUE
			;playAnimation("fire")
			;if statement to handle concentration casting loop
			if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
				if concentrationCastLoop == false
					fireByCastingType()		;does the actual casting
					concentrationCastLoop = True
				endif
			Else
				fireByCastingType()		;does the actual casting
			endif
			finishedFiring = True
			
			;playAnimation("alarm")
			wait(firingRate)
			
			if (loop == TRUE)			;Reset Limiter
				resetLimiter()
			endif
			
		endWhile
		concentrationCastLoop = false
		if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
			interruptCast()
		endif
		
		if isLoaded 	
			isFiring = false
			;playAnimation("idle")
			goToState("Reset")
		endif
	endif

endFunction

State Reset

	Event OnBeginState()
		;TRACE("State Reset")
		GoToState ( "Idle" )
		;TrapHitBase hitBase = (self as objectReference) as TrapHitBase
		;hitBase.goToState("CanHit")
	endEvent
	
	Event OnActivate( objectReference activateRef )
	EndEvent
	
endState

function resetLimiter()
	finishedFiring = false
endFunction

function fireByCastingType()
	if	castingAim == 0
		magicWeapon.cast(self)
	elseIf castingAim == 1
		if forwardFiring
			if refIsValidForwardTarget(getLinkedRef())
				magicWeapon.cast(self, getLinkedRef())
			Else
				magicWeapon.cast(self)
			endif
		Else
			magicWeapon.cast(self, getLinkedRef())
		endif
	ElseIf castingAim == 2
		targetRef = (lastActivateRef as traptriggerbase).lastTriggerRef
		if forwardFiring
			if refIsValidForwardTarget(targetRef)
				magicWeapon.cast(self, targetRef)
			Else
				magicWeapon.cast(self)
			endif
		Else
			magicWeapon.cast(self, targetRef)
		endif
	Else
; 		debug.Trace(self + " error: castingAim = " + castingAim)
	endif
endFunction

float property horizontalSweepHalf = 90.0 auto
float property verticalSweepHalf = 90.0 auto

bool function refIsValidForwardTarget(objectReference testRef)
; 	debug.Trace(self + " is checking if refIsValidForwardTarget on " + testRef)
	float deltaX = testRef.X - self.X
	float deltaY = testRef.Y - self.Y
	float deltaZ = testRef.Z - self.Z
	
	float fAngleToRef = atan(deltaX/deltaY)
	if (deltaX < 0.0) && (deltaY < 0.0)
		fAngleToRef = fAngleToRef + 180
	endIf
	float deltaAngle = self.getAngleZ()-fAngletoRef
	if (deltaAngle < -180.0)
		deltaAngle = deltaAngle + 360.0
	endIf
	if (deltaAngle > 180.0)
		deltaAngle = deltaAngle - 360.0
	endIf
	
	if Abs(deltaAngle) < horizontalSweepHalf
; 		debug.Trace(self + " is firing at a valid angle at " + testRef)
		return true
	Else
; 		debug.Trace(self + " could not fire at a valid angle at " + testRef)
		return False
	endif
endFunction

;-----------------------------------------------

int property TESTLvlEncValue auto
int property LvlThreshold1 auto
spell property LvlWeapon1 auto hidden
int property LvlThreshold2 auto
spell property LvlWeapon2 auto hidden
int property LvlThreshold3 auto
spell property LvlWeapon3 auto hidden
int property LvlThreshold4 auto
spell property LvlWeapon4 auto hidden
int property LvlThreshold5 auto
spell property LvlWeapon5 auto hidden
spell property LvlWeapon6 auto hidden

bool spellAndCastingTypeResolved = false
Function ResolveLeveledWeapon ()
; 	debug.Trace(self + " trying to ResolveLeveledWeapon")
	if spellAndCastingTypeResolved == false
		ResolveSpellType()
		ResolveCastingDelay()
		spellAndCastingTypeResolved = True
	endif
	int damageLevel
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	spell lvlWeapon = LvlWeapon1
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		lvlWeapon = LvlWeapon2
		;Trace("damage threshold =")
		;Trace("2")
	elseif (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		lvlWeapon = LvlWeapon3
		;Trace("damage threshold =")
		;Trace("3")
	elseif (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		lvlWeapon = LvlWeapon4
		;Trace("damage threshold =")
		;Trace("4")
	elseif (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		lvlWeapon = LvlWeapon5
		;Trace("damage threshold =")
		;Trace("5")
	elseif (damageLevel > LvlThreshold5)
		lvlWeapon = LvlWeapon6
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	magicWeapon = lvlWeapon
EndFunction

function ResolveCastingDelay()
; 	debug.Trace(self + " trying to ResolveCastingDelay")
	if castingAim == 0
		initialDelay = 0.5
		if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
			firingRate = 7.0
		else
			firingRate = 2.0
		endif
		
	elseif castingAim == 1
		initialDelay = 0.5
		if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
			firingRate = 7.0
		else
			firingRate = 2.0
		endif
	elseif castingAim == 2
		initialDelay = 0.5
		if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
			firingRate = 7.0
		else
			firingRate = 2.0
		endif
	Else
; 		debug.Trace(self + " cannot resolveCastingDelay: unknown castingAim")
	endIf
	
	if firingRateOverride > 0.0
		firingRate = firingRateOverride
	endif
endFunction

function ResolveSpellType()
; 	debug.Trace(self + " trying to ResolveSpellType")
	if	aaSpellToCast == 0
		LvlWeapon1 = sLvlfirebolt1
		LvlWeapon2 = sLvlfirebolt2
		LvlWeapon3 = sLvlfirebolt3
		LvlWeapon4 = sLvlfirebolt4
		LvlWeapon5 = sLvlfirebolt5
		LvlWeapon6 = sLvlfirebolt6
	elseif aaSpellToCast == 1
		LvlWeapon1 = sLvlfireball1
		LvlWeapon2 = sLvlfireball2
		LvlWeapon3 = sLvlfireball3
		LvlWeapon4 = sLvlfireball4
		LvlWeapon5 = sLvlfireball5
		LvlWeapon6 = sLvlfireball6
	elseif aaSpellToCast == 2
		LvlWeapon1 = sLvlFlames1
		LvlWeapon2 = sLvlFlames2
		LvlWeapon3 = sLvlFlames3
		LvlWeapon4 = sLvlFlames4
		LvlWeapon5 = sLvlFlames5
		LvlWeapon6 = sLvlFlames6
	elseif aaSpellToCast == 3
		LvlWeapon1 = sLvlLightningBolt1
		LvlWeapon2 = sLvlLightningBolt2
		LvlWeapon3 = sLvlLightningBolt3
		LvlWeapon4 = sLvlLightningBolt4
		LvlWeapon5 = sLvlLightningBolt5
		LvlWeapon6 = sLvlLightningBolt6
	elseif aaSpellToCast == 4
		LvlWeapon1 = sLvlChainLightning1
		LvlWeapon2 = sLvlChainLightning2
		LvlWeapon3 = sLvlChainLightning3
		LvlWeapon4 = sLvlChainLightning4
		LvlWeapon5 = sLvlChainLightning5
		LvlWeapon6 = sLvlChainLightning6
	elseif aaSpellToCast == 5
		LvlWeapon1 = sLvlSparks1
		LvlWeapon2 = sLvlSparks2
		LvlWeapon3 = sLvlSparks3
		LvlWeapon4 = sLvlSparks4
		LvlWeapon5 = sLvlSparks5
		LvlWeapon6 = sLvlSparks6
	elseif aaSpellToCast == 6
		LvlWeapon1 = sLvlIceSpike1
		LvlWeapon2 = sLvlIceSpike2
		LvlWeapon3 = sLvlIceSpike3
		LvlWeapon4 = sLvlIceSpike4
		LvlWeapon5 = sLvlIceSpike5
		LvlWeapon6 = sLvlIceSpike6
	elseif aaSpellToCast == 7
		LvlWeapon1 = sLvlFrostBite1
		LvlWeapon2 = sLvlFrostBite2
		LvlWeapon3 = sLvlFrostBite3
		LvlWeapon4 = sLvlFrostBite4
		LvlWeapon5 = sLvlFrostBite5
		LvlWeapon6 = sLvlFrostBite6
	elseif aaSpellToCast == 8
		LvlWeapon1 = sLvlIceStorm1
		LvlWeapon2 = sLvlIceStorm2
		LvlWeapon3 = sLvlIceStorm3
		LvlWeapon4 = sLvlIceStorm4
		LvlWeapon5 = sLvlIceStorm5
		LvlWeapon6 = sLvlIceStorm6
	else
; 		debug.Trace(self + " has been set to an invalid spell type")
	endif
endFunction

spell property sLvlfirebolt1 auto
spell property sLvlfirebolt2 auto
spell property sLvlfirebolt3 auto
spell property sLvlfirebolt4 auto
spell property sLvlfirebolt5 auto
spell property sLvlfirebolt6 auto

spell property sLvlfireball1 auto
spell property sLvlfireball2 auto
spell property sLvlfireball3 auto
spell property sLvlfireball4 auto
spell property sLvlfireball5 auto
spell property sLvlfireball6 auto

spell property sLvlFlames1 auto
spell property sLvlFlames2 auto
spell property sLvlFlames3 auto
spell property sLvlFlames4 auto
spell property sLvlFlames5 auto
spell property sLvlFlames6 auto

spell property sLvlLightningBolt1 auto
spell property sLvlLightningBolt2 auto
spell property sLvlLightningBolt3 auto
spell property sLvlLightningBolt4 auto
spell property sLvlLightningBolt5 auto
spell property sLvlLightningBolt6 auto

spell property sLvlChainlightning1 auto
spell property sLvlChainlightning2 auto
spell property sLvlChainlightning3 auto
spell property sLvlChainlightning4 auto
spell property sLvlChainlightning5 auto
spell property sLvlChainlightning6 auto

spell property sLvlSparks1 auto
spell property sLvlSparks2 auto
spell property sLvlSparks3 auto
spell property sLvlSparks4 auto
spell property sLvlSparks5 auto
spell property sLvlSparks6 auto

spell property sLvlIceSpike1 auto
spell property sLvlIceSpike2 auto
spell property sLvlIceSpike3 auto
spell property sLvlIceSpike4 auto
spell property sLvlIceSpike5 auto
spell property sLvlIceSpike6 auto

spell property sLvlFrostbite1 auto
spell property sLvlFrostbite2 auto
spell property sLvlFrostbite3 auto
spell property sLvlFrostbite4 auto
spell property sLvlFrostbite5 auto
spell property sLvlFrostbite6 auto

spell property sLvlIceStorm1 auto
spell property sLvlIceStorm2 auto
spell property sLvlIceStorm3 auto
spell property sLvlIceStorm4 auto
spell property sLvlIceStorm5 auto
spell property sLvlIceStorm6 auto

;Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
;	if (hitOnce == FALSE)
;		hitOnce = TRUE
;	endif
;endEvent





































