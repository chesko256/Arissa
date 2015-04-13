scriptName TrapFallingOilLampAnim extends objectReference
;
;
;====================================================



;;;;;;THIS IS OLD DO NOT USE IT!!
;;;;;;THE SCRIPT YOU WANT IS: TrapFallingOilLampCollLayer



message property DisarmMessage1 auto
sound property FallingSound auto
weapon property FallingOilWeapon auto
ammo property FallingOilAmmo auto

auto state waiting
	event onActivate(objectReference triggerRef)
; 		debug.Trace(self + " has been activated by " + triggerRef)
		goToState("Triggered")
		fireTrap()
	endEvent

	event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;if self.getAV("Health") > 10
			goToState("Triggered")
			fireTrap()
		;endif
	endEvent
	
	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		;if self.getAV("Health") > 10
			goToState("Triggered")
			fireTrap()
		;endif
	endEvent
	
EndState

state Triggered
EndState

function fireTrap()
; 		;debug.Trace(self + " has fired trap, should fall and explode")
		FallingSound.play(self)
		;self.DamageObject(1.0)		
		playAnimation("Off")
		fallingOilWeapon.Fire(self, FallingOilAmmo)
		DisableLinkChain()
endFunction

event onDeath()
	goToState("Triggered")
endEvent
	
event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
; 	;debug.Trace(self + " has received destruction event #" + aiCurrentStage)
	;if aiCurrentStage == 1
		;utility.wait(0.0)
		;fallingOilWeapon.Fire(self, FallingOilAmmo)
		;DisableLinkChain()
		fireTrap()
		;self.Disable()
		;self.Delete()
	;endif
endEvent
;/
Function DisableLinkChain()
	int LinkTotal = CountLinkedRefChain()
	;Trace("DARYL - " + self + "Total links in the chain are " + LinkTotal)
	While LinkTotal > 0
		GetNthLinkedRef(LinkTotal).Disable()
		;Trace("DARYL - " + self + "Disabling link number " + LinkTotal)
		LinkTotal -= 1
	endWhile
endFunction
/;