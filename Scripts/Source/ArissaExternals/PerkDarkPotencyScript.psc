Scriptname PerkDarkPotencyScript extends ActiveMagicEffect  

actor Persistance

Event OnEffectStart(Actor Target, Actor Caster)
	Persistance = Target
	Target.ModAv("Health", HealthBonus)
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	Target.ModAv("Health", -HealthBonus)
	Persistance = None
EndEvent


float Property HealthBonus  Auto  
