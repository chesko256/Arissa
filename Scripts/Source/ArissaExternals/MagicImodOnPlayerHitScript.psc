scriptName MagicImodOnPlayerHitScript extends ActiveMagicEffect
{Scripted effect play a one off Imod if the player is hit by the spell with optional removal Imod.}

;======================================================================================;
;               PROPERTIES  /
;=============/

ImageSpaceModifier property OnStartImodFX auto
{main isMod for spell (MUST BE ANIMATED IMOD)}
ImageSpaceModifier property OnFinishImodFX auto
{Optional ending Imod for spell (MUST BE ANIMATED IMOD)}

Float Property fImodStrength = 1.0 auto
{IsMod Strength from 0.0 to 1.0}

bool bPlayerOnly
Bool bIsOkToPlay
actor TargetActor
actor CasterActor
;======================================================================================;
;	 EVENTS     /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)
	TargetActor = Target
	CasterActor = Caster
	
	if TargetActor == game.GetPlayer()
		OnStartImodFX.apply(fImodStrength)
		utility.wait(5.0)
		bIsOkToPlay = True
	endif

EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	if bIsOkToPlay
		if OnFinishImodFX
			OnFinishImodFX.apply(fImodStrength) 
		endif
	endif
endEvent
