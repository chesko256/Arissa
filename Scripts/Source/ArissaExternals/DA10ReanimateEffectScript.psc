scriptName DA10ReanimateEffectScript extends ActiveMagicEffect
;
;
;=======================================================


event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.resurrect()
endEvent
