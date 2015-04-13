scriptName dunCGFireTriggerScript extends objectReference
{Actor enters trigger, he gets hurt}


keyword property dunCGMagicHeavyFire auto
explosion property dunCGTrapFireTriggerExplosion01 auto

event onTrigger(objectReference triggerRef)
	if triggerRef as actor && !(triggerRef as actor).isDead()
	
		;If the actor does not already have this fire effect on them
		if !(triggerRef as actor).HasMagicEffectWithKeyword(dunCGMagicHeavyFire)
			triggerRef.placeAtMe(dunCGTrapFireTriggerExplosion01)
		endif
	endif
endEvent
