Scriptname FXDragonBloodDamageScript extends ActiveMagicEffect  
{This script applies blood damage geometry to the dragon and turns it on when they are hit based on the direction they are hit from}

;===============================================
; MARK'S ORIGINAL VARS & PROPERTIES
int frontBloodStepper
int backBloodStepper
int leftBloodStepper
int rightBloodStepper
int dragonHealth 
string hitDirection ;0=front 1=right 2=back 3=left
float hitAngle
Armor Property DragonBloodHeadFXArmor  Auto  
Armor Property DragonBloodTailFXArmor  Auto  
Armor Property DragonBloodWingLFXArmor  Auto  
Armor Property DragonBloodWingRFXArmor  Auto  
Actor selfRef

; JOEL'S VARS & PROPERTIES
; user can override HP percentages
float property HPpctT1 = 0.98 auto
{relative total HP at which first blood should appear DEFAULT: 0.??} 
float property HPpctT2 = 0.95 auto
{relative total HP at which second blood should appear DEFAULT: 0.??} 
float property HPpctT3 = 0.90auto
{relative total HP at which third blood should appear DEFAULT: 0.??} 
float property HPpctT4 = 0.80 auto
{relative total HP at which final blood should appear DEFAULT: "+HPpctT4} 

float previousHP
float diffHP

; tracking values for the amount of damage each "side" has taken.
float HPFront
float HPBack
float HPLeft
float HPRight

; tracking vars for damage to each side
; 0 = no blood, 1 = tier 1 blood, etc.
int stateFront = 0
int stateBack = 0
int stateLeft = 0
int stateRight = 0

; HP tiers.  These are the threshold values below which each blood will play 
float HPt1
float HPt2
float HPt3
float HPt4

bool bDebug = FALSE
 
;===============================================


EVENT OnEffectStart(Actor Target, Actor Caster)
	;Setup stuff has to go here for activeMagicEffect
	selfRef = caster
	; store HP for future use.  THis should usually be 100% HP.
	previousHP = selfRef.getActorValue("health")
; ; 	debug.TraceConditional("TEST JOEL: Dragon has set previousHP to :"+previousHP, bDebug)
; ; 	debug.TraceConditional("TEST JOEL: Dragon Blood FX onEffectStart initialized", bDebug)
	dragonBloodInit()
ENDEVENT

EVENT onLoad()
; ; 	debug.traceConditional("TEST JOEL: Dragon has loaded ("+selfRef+")", bDebug)
endEVENT

EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	
	; first intercept to figure out how much damage was done.
; ; 	debug.TraceConditional("||===============================", bDebug)
; ; 	debug.TraceConditional("|| TEST JOEL: DRAGON HP DIAGNOSTIC", bDebug)
; ; 	debug.TraceConditional("|| TEST JOEL: Dragon previous HP="+previousHP, bDebug)
; ; 	debug.TraceConditional("|| TEST JOEL: Dragon current HP="+selfRef.getActorValue("health"), bDebug)
	
	diffHP = previousHP - (selfRef.getActorValue("health"))
; ; 	debug.TraceConditional("|| TEST JOEL: Dragon damaged for "+diffHP+"HP", bDebug)
	
	; determine if I was hit in the front/back/left/right
	hitAngle = selfRef.GetHeadingAngle(akAggressor) 
	if hitAngle >= -45 && hitAngle <= 45
		hitDirection = "FRONT"
		; decrement a fake HP counter for this side of the body
		HPfront = (HPfront - diffHP)
	endif
	if hitAngle >= 135 || hitAngle <= -135
		hitDirection = "BACK"
		; decrement a fake HP counter for this side of the body
		HPback = (HPback - diffHP)
	endif
	if hitAngle < -45 && hitAngle > -135
		hitDirection = "LEFT"
		; decrement a fake HP counter for this side of the body
		HPleft = (HPleft - diffHP)
	endif
	if hitAngle > 45 && hitAngle < 135
		hitDirection = "RIGHT"
		; decrement a fake HP counter for this side of the body
		HPright = (HPright - diffHP)
	endif
	
; ; 	debug.TraceConditional("|| TEST JOEL: Dragon was hit from the "+hitDirection, bDebug)
; ; 	debug.TraceConditional("|| TEST JOEL: "+hitdirection+" HP = "+HPleft, bDebug)
	
	; ==============================================
	; check for updates to blood state
	if hitDirection == "FRONT"
		
		int prevStateFront = stateFront
	
		if (HPfront <= HPt1) && (HPfront > HPt2)
			stateFront = 1
		elseif (HPfront <= HPt2) && (HPfront > HPt3)
			stateFront = 2
		elseif (HPfront <= HPt3) && (HPfront > HPt4)
			stateFront = 3
		elseif (HPfront <= HPt4)
			stateFront = 4
		endif
		
		; see if there was a change in state for this side
		if stateFront != prevStateFront
			; concatenate and play appropriate blood FX
; ; 			debug.TraceConditional("|| TEST JOEL: Blood FX State Change: HeadBleed0"+stateFront, bDebug)
			selfRef.PlaySubGraphAnimation("HeadBleed0"+stateFront)
		endif
	endif
	
	if hitDirection == "BACK"
		
		int prevStateback = stateback
	
		if (HPback <= HPt1) && (HPback > HPt2)
			stateback = 1
		elseif (HPback <= HPt2) && (HPback > HPt3)
			stateback = 2
		elseif (HPback <= HPt3) && (HPback > HPt4)
			stateback = 3
		elseif (HPback <= HPt4)
			stateback = 4
		endif
		
		; see if there was a change in state for this side
		if stateback != prevStateback
			; concatenate and play appropriate blood FX
; ; 			debug.TraceConditional("|| TEST JOEL: Blood FX State Change: BackBleed0"+stateback, bDebug)
			selfRef.PlaySubGraphAnimation("TailBleed0"+stateback)
		endif
	endif
	
	if hitDirection == "LEFT"
		
		int prevStateleft = stateleft
	
		if (HPleft <= HPt1) && (HPleft > HPt2)
			stateleft = 1
		elseif (HPleft <= HPt2) && (HPleft > HPt3)
			stateleft = 2
		elseif (HPleft <= HPt3) && (HPleft > HPt4)
			stateleft = 3
		elseif (HPleft <= HPt4)
			stateleft = 4
		endif
		
		; see if there was a change in state for this side
		if stateleft != prevStateleft
			; concatenate and play appropriate blood FX
; ; 			debug.TraceConditional("|| TEST JOEL: Blood FX State Change: WingLBleed0"+stateleft, bDebug)
			selfRef.PlaySubGraphAnimation("WingLBleed0"+stateleft)
		endif
	endif
	
		if hitDirection == "RIGHT"
		
		int prevStateright = stateright
	
		if (HPright <= HPt1) && (HPright > HPt2)
			stateright = 1
		elseif (HPright <= HPt2) && (HPright > HPt3)
			stateright = 2
		elseif (HPright <= HPt3) && (HPright > HPt4)
			stateright = 3
		elseif (HPright <= HPt4)
			stateright = 4
		endif
		
		; see if there was a change in state for this side
		if stateright != prevStateright
			; concatenate and play appropriate blood FX
; ; 			debug.TraceConditional("|| TEST JOEL: Blood FX State Change: WingRBleed0"+stateright, bDebug)
			selfRef.PlaySubGraphAnimation("WingRBleed0"+stateright)
		endif
	endif
	
	; ==============================================
	; store our current HP as the previous for accurate maths on future hits.
	previousHP = selfRef.getActorValue("health")
	if bDebug == TRUE
; ; 		debug.TraceConditional("|| TEST JOEL: End of onHit()", bDebug)
		bDebug = false
		debugVars()
	endif
	
endEVENT

; EVENT onDeath(actor myKiller)
	; utility.wait(8.5)
	; selfRef.PlaySubGraphAnimation("BloodFade")
	; utility.wait(1.5)
; ENDEVENT


;====================================================================
;	Initialize a bunch of variables
;====================================================================
FUNCTION dragonBloodInit()
	; quick safety net to convert percentages if they are entered incorrectly (ie 75% = 0.75)
; ; 	debug.TraceConditional("convert % values to integers", bDebug)
	if HPpctT1 > 1.0 && HPpctT1 < 100
		HPpctT1 = HPpctT1*0.01
	endif
	if HPpctT2 > 1.0 && HPpctT2 < 100
		HPpctT2 = HPpctT2*0.01
	endif
	if HPpctT2 > 1.0 && HPpctT2 < 100
		HPpctT2 = HPpctT2*0.01
	endif
	if HPpctT3 > 1.0 && HPpctT3 < 100
		HPpctT3 = HPpctT3*0.01
	endif
	
	; store hard point values so we don't have to always work in percentages later
	HPt1 = HPpctT1 * (selfRef.getBaseAV("health"))
	HPt2 = HPpctT2 * (selfRef.getBaseAV("health"))
	HPt3 = HPpctT3 * (selfRef.getBaseAV("health"))
	HPt4 = HPpctT4 * (selfRef.getBaseAV("health"))
	
	; set fake location HP counters to current(assume full?) HP
	HPfront = selfRef.getAV("health")
	HPback = selfRef.getAV("health")
	HPleft = selfRef.getAV("health")
	HPright = selfRef.getAV("health")
	
	if bDebug == TRUE
; ; 		debug.TraceConditional("|| TEST JOEL : finished Init()", bDebug)
		debugVars()
	endif
	
endFUNCTION

FUNCTION debugVars()
; ; 	debug.TraceConditional("||===============================", bDebug)
; ; 	debug.TraceConditional("|| DRAGON BLOOD FX VARIABLE READOUT", bDebug)
; ; 	debug.TraceConditional("|| HPpctT1 = "+HPpctT1, bDebug)
; ; 	debug.TraceConditional("|| HPpctT2 = "+HPpctT2, bDebug)
; ; 	debug.TraceConditional("|| HPpctT3 = "+HPpctT3, bDebug)
; ; 	debug.TraceConditional("|| HPpctT4 = "+HPpctT4, bDebug)
; ; 	debug.TraceConditional("|| HPFront = "+HPFront, bDebug)
; ; 	debug.TraceConditional("|| HPBack = "+HPBack, bDebug)
; ; 	debug.TraceConditional("|| HPLeft = "+HPLeft, bDebug)
; ; 	debug.TraceConditional("|| HPRight = "+HPRight, bDebug)
; ; 	debug.TraceConditional("|| stateFront = "+stateFront, bDebug)
; ; 	debug.TraceConditional("|| stateBack = "+stateBack, bDebug)
; ; 	debug.TraceConditional("|| stateLeft = "+stateLeft, bDebug)
; ; 	debug.TraceConditional("|| stateRight = "+stateRight, bDebug)
; ; 	debug.TraceConditional("|| HPt1 = "+HPt1, bDebug)
; ; 	debug.TraceConditional("|| HPt2 = "+HPt2, bDebug)
; ; 	debug.TraceConditional("|| HPt3 = "+HPt3, bDebug)
; ; 	debug.TraceConditional("|| HPt4 = "+HPt4, bDebug)
endFUNCTION












STATE markSTATE

	Event OnLoad()
; 		;Debug.Trace("This dragon is loaded, playing animations should work now")
		

	endEvent

		EVENT OnEffectStart(Actor Target, Actor Caster)
			;Play your particles.
			selfRef = caster
			dragonHealth = selfRef.GetAV("Health") as int
		ENDEVENT


	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		
		dragonHealth = selfRef.GetAV("Health") as int
; ; 		Debug.TraceConditional("Dragon's health is" + dragonHealth, bDebug)
		hitAngle = selfRef.GetHeadingAngle(akAggressor) 
		if hitAngle >= -45 && hitAngle <= 45
; ; 			Debug.TraceConditional(akAggressor + " angle is " + hitAngle, bDebug)
; ; 			Debug.TraceConditional("Dragon was hit in front", bDebug)
			hitDirection = 0
			frontBloodStepper = frontBloodStepper + 1
		elseIf hitAngle > 45 && hitAngle < 135
; ; 			Debug.TraceConditional(akAggressor + " angle is " + hitAngle, bDebug)
; ; 			Debug.TraceConditional("Dragon was hit on right", bDebug)
			hitDirection = 1
			rightBloodStepper = rightBloodStepper + 1
		elseIf hitAngle >= 135 || hitAngle <= -135
; ; 			Debug.TraceConditional(akAggressor + " angle is " + hitAngle, bDebug)
; ; 			Debug.TraceConditional("Dragon was hit in back", bDebug)	
			hitDirection = 2
			backBloodStepper = backBloodStepper + 1
		elseIf hitAngle < -45 && hitAngle > -135
; ; 			Debug.TraceConditional(akAggressor + " angle is " + hitAngle, bDebug)
; ; 			Debug.TraceConditional("Dragon was hit on left", bDebug)	
			hitDirection = 3
			leftBloodStepper = leftBloodStepper + 1
		endif	
		
		if hitDirection == 0  
			if frontBloodStepper <= 4
; ; 				Debug.TraceConditional("Dragon head blood stage0" + frontBloodStepper, bDebug)
				selfRef.PlaySubGraphAnimation("HeadBleed0" + frontBloodStepper)
			endif
		elseif hitDirection == 1	
			if rightBloodStepper <= 4
; ; 				Debug.TraceConditional("Dragon wing r blood stage0" + rightBloodStepper, bDebug)
				selfRef.PlaySubGraphAnimation("WingRBleed0" + rightBloodStepper)	
			endif
		elseif hitDirection == 2	
			if backBloodStepper <= 4
; ; 				Debug.TraceConditional("Dragon back blood stage0" + backBloodStepper, bDebug)
				selfRef.PlaySubGraphAnimation("TailBleed0" + backBloodStepper)
			endif
		elseif hitDirection == 3	
			if leftBloodStepper <= 4
; ; 				Debug.TraceConditional("Dragon wing l blood stage0" + leftBloodStepper, bDebug)
				selfRef.PlaySubGraphAnimation("WingLBleed0" + leftBloodStepper)	
			endif
		endif	

		
	ENDEVENT
		
		
		EVENT onDeath(actor myKiller)

	;	selfRef.UnequipItem(ChaurusSpitSkin)
		
		ENDEVENT
endSTATE
		
