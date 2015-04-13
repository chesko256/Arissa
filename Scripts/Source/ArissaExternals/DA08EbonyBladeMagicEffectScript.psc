Scriptname DA08EbonyBladeMagicEffectScript extends ActiveMagicEffect  

Spell Property AlertSpell auto
Spell Property PacifySpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
; 	Debug.Trace("DA08: Strike with Ebony Blade -- " + akTarget + " is target; " + akCaster + " is caster.")
	PacifySpell.Cast(akTarget)
	AlertSpell.Cast(akTarget)
EndEvent

