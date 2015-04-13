ScriptName TimedAbilityScript extends ActiveMagicEffect

Spell Property pAbilityToRemove Auto
Int Property pHoursToWait Auto

Event OnUpdateGameTime()

; 	debug.trace(self + "OnUpdateGameTime")
	Game.GetPlayer().RemoveSpell(pAbilityToRemove)
	
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	; start timer
	RegisterForSingleUpdateGameTime(pHourstoWait)
	
EndEvent