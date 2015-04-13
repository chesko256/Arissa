scriptName TG02Beehive extends TrapExplosiveGas
{Handles the burning of the bee hives in TG02}

Quest property pTG02Quest auto

objectReference property mySmoke auto
{smoke FX that gets enabled after hive is destroyed and TG quest is still active}

bool lightIsOn = False
;used to track if we have turned on our linkedRef light yet

objectReference objSelf

bool hazardAssigned = False

objectReference myLinkedRef

bool doOnce

;************************************

Event onLoad()
	if(!doOnce)
		if(getCurrentDestructionStage() >= 2 && getCurrentDestructionStage() < 4)
			;the player has lit the hive on fire. Now that it's unloaded and loaded again, damage it to change to destroyed state
			doOnce = true
			(self as objectReference).damageObject(100.0)
			if(pTG02Quest.getStage()< 200)
				mySmoke.enable()
			endif
		endif
	endif
		
	if(pTG02Quest.getStageDone(200))
		mySmoke.disable()
	endif
endEvent

;************************************

;This replaces the explode functionality of the explosive gas
Function gasExplode(objectReference causeActor)
	goToState("DoNothing")
	(self as objectReference).damageObject(1.0)
	myLinkedRef = getLinkedRef()
	if myLinkedRef && !lightIsOn
		lightIsOn = True
		myLinkedRef.enable()
	endif
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
	if aiCurrentSTage < 4 && !lightIsOn && myLinkedRef
		lightIsOn = True
		myLinkedRef.enable()
	endif
; 	debug.Trace(self + " has received destruction event #" + aiCurrentStage)
	
	
	if aiCurrentStage == 2
		TG02QuestScript pTG02Script = pTG02Quest as TG02QuestScript
		pTG02Script.HiveGone()
		playAnimation("activate")
		if GetLinkedRef()
			GetLinkedRef().Disable()
		endif
	endif
	
	if aiCurrentStage == 4
		objSelf = self as objectReference
		if myLinkedRef
			myLinkedRef.disable()
		endif
	endif

endEvent

;************************************
