ScriptName magicAbsorbFXScript extends ActiveMagicEffect
{Scripted effect for Playing Visual Effects that look like absorb connect beams.}

import debug
import game

;======================================================================================;
;  PROPERTIES  /
;=============/
ImageSpaceModifier property TrapImod auto
{IsMod applied with this effect}
;sound property TrapSoundFX auto ; create a sound property we'll point to in the editor
;{Sound played when we trap a soul}
VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}
VisualEffect property CasterVFX auto
{Visual Effect on Caster aming at Target}
; EffectShader property CasterFXS auto
; {Effect Shader on Caster during Soul trap}
; EffectShader property TargetFXS auto
; {Effect Shader on Target during Soul trap}

Float Property fImodFadeDistance = 2048.0 auto
Float Property fEffectDurationMax = 40.0 auto
{Optional property for controling the time of these effects should they be on a zero duration hit effect Default = 40.0}

;======================================================================================;
;  VARIABLES   /
;=============/

Float fTDistance
bool bIsFinishing = False

;======================================================================================;
;  EVENTS      /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)

		if TrapImod
			if Caster != GetPlayer()
				;We want to base the Imod Strength roughly off the distance the Player is from the caster.
				fTDistance = GetPlayer().GetDistance(Caster)
; 				;debug.trace ("Target Distance is: "+ fTDistance)
				fTDistance = (fImodFadeDistance - fTDistance)
				if fTDistance <= 0
					TrapImod.apply(0.25) 
				else
					fTDistance = (fTDistance / fImodFadeDistance)
					if fTDistance < 0.25
						fTDistance = 0.25
					endif
; 					;debug.trace ("Imod Strength is: "+ fTDistance)
					TrapImod.apply(fTDistance) 
				endif
			else
			TrapImod.apply()                                  ; apply isMod at full strength
			endif
		endif
		if bIsFinishing == False
			if TargetVFX
				TargetVFX.Play(Target,fEffectDurationMax,Caster)              ; Play TargetVFX and aim them at the player
			endif
			if CasterVFX
				CasterVFX.Play(Caster,fEffectDurationMax,Target)
			endif
		else
			if TargetVFX
				TargetVFX.Play(Target,2.0,Caster)              ; Play TargetVFX and aim them at the player
			endif
			if CasterVFX
				CasterVFX.Play(Caster,2.0,Target)
			endif
		endif
		; TargetFXS.Play(Target,2)    						; Play Effect Shaders
		; CasterFXS.Play(Caster,3)

EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
		bIsFinishing = True
		if TargetVFX
			TargetVFX.Stop(Target)              ; Play TargetVFX and aim them at the player
		endif
		if CasterVFX
			CasterVFX.Stop(Caster)
		endif
endevent



