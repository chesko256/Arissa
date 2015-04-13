scriptName ShaderParticleGeometryScript extends ActiveMagicEffect
{Generic ShaderParticleGeometry Data Script}

import utility

;======================================================================================;
;  PROPERTIES  /
;=============/

ShaderParticleGeometry property PSGD auto
{ShaderParticleGeometry applied at the start of the spell effect}

float property FadeInTime = 1.0 auto
{Time it takes for the particles to fade in.}
float property FadeOutTime = 1.0 auto
{Time it takes for the particles to fade out.}
bool Property bUseDistanceCheck = False auto
{This will activate a system for checking the distance from a source so that we can remove the effect.}
Float Property fDistnceCheck = 1000.0 auto
{If we excede this distance, the effect will be removed.}
ObjectReference Property DistanceCheckerRef auto
{This is an optional property for and Object to check distance with, in empty, we place a marker at the player's location.}
activator property ActivatorRef auto
{The name of the Activator we will be placing.}

;======================================================================================;
;   EVENTS     /
;=============/

bool bIsTooFar
bool bactive = false
actor player
ObjectReference DistanceCheckObject

Event OnInit()
	if bUseDistanceCheck
		player = game.getplayer()
	endif
EndEvent

Event OnEffectStart(Actor Target, Actor Caster)

	If PSGD != None				;Do we have any data?
		PSGD.remove(FadeOutTime)		; remove ShaderParticleGeometry
		if caster == player
			PSGD.apply(FadeInTime) 		; apply ShaderParticleGeometry
		endif
		bactive = true
		if bUseDistanceCheck
			if DistanceCheckerRef
				DistanceCheckObject = DistanceCheckerRef
			Else
				DistanceCheckObject = Caster.placeAtMe(ActivatorRef)
			endif
			RegisterForSingleUpdate(1.0)
		endif
	EndIf
EndEvent

Event OnUpdate()
	if bActive
		if player.GetDistance(DistanceCheckObject) > fDistnceCheck
			If bIsTooFar == false
				PSGD.remove(FadeOutTime)
				bIsTooFar = true
			endif
		Elseif bIsTooFar == true
			PSGD.apply(FadeInTime)
			bIsTooFar = false
		endif
		RegisterForSingleUpdate(1.0)
	endif
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	bactive = False
	If PSGD != None				;Do we have any data?
		If bIsTooFar == false
			PSGD.remove(FadeOutTime)		; remove ShaderParticleGeometry
		else
			PSGD.remove(0.1)
		endif
	EndIf
	if ActivatorRef
		DistanceCheckObject.disable()
		DistanceCheckObject.delete()
	endif
EndEvent
