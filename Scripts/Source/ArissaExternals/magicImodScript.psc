scriptName magicImodScript extends ActiveMagicEffect
{Scripted effect for the using Image Space Mods on Magic Effects}



;======================================================================================;
;  PROPERTIES  /
;=============/

ImageSpaceModifier property IntroFX auto
{IsMod applied at the start of the spell effect}

ImageSpaceModifier property StaticFX auto
{IsMod applied during all of the spell effect}

ImageSpaceModifier property OutroFX auto
{IsMod applied at the end of the spell effect}

Float property fStaticDelay auto
{Time to wait for the static to start}



bool bIsFinishing = false

;======================================================================================;
;   EVENTS     /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)
	If IntroFX != None				;Do we have an Intro?
		introFX.apply()   				; apply isMod at full strength
	EndIf
	Utility.wait (fStaticDelay)
	if bIsFinishing == false
		If StaticFX != None				;Do we have an Static?
			StaticFX.apply()   				; apply isMod at full strength
		endif
	EndIf
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	bIsFinishing = true
	If OutroFX != None					;Do we have an Outro?
		OutroFX.apply()						; apply isMod at full strength
	EndIf
	if StaticFX != None
		StaticFX.remove()
	endif
endEvent
