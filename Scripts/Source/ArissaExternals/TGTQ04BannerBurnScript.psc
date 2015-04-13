scriptName TGTQ04BannerBurnScript extends TrapExplosiveGas
{Handles the burning of the bee hives in TG02}

Quest property TGTQ04 auto



bool lightIsOn = False
;used to track if we have turned on our linkedRef light yet

objectReference objSelf

bool hazardAssigned = False

objectReference myLinkedRef

bool doOnce

;************************************

Event onLoad()
endEvent


Event onReset()
endEvent

;************************************

;This replaces the explode functionality of the explosive gas
Function gasExplode(objectReference causeActor)
	goToState("DoNothing")
	(self as objectReference).damageObject(1.0)
endFunction
;End of explosion funtionality

;************************************

State doNothing

	event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	endEvent

	event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	endEvent
	
	event onTriggerEnter(objectReference triggerRef)
	endEvent
	
endState

;************************************

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	myLinkedRef = getLinkedRef()
; 	debug.Trace(self + " has received destruction event #" + aiCurrentStage)
	if aiCurrentSTage == 2
		TGTQ04.setstage(65)
		if myLinkedRef && !lightIsOn
			lightIsOn = True
			myLinkedRef.enable()
		endif
		playGamebryoAnimation("forward")	
	endif
	
	if aiCurrentSTage == 3
		if myLinkedRef && lightIsOn
			lightIsOn = false
			myLinkedRef.disable()
		endif
	endif
endEvent

;************************************
