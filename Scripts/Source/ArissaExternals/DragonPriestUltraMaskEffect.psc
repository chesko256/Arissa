Scriptname DragonPriestUltraMaskEffect extends ActiveMagicEffect  

actor property selfRef auto hidden
magicEffect property DragonPriestMaskFireCloakFFSelf auto
float property HPthreshold = 0.20 auto
{Below this HP we have a chance of the special effects.  Default 20% (0.2)}
float property effectChance = 0.25 auto
{effect may happen when HP is below this level DEFAULT 25% (0.25)}
float property rareEffectChance = 0.05 auto
{Very Rare effect may happen when HP is below this level DEFAULT 5% (0.05)}
explosion property fakeForceBall1024 auto
spell property flameCloak auto
spell property GrandHealing auto
spell property rareSpell  auto
magicEffect property rareEffect auto

EVENT OnEffectStart(Actor Target, Actor Caster)
	
	selfRef = caster
	
endEVENT


EVENT onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if (selfRef.getActorValuePercentage("Health") < HPthreshold) && \
		!(selfRef.HasMagicEffect(DragonPriestMaskFireCloakFFSelf)) && \
		!(selfRef.isDead())
			float dice = utility.RandomFloat(0,1)
; 			debug.trace("Konahrik rolled: "+dice)
			if dice <= effectChance
; 				debug.trace("Ultra mask effect Proc'd")
				selfRef.placeAtMe(fakeForceBall1024)
				selfRef.knockAreaEffect(1,1024)
				GrandHealing.cast(selfRef,selfRef)
				flameCloak.cast(selfRef,selfRef)		
			endif
			if dice <= rareEffectChance && !(selfRef.hasMagicEffect(rareEffect))
; 				debug.trace("Ultra mask very rare effect Proc'd")
				rareSpell.cast(selfRef,selfRef)
			endif
	endif
endEVENT
