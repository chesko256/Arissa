scriptName magicSetActorAlphaScript extends ActiveMagicEffect
{Scripted effect Setting the Alpha of an Actor and back}

;======================================================================================;
;  PROPERTIES  /
;=============/


float property AlphaValue = 1.0 auto
{Alpha Value the target will be faded to.}
Bool property FadeToAlpha = False auto
{Do we fade the alpha to the value over time?}
Bool property DontFadeBack = False auto
{Check this if you do not want to return to normal after the spell ends}

;======================================================================================;
;   EVENTS     /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)
	If AlphaValue != 1.0				;Do we have any data?
		Target.SetAlpha (AlphaValue, FadeToAlpha)
	EndIf
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	if DontFadeBack == False
		If AlphaValue != 1.0				;Do we have any data?
			Target.SetAlpha (1.0, FadeToAlpha)
		EndIf
	endif
EndEvent
