Scriptname DA09EncDawnbreakerScript extends ActiveMagicEffect  

Spell Property DA09DawnbreakerBaneOfUndeadSpell Auto

Event OnDying(Actor akKiller)
	
	Actor TargetActor = GetTargetActor()
	
; ;	debug.trace(self + "OnDeath() casting DA09DawnbreakerBaneOfUndeadSpell from Target Actor:" + TargetActor)

	DA09DawnbreakerBaneOfUndeadSpell.Cast(TargetActor, None)
	
EndEvent	