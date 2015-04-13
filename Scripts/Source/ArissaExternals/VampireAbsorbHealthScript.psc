ScriptName VampireAbsorbHealthScript extends ActiveMagicEffect

Spell Property DiseasePorphyricHemophelia Auto

Event OnEffectStart(Actor Target, Actor Caster)

	;chance to infect target with Porphyric Hemophelia, percent chance exists on the disease
	If Target == Game.GetPlayer()
; 		debug.Trace(self + "Attempting to apply Porphyric Hemophelia")
		Game.GetPlayer().DoCombatSpellApply(DiseasePorphyricHemophelia, Game.GetPlayer())
	EndIf
	
EndEvent