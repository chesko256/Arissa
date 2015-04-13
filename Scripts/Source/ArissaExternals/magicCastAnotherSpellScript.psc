scriptName magicCastAnotherSpellScript extends ActiveMagicEffect
{Scripted magic effect for simulating Casting another spell so it can have different casting types.}

import utility
import Debug

;======================================================================================;
;  PROPERTIES  /
;=============/

Spell property CastSpellName auto
{The name of the new Spell we will cast.}

Bool Property AimAtTargets = false auto
{Do you want to aim at targets.}


;======================================================================================;
;  VARIABLES   /
;=============/

Actor CasterRef
Actor TargetRef


;======================================================================================;
;   EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
	CasterRef = Caster
	TargetRef = Target
	if AimAtTargets == True
; 		Debug.Trace("Other Spell Target is: "+ TargetRef)
; 		Debug.Trace("and the Castor is: "+ CasterRef)
		wait(RandomFloat(0,0.8))
		CastSpellName.cast(Caster,TargetRef)
	else
		CastSpellName.cast(Caster,none)
	endif
EndEvent
