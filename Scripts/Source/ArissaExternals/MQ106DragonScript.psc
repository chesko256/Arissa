Scriptname MQ106DragonScript extends ReferenceAlias  

DragonActorScript dragonScript

Event OnCombatStateChanged(Actor akTarget,int aeCombatState)
	if aeCombatState != 0 ; 0 means not in combat, so non-0 means we entered combat
; 		debug.trace(self + " OnCombatStateChanged - setstage 110")
		; end scene when start combat, make aggressive
		GetOwningQuest().SetStage(110)
	endIf
endEvent

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	; end scene when hit, make aggressive
	; only after 105 is done - make sure he's finished exiting the mound
	if GetOwningQuest().getStageDone(105) && !GetOwningQuest().GetStageDone(110)
; 		debug.trace(self + " OnHit - setstage 110")
		GetOwningQuest().SetStage(110)
	endif
endEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if akEffect.HasKeyword(MagicShout)
		(GetOwningQuest() as MQ106Script).dragonHitByShout = 1
	endif
endEvent

Event OnDeath(Actor akKiller)
	GetOwningQuest().setstage(150)
	dragonScript = GetRef() as DragonActorScript
	RegisterForSingleUpdate(1)
endEvent

Event OnUpdate()
	if GetOwningQuest().GetStageDone(150) == 1
		if GetOwningQuest().GetStageDone(155) == 0
			if GetRef().GetDistance(Game.GetPlayer()) < dragonScript.deathFXrange
				UnregisterForUpdate()
				GetOwningQuest().SetStage(155)
			endif
		endif
	endif
	if !GetOwningQuest().GetStageDone(155)
		RegisterForSingleUpdate(1)
	endif
endEvent


Keyword Property MagicShout  Auto  
{keyword for shout effects
}
