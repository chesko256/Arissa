scriptName magicEffectShaderApply extends ActiveMagicEffect
{Scripted magic effect Adding and Removing Effect Shaders}

;import game
;import debug
import utility
;import sound

;======================================================================================;
;               PROPERTIES  /
;=============/

EffectShader property EffectShaderFX auto
{main Effect Shader for spell}
EffectShader property EffectShaderFX02 auto
{2nd Effect Shader for spell}
EffectShader property EffectShaderFX03 auto
{3rd Effect Shader for spell}

Float Property fDuration = 0.1 auto
{How Long does it run, if used?}
Float Property fDelay = 0.0 auto
{Delay the effect add for this amount of time.}
;======================================================================================;
;  VARIABLES   /
;=============/

bool Property bRemove = FALSE auto
{Do we Remove the Effect Manually?}
bool Property bUseDuration = FALSE auto
{Do we Use the duration?}

;======================================================================================;
;	 EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
	if EffectShaderFX
		EffectShaderFX.Stop(Target)
	endif
	if EffectShaderFX02
		EffectShaderFX02.Stop(Target)
	endif
	if EffectShaderFX03
		EffectShaderFX03.Stop(Target)	;Kill EffectShaderFX from another cast, if running.
	endif
	
	wait(fDelay)
	
	if bUseDuration
		if EffectShaderFX
			EffectShaderFX.Play(Target,fDuration)
		endif
		if EffectShaderFX02
			EffectShaderFX02.Play(Target,fDuration)
		endif
		if EffectShaderFX03
			EffectShaderFX03.Play(Target,fDuration)
		endif			
	else
		if EffectShaderFX
			EffectShaderFX.Play(Target,-1.0)
		endif
		if EffectShaderFX02
			EffectShaderFX02.Play(Target,-1.0)
		endif
		if EffectShaderFX03
			EffectShaderFX03.Play(Target,-1.0)
		endif
	endif
	
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)

	if bRemove
		if EffectShaderFX
			EffectShaderFX.Stop(Target)
		endif
		if EffectShaderFX02
			EffectShaderFX02.Stop(Target)
		endif
		if EffectShaderFX03
			EffectShaderFX03.Stop(Target)	;Kill EffectShaderFX from another cast, if running.
		endif
	endif
	
endEvent