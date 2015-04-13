Scriptname FXSkeletonNecroScript extends ActiveMagicEffect  
{handles the fx for the necro skeleton}

VisualEffect Property FXNecroSkeletonMultiEffect auto
VisualEffect Property FXSkeletonNecroEyeGlowEffect auto
EffectShader Property SkeletonNecroDeathFXS auto
Activator property AshPileObject auto
{The object we use as a pile.}
Actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster	
		FXNecroSkeletonMultiEffect.play(selfRef, -1)
		FXSkeletonNecroEyeGlowEffect.play(selfRef, -1)
	ENDEVENT

	Event OnEffectFinish(Actor akTarget, Actor akCaster)		
		FXNecroSkeletonMultiEffect.Stop(selfRef)
		FXSkeletonNecroEyeGlowEffect.Stop(selfRef)
	ENDEVENT
	
	EVENT OnDying(actor myKiller)	
		FXNecroSkeletonMultiEffect.stop(selfRef)
		FXSkeletonNecroEyeGlowEffect.stop(selfRef)
		SkeletonNecroDeathFXS.play(selfRef)
		
		selfRef.SetCriticalStage(selfRef.CritStage_DisintegrateStart)
		selfRef.AttachAshPile(AshPileObject)		

		utility.wait(2)	
		selfRef.SetAlpha (0.0)
		selfRef.SetCriticalStage(selfRef.CritStage_DisintegrateEnd)
	ENDEVENT
	