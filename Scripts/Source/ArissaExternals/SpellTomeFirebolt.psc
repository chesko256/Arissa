Scriptname SpellTomeFirebolt extends ActiveMagicEffect  

Spell Property SpellLearned Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(SpellLearned)
EndEvent
