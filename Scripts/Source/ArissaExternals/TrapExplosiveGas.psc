scriptName TrapExplosiveGas extends objectReference
;
;
;==================================================

formlist property flExplodesGasTrapOnHit auto
{projectiles that will set this off when they hit}

formlist property flExplodesGasTrapOnEnter auto
{objects that will set this off when they enter}

formlist property flExplodesGasTrapOnMagicEffectApply auto
{magicEffects that will set this off when applied}

formlist property flExplodesGasTrapEquippedSpell auto
{Spells that will set this off if equipped and drawn}

formlist property trapGasWeapon auto
{weapons that will set this off on hit, specifically explosions}

bool actorHasWeaponsDrawn = TRUE ;remove this later
bool property checkActorEquippedItems = TRUE auto
{Whether or not to check items the player is carrying
	default = True on explosive gas
	set to off on oil pool}
bool property checkActorMagic = TRUE auto
{check the actors drawn magic
	default = true on explosive gas
	set to off on oil pool}

keyword property flameKeyword Auto
keyword property lightningKeyword auto	
bool property lightningIgnites = FALSE Auto
{if this is true lightning should ignite this trap
	default == false}
	
light property Torch01 auto
projectile property storedProjectile auto hidden
objectReference property storedObjRef auto hidden
MagicEffect property storedEffect1 auto hidden
MagicEffect property storedEffect2 auto hidden
MagicEffect property storedEffect3 auto hidden
MagicEffect property storedEffect4 auto hidden
int property storedEffectIncrement =  1 auto hidden

auto state waiting
	;Start of the new script
	event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if !akProjectile || akProjectile != storedProjectile
			storedProjectile = akProjectile
; 			debug.Trace(self + " is testing " + akProjectile + " due to onHit, akWeapon = " + akWeapon)
			
			If trapGasWeapon.hasForm(akWeapon) || akweapon == torch01
; 				debug.Trace(self + " is exploding due to " + akWeapon + " being in formlist " + TrapGasWeapon)
				GasExplode(akAggressor)
			ElseIf flExplodesGasTrapOnHit.hasForm(akProjectile)
; 				debug.Trace(self + " is exploding due to " + akProjectile)
				GasExplode(akAggressor)
			ElseIf akWeapon.HasKeyword(flameKeyword)
; 				debug.Trace(self + " is exploding due to " + akWeapon + " - hasKeyword")
				GasExplode(akAggressor)
			endif
		endif
	endEvent
	
	event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		if akEffect == storedEffect1 || akEffect == storedEffect2 || akEffect == storedEffect3 || akEffect == storedEffect4
			;if the effect == any of the stored effects do nothing
		else
			if storedEffectIncrement == 1
				storedEffect1 = akEffect
				storedEffectIncrement = 2
			elseif storedEffectIncrement == 2
				storedEffect2 = akEffect
				storedEffectIncrement = 3
			elseif storedEffectIncrement == 3
				storedEffect3 = akEffect
				storedEffectIncrement = 4
			else
				storedEffect4 = akEffect
				storedEffectIncrement = 1
			endif
; 			debug.Trace(self + " is testing " + akEffect + " due to onMagicEffectApply")
			if flExplodesGasTrapOnMagicEffectApply.hasForm(akEffect as form)
; 				debug.Trace(self + " is exploding due to " + akEffect)
				GasExplode(akCaster)
			elseif akEffect.hasKeyword(flameKeyword)
; 				debug.Trace(self + " is exploding due to " + akEffect)
				GasExplode(akCaster)
			elseif lightningIgnites && akEffect.hasKeyword(lightningKeyword)
; 				debug.Trace(self + " is exploding due to " + akEffect)
				GasExplode(akCaster)
			endif
		endif
	endEvent
	

	event onTriggerEnter(objectReference triggerRef)
		if (triggerRef as Actor) || !storedObjRef || storedObjRef.getBaseObject() != triggerRef.getBaseObject()
			if !(triggerRef as Actor)
				storedObjRef = triggerRef
			endIf
; 			debug.Trace(self + " is testing " + triggerRef + " due to onTriggerEnter")
			if flExplodesGasTrapOnEnter.hasForm(triggerRef.GetBaseObject())
; 				debug.Trace(self + " is exploding due to " + triggerRef)
				GasExplode(triggerRef)
			; Checking to see if the entering ref is an actor
			elseif (triggerRef as Actor)
				;check actor equipped items if necessary
				if checkActorEquippedItems
					checkActorWeapons(triggerRef as actor)
				elseif checkActorMagic
					If (triggerRef as actor).hasMagicEffectWithKeyword(flameKeyword)
; 						debug.Trace(self + " is exploding due to " + triggerRef + " having flame effect")
						GasExplode(triggerRef)
					ElseIf lightningIgnites
						if (triggerRef as actor).hasMagicEffectWithKeyword(lightningKeyword)
; 							debug.Trace(self + " is exploding due to " + triggerRef + " having lightning effect")
							GasExplode(triggerRef)
						endif
					endif
					
				endif
			endif
		endif
	endEvent
	
	
	
EndState

function GasExplode(objectReference causeActor)
	;if (causeActor as actor)
		self.setActorCause(causeActor as actor)
	;endif
; 	debug.Trace(self + " has exploded")
	self.damageObject(5)
endFunction

function checkActorWeapons(actor triggerActor)
	; Checking if Torch is equipped
	if triggerActor.GetEquippedItemType(0) == 11 || triggerActor.GetEquippedItemType(1) == 11
		GasExplode(triggerActor)
	; Checking if the player has weapons drawn
	ElseIf triggerActor.IsWeaponDrawn() ;This should be a function check later
		;if the player has a flamable spell equiped and drawn
; 		debug.Trace(self + " is testing " + (triggerActor).GetEquippedSpell(0) + " due to onTriggerEnter")
; 		debug.Trace(self + " is testing " + (triggerActor).GetEquippedSpell(1) + " due to onTriggerEnter")
		if triggerActor.GetEquippedSpell(0).hasKeyword(flameKeyword)	;check left hand
			GasExplode(triggerActor)
		elseif flExplodesGasTrapEquippedSpell.hasForm(triggerActor.GetEquippedSpell(1) as form)	;check right hand
			GasExplode(triggerActor)
		endif
	endif
endFunction

event onReset()
	self.reset()
	self.clearDestruction()
	goToState("waiting")
endEvent


event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
; 	debug.Trace(self + " has received destruction event #" + aiCurrentStage)
endEvent










