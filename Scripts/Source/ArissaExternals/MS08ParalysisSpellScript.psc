Scriptname MS08ParalysisSpellScript extends ActiveMagicEffect  

spell Property MS08ParalysisAbility  Auto  

ReferenceAlias Property Saadia Auto

Event OnEffectStart(Actor AkTarget, Actor akCaster)

	AkTarget.AddSpell(MS08ParalysisAbility)

EndEvent