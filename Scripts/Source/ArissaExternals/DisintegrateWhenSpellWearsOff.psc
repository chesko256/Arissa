Scriptname DisintegrateWhenSpellWearsOff extends ActiveMagicEffect  
{Currently just a test of an idea.}

import debug

explosion property DeathFXexplosion auto
Activator property AshPileObject auto
{The object we use as a pile.}
keyword property MagicNoReanimate auto

	EVENT OnEffectStart(Actor akTarget, Actor akCaster)
		trace("TEST: akTarget == "+akTarget)
		trace("TEST: akCaster == "+akCaster)
	ENDEVENT

	EVENT OnEffectFinish(Actor Target, Actor Caster)
		; Effects automatically finish onDeath so use this EVENT hook instead 
		trace("Actor has died: "+target)
		utility.wait(0.40)
		target.placeatme(DeathFXexplosion)
		(target as actor).AttachAshPile(AshPileObject)
		;	target.addKeyword(magicNoReanimate)
	ENDEVENT
	