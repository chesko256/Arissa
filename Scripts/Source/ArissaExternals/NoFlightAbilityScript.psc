scriptName NoFlightAbilityScript extends activeMagicEffect

Event OnEffectStart(Actor Target, Actor Caster)
	caster.setAllowFlying(False)
EndEvent
