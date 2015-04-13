scriptName magicImodBeginLoopEnd extends ActiveMagicEffect
{Scripted effect for the Night Eye Spell}



;======================================================================================;
;               PROPERTIES  /
;=============/

Bool Property bPlayerOnly = False auto
{Set this if you only want this Imod to play if the player is the spell caster.}
float property fDelay = 0.83 auto
{time to wait before switching to constant Imod}
ImageSpaceModifier property IntroFX auto
{IsMod applied at the start of the spell effect}
ImageSpaceModifier property LoopFX auto
{main isMod for spell}
ImageSpaceModifier property OutroFX auto
{IsMod applied at the end of the spell effect}
Float Property fImodStrength = 1.0 auto
{IsMod Strength from 0.0 to 1.0}
; sound property IntroSoundFX auto ; create a sound property we'll point to in the editor
; sound property OutroSoundFX auto ; create a sound property we'll point to in the editor

; Obtain the target of the active fire effect

Bool bIsOkToPlay = true
bool bIsFinishing = false
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
		;int instanceID = IntroSoundFX.play((target as objectReference))          ; play IntroSoundFX sound from my self
		IntroFX.remove()
		LoopFX.remove()									;Kill Imods from another cast, if running.
		OutroFX.remove()	
		
		introFX.apply(fImodStrength)                                  ; apply isMod at full strength
		utility.wait(fDelay)                            ; NOTE - neccessary? 
		if bIsFinishing == False
			;LoopFX.apply()
			introFX.PopTo(LoopFX,fImodStrength)                             ; remove initial FX
		endif
	endif


EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	bIsFinishing = True
	if bIsOkToPlay
		;int instanceID = OutroSoundFX.play((target as objectReference))         ; play OutroSoundFX sound from my self
		introFX.remove()
		;LoopFX.remove()
		LoopFX.PopTo(OutroFX,fImodStrength)
	endif
endEvent
