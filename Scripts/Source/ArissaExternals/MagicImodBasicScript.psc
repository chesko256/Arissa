scriptName MagicImodBasicScript extends ActiveMagicEffect
{Scripted effect fo one basic Imod, nothing flashy.}

;======================================================================================;
;               PROPERTIES  /
;=============/

Bool Property bPlayerOnly = False auto
{Set this if you only want this Imod to play if the player is the spell caster.}
ImageSpaceModifier property ImodFX auto
{main isMod for spell}
Float Property fImodStrength = 1.0 auto
{IsMod Strength from 0.0 to 1.0}

Bool bIsOkToPlay = true
actor TargetActor
actor CasterActor
;======================================================================================;
;	 EVENTS     /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)
	TargetActor = Target
	CasterActor = Caster
	
	if bPlayerOnly
		if CasterActor != game.GetPlayer()
			bIsOkToPlay = False
		endif
	endif
	
	if bIsOkToPlay
		ImodFX.remove()									;Kill Imods from another cast, if running.
		ImodFX.apply(fImodStrength)                             ; remove initial FX
	endif


EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	if bIsOkToPlay
		ImodFX.remove()
	endif
endEvent
