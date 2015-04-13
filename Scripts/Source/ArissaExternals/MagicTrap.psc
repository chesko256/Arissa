scriptName MagicTrap Extends TrapBase
;
;
;===================================================================
;;GENERAL PROPERTIES BLOCK
;===================================================================

spell property magicWeapon auto hidden
;ammo property magicWeaponAmmo auto
float property initialDelay = 0.5 auto hidden
float property firingRate = 2.0 auto hidden
float property currentFiringTimer auto hidden
float property firingSpinup = 0.5 auto hidden
int property castingAim = 0 auto
{use to determin how the aiming type of the magic cast
	0 = straight fire (default)
	1 = fire at linked Ref with TrapLink keyword
	2 = fire at the object that activated my trigger}
objectReference property targetRef auto hidden
bool property forwardFiring = false auto
int property aaSpellToCast = 0 Auto
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
objectReference property mySoulGem auto hidden
formlist property flSoulGemTest auto
int property mySpellLevel = 1  auto hidden
objectReference property trapSelf auto hidden
objectReference property clearRef auto hidden
bool property isFiring auto hidden
bool property isLoaded auto hidden
keyword property TrapLink auto hidden

;===================================================================
;;CORE LOGIC BLOCK
;===================================================================

Function fireTrap()
; 	;;Debug.Trace(self + " is calling fireTrap")
	;if  !trapDisarmed
		;playAnimation("alarm")
		;WindupSound.play( self as ObjectReference)		;play windup sound
		;wait( initialDelay )		;wait for windup
		isFiring = True
		overrideLoop = False
		if !gemTested
			if getLinkedRef().isEnabled()
				testRefIsSoulGem(trapSelf.getLinkedRef())
			
			endif
		endif
		resetLimiter()
		while(finishedFiring == False) && isLoaded && mySoulGem.isEnabled()
; 			;Debug.Trace(self + " is looping fire")
			;playAnimation("fire")
			if isLoaded && mySoulGem
				wait(firingSpinup)
			endif
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
			CurrentFiringTimer = (utility.getCurrentRealTime() + firingRate)
			while !overrideLoop && isLoaded && mySoulGem && CurrentFiringTimer > utility.getCurrentRealTime()
				utility.wait(0.3)
			endWhile
			
			if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
				concentrationCastLoop = false
				interruptCast()
			endif
			
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
			;if !trapDisarmed
				;playAnimation("idle")
				goToState("Reset")
			;endif
		endif

	;endif

endFunction

state pause
	event onBeginState()
		utility.wait(0.1)
		goToState("disarmed")
	EndEvent
	
	Event OnActivate( objectReference activateRef )
	EndEvent
endState

auto state disarmed
	;;No trap rearming allowed.
	; event onTriggerEnter(ObjectReference triggerRef)
; 		; ;Debug.Trace(self + " has been entered by" + triggerRef)
		; testRefIsSoulGem(triggerRef)
	; endEvent
	event onBeginState()
; 		;Debug.Trace(self + " has entered state Disarmed")
	endEvent
	
	Event OnActivate( objectReference activateRef )
	EndEvent
endState

State Reset

	Event OnBeginState()
; 		;Debug.Trace(self + " has entered state Reset")
		GoToState ( "Idle" )
	endEvent
	
	Event OnActivate( objectReference activateRef )
	EndEvent
	
endState

state Arming
	event onTriggerLeave(objectReference triggerRef)
	endEvent
endState

;===================================================================
;;TRIGGER EVENT BLOCK
;===================================================================

;/
event onTriggerLeave(objectReference triggerRef)
; 	Debug.trace(self + " has been left by " + triggerRef)
	if triggerRef == mySoulGem && AttachSetUpComplete
; 		;Debug.Trace(triggerRef + " == " + mySoulGem)
		
		clearMySoulGem()
		loop = false
		trapDisarmed = True
		goToState("pause")
	; elseif game.getPlayer().getItemCount(mySoulGem)
; 		; ;Debug.Trace(mySoulGem + " is in the player inventory")
		; mySoulGem = clearRef
		; loop = false
		; trapDisarmed = True
		; goToState("pause")
	else
; 		Debug.Trace(triggerRef + " != " + mySoulGem)
	endif
endEvent
/;

;===================================================================
;;LOADED EVENT BLOCK
;===================================================================

;/
event onLoad()
	playAnimation("remove")
	trapSelf = self as objectReference
	isLoaded = TRUE
	if isFiring == True
		fireTrap()
	endif
endEvent
/;

event onCellAttach()
; 	Debug.Trace(self + ": onAttachedToCell called")
	isLoaded = TRUE
	trapSelf = self as objectReference	
	
	CellAttachSetUp(trapSelf)
endEvent

;/
event onCellLoad()
; 	;;Debug.Trace(self + " has recieved onCellLoad")
; 	Debug.Trace(self + ": onCellLoad called")
	isLoaded = TRUE
	trapSelf = self as objectReference	
	
	CellAttachSetUp(trapSelf)

endEvent
/;

event onCellDetach()
; 	Debug.Trace(self + " has recieved onDetach event")
	AttachSetUpComplete = FALSE
	isLoaded = FALSE
	gemTested = FALSE
endEvent

event onReset()
; 	debug.Trace(self + ": is running onReset")
	self.reset()

endEvent

;===================================================================
;;FUNCTION BLOCK
;===================================================================

function resetLimiter()
	finishedFiring = false
endFunction

function clearMySoulgem()
	mySoulGem = clearRef
	loop = false
	trapDisarmed = True
	goToState("pause")
endFunction

bool property gemTested = false auto hidden
;test if this is a soul gem
function testRefIsSoulGem(objectReference testSoulGem)
	gemTested = true
	int index = 0
	bool matchFound = false
	while (index < flSoulGemTest.GetSize()) && !matchFound
