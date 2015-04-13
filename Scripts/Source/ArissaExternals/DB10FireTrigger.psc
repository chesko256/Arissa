scriptName DB10FireTrigger extends objectReference
{This script is for the burning sequence of the dark brotherhood}


keyword property DB10MagicHeavyFire auto
explosion property DB10TrapFireTriggerExplosion01 auto

event onTrigger(objectReference triggerRef)
	if triggerRef as actor && !(triggerRef as actor).isDead()
	
		;If the actor does not already have this fire effect on them
		if !(triggerRef as actor).HasMagicEffectWithKeyword(DB10MagicHeavyFire)
; 			debug.Trace(self + " has applied gas to " + triggerRef)
			triggerRef.placeAtMe(DB10TrapFireTriggerExplosion01)
		endif
	endif
endEvent
