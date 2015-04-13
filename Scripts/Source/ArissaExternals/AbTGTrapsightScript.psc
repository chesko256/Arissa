Scriptname AbTGTrapsightScript extends ActiveMagicEffect  Conditional

GlobalVariable Property pTSight Auto Conditional

	Event OnEffectStart(Actor Target, Actor Caster)
	
		pTSight.Value += 1
	
	EndEvent