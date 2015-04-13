ScriptName magicDisguiseFXScript extends ActiveMagicEffect
{Scripted effect for the Disguise Visual FX}

;======================================================================================;
;  PROPERTIES  /
;=============/
ImageSpaceModifier property FXImod auto
{IsMod applied when we hit a target}
VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}
VisualEffect property CasterVFX auto
{Visual Effect on Caster aming at Target}

;======================================================================================;
;  VARIABLES   /
;=============/
objectReference player  			;NOTICE!!!!  When we can, we need to set this to Caster, not Player!!!!!!!
actor Victim
;======================================================================================;
;  EVENTS      /
;=============/

EVENT onInit()
	player = game.getPlayer()		;NOTICE!!!!  When we can, we need to set this to Caster, not Player!!!!!!!
endEVENT


Event OnEffectStart(Actor Target, Actor Caster)

	victim = target

	if victim == none
		return
	else
		TargetVFX.Play(victim,4.7,player)              ; Play TargetVFX and aim them at the player
		CasterVFX.Play(player,5.9,victim)
		if FXImod != none
			FXImod.apply()                                  ; apply isMod at full strength
		endif
	endif
endEvent

