Scriptname MagicPlayEffectShaderOnHitScript extends ActiveMagicEffect  
{This script plays an effect shader on hit.}

;======================================================================================;
;  PROPERTIES  /
;=============/

EffectShader property MagicEffectShader auto
{The Effect Shader we want.}
float property ShaderDuration = 0.00 auto
{Duration of Effect Shader.}

;======================================================================================;
;  VARIABLES   /
;=============/

Actor TargetActor


;======================================================================================;
;   EVENTS     /
;=============/
Event OnEffectStart(Actor Target, Actor Caster)
	TargetActor = Target
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

		MagicEffectShader.play(TargetActor,ShaderDuration)
	
endevent