; 		;;Debug.Trace((testSoulGem) + " testing against " + flSoulGemTest.GetAt(index))
; 		;;Debug.Trace(self + " is checking " + flSoulGemTest + " at index #" + index)
		if testSoulGem.GetBaseObject() == flSoulGemTest.GetAt(index)
; 			;;Debug.Trace(testSoulGem + " == " + flSoulGemTest.GetAt(index))
			(testSoulGem as trapSoulGemController).SetMotionType(4)
			(testSoulGem as trapSoulGemController).goToState("inMagicTrap")
			testSoulGem.moveto(trapSelf, 0.0, 0.0, 128.0)
			
			(testSoulGem as trapSoulGemController).myMagicTrap = trapSelf
			mySpellLevel = index
			resolveLeveledWeapon(index)
			mySoulGem = testSoulGem
			MatchFound = True
			trapDisarmed = False
			goToState("Reset")
			
		endif
		index +=1
	endWhile
endFunction
	
function fireByCastingType()
; 	debug.Trace(self + ": starting fireByCastingType")
	if	castingAim == 0
		magicWeapon.cast(self)
	elseIf castingAim == 1
		if forwardFiring
			if getLinkedRef(TrapLink) && refIsValidForwardTarget(getLinkedRef(TrapLink)) 
				magicWeapon.cast(self, getLinkedRef(TrapLink))
			Else
				magicWeapon.cast(self)
			endif
		Elseif getLinkedRef(TrapLink)
			magicWeapon.cast(self, getLinkedRef(TrapLink))
		Else
			magicWeapon.cast(self)
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
; 		Debug.Trace(self + " error: castingAim = " + castingAim)
	endif
; 	debug.Trace(self + ": finished fireByCastingType")
endFunction

;;This section is for determining if the target is withing a valid firing angle
;		it is used for magic traps that fire forward only
float property horizontalSweepHalf = 90.0 auto
float property verticalSweepHalf = 90.0 auto

bool function refIsValidForwardTarget(objectReference testRef)
; 	;Debug.Trace(self + " is checking if refIsValidForwardTarget on " + testRef)
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
; 		;;Debug.Trace(self + " is firing at a valid angle at " + testRef)
		return true
	Else
; 		;;Debug.Trace(self + " could not fire at a valid angle at " + testRef)
		return False
	endif
endFunction

bool property AttachSetUpComplete = false auto hidden

Function CellAttachSetUp(objectReference functionTriggerRef)
{This function is used to handshake between the trap and the soulgem}

; 	debug.Trace(self + ": has been caused to run CellAttachSetUp by " + functionTriggerRef)
	if !AttachSetUpComplete
; 		debug.Trace(self + ": has found that AttachSetUpComplete == false")
		if isLoaded && getLinkedRef().isEnabled()
			trapSoulGemController localGemScript
			localGemScript = getLinkedRef() as trapSoulgemController
		
			if localGemScript.getState() != "Disarmed"
; 				debug.Trace(self + ": is running CellAttachSetup")
				AttachSetUpComplete = True
				goToState("Idle")
				if !gemTested
					if getLinkedRef().isEnabled()
						testRefIsSoulGem(trapSelf.getLinkedRef())
					
					endif
				endif
				if isFiring == True
					fireTrap()
				endif
			else
; 				debug.Trace(self + ": has found that my gem is in state disarmed")
			endif
		else
; 			debug.Trace(self + ": has found that is loaded is false or linkedRef is not enabled")
		endif
	else
; 		debug.Trace(self + ": has found that AttachSetUpComplete == true")
	endif
endFunction


;===================================================================
;;DAMAGE LEVELLING BLOCK
;===================================================================

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

;
Function ResolveLeveledWeapon (int spellLevel)
; 	;;Debug.Trace(self + " trying to ResolveLeveledWeapon")
	if spellAndCastingTypeResolved == false
		ResolveSpellType()
		ResolveCastingDelay()
		spellAndCastingTypeResolved = True
	endif
	;int damageLevel
	;damageLevel = CalculateEncounterLevel(TrapLevel)
	spellLevel = CalculateEncounterLevel(TrapLevel)
	spell lvlWeapon = LvlWeapon1
	
	if (spellLevel == 2)
		lvlWeapon = LvlWeapon2
	elseif (spellLevel == 3)
		lvlWeapon = LvlWeapon3
	elseif (spellLevel == 4)
		lvlWeapon = LvlWeapon4
	elseif (spellLevel == 5)
		lvlWeapon = LvlWeapon5
	elseif (spellLevel > 5)
		lvlWeapon = LvlWeapon6
	endif
	magicWeapon = lvlWeapon
EndFunction

function ResolveCastingDelay()
; 	;Debug.Trace(self + " trying to ResolveCastingDelay")
	if castingAim == 0
		initialDelay = 0.5
		if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
			firingRate = 4.5
		else
			firingRate = 2.0
		endif
	elseif castingAim == 1
		initialDelay = 0.5
		if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
			firingRate = 4.5
		else
			firingRate = 2.0
		endif
	elseif castingAim == 2
		initialDelay = 0.5
		if aaSpellToCast == 2 || aaSpellToCast == 5 || aaSpellToCast == 7
			firingRate = 4.5
		else
			firingRate = 2.0
		endif
	Else
; 		;Debug.Trace(self + " cannot resolveCastingDelay: unknown castingAim")
	endIf
		
endFunction

function ResolveSpellType()
; 	;;Debug.Trace(self + " trying to ResolveSpellType")
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
; 		;Debug.Trace(self + " has been set to an invalid spell type")
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




































