scriptName magicEffectShadersOnEndScript extends ActiveMagicEffect
{Scripted magic effect for applying up to 3 Effect Shaders when the Spell Ends.}

import utility
import game
;======================================================================================;
;  PROPERTIES  /
;=============/

EffectShader property EffectShaderFX01 auto
{main Effect Shader for spell}
EffectShader property EffectShaderFX02 auto
{2nd Effect Shader for spell}
EffectShader property EffectShaderFX03 auto
{3rd Effect Shader for spell}

Float Property fDuration = 0.1 auto
{How long do the shaders run. (Default = 0.1)}

;======================================================================================;
;  VARIABLES   /
;=============/



;======================================================================================;
;   EVENTS     /
;=============/

Event OnEffectFinish(Actor Target, Actor Caster)
	if EffectShaderFX01 != None
		EffectShaderFX01.Play(Target,fDuration)
	endif
	if EffectShaderFX02 != None
		EffectShaderFX02.Play(Target,fDuration)
	endif
	if EffectShaderFX03 != None
		EffectShaderFX03.Play(Target,fDuration)
	endif
EndEvent
