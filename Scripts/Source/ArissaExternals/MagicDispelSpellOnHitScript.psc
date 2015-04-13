Scriptname MagicDispelSpellOnHitScript extends ActiveMagicEffect  
{This script forces the selected spell(s) to dispel on hit.}

;======================================================================================;
;  PROPERTIES  /
;=============/
spell Property Spell01 auto
spell Property Spell02 auto
spell Property Spell03 auto


;======================================================================================;
;  VARIABLES   /
;=============/

Actor TargetActor
bool bWaitLongEnough

;======================================================================================;
;   EVENTS     /
;=============/
Event OnEffectStart(Actor Target, Actor Caster)
	TargetActor = Target
	utility.wait(0.5)
	bWaitLongEnough = true
EndEvent

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if bWaitLongEnough
		bWaitLongEnough = False
		if Spell01
			TargetActor.dispelspell(Spell01)
		endif
		
		if Spell02
			TargetActor.dispelspell(Spell02)
		endif
		
		if Spell03
			TargetActor.dispelspell(Spell03)
		endif
	endif
	
endevent


