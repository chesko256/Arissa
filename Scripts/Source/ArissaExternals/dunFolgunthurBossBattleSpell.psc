ScriptName dunFolgunthurBossBattleSpell extends ActiveMagicEffect
{A variant of the Soul Trap VFX script for Mikrul Gauldurson's Drain Health ability in Folgunthur.}

ImageSpaceModifier property TrapImod auto
{IsMod applied when we trap a soul}

sound property TrapSoundFX auto ; create a sound property we'll point to in the editor
{Sound played when we trap a soul}

VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}

VisualEffect property CasterVFX auto
{Visual Effect on Caster aming at Target}

EffectShader property CasterFXS auto
{Effect Shader on Caster during Soul trap}

EffectShader property TargetFXS auto
{Effect Shader on Target during Soul trap}


actor Victim
bool DeadAlready = FALSE

Event OnEffectStart(Actor Target, Actor Caster)
	;Soul Trap setup.
	victim = target
	DeadAlready = Victim.IsDead()
	
	;Stop Mikrul from casting this again for a moment.
	Caster.SetAV("Variable06", 1)
	;Kick Mikrul from this package to keep him from becoming stuck in it.
	Utility.Wait(0.5)
	Caster.EvaluatePackage()
	;Reset Variable06 to allow him to cast it again in the future.
	Caster.SetAV("Variable06", 0)
	Caster.EvaluatePackage()
EndEvent


;Play the Soul Trap VFX as usual.
Event OnEffectFinish(Actor Target, Actor Caster)
	if DeadAlready == False
		TrapSoundFX.play(Caster)
		TrapImod.apply()
		TargetVFX.Play(victim,4.7,Caster)
		CasterVFX.Play(Caster,5.9,victim)
		TargetFXS.Play(victim,2)
		CasterFXS.Play(Caster,3)
	endif
endEvent



