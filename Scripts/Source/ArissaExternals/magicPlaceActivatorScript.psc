scriptName magicPlaceActivatorScript extends ActiveMagicEffect
{Scripted magic effect Placing and activator and then removing it.}



;======================================================================================;
;  PROPERTIES  /
;=============/
activator property PlacedActivator auto
{The name of the Activator we will be placing.}
Explosion property ExplosionRef auto
{The name of the Explosion we will be placing.}
Bool property DeletAtEnd = True auto
{Remove the placed activator when the spell ends? (Default = True)}


;======================================================================================;
;  VARIABLES   /
;=============/

objectReference ActivatorRef
bool KeepUpdating = true
form TargetActor

;======================================================================================;
;   EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
		ActivatorRef = Caster.placeAtMe(PlacedActivator)
		TargetActor = Target
; 		;debug.trace ("We placed this Activator: " + PlacedActivator + " and cast it as: " + ActivatorRef)
		if ExplosionRef != none
			ActivatorRef.placeatme(ExplosionRef)
			RegisterForSingleUpdate(0.65)
		endif
EndEvent


Event OnUpdate()

	ActivatorRef.placeatme(ExplosionRef)
; 	;debug.trace ("We will now place the explosion: " + ExplosionRef + " at the activator: " + ActivatorRef)
	if 	KeepUpdating == True
		RegisterForSingleUpdate(0.65)
	endif

endEvent


Event OnEffectFinish(Actor Target, Actor Caster)
	KeepUpdating = false
	if DeletAtEnd
		ActivatorRef.disable()
		ActivatorRef.delete()
	endif
EndEvent



