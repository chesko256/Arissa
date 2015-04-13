scriptName magicBanishScript extends ActiveMagicEffect
{Scripted effect for the Banish Visual Effects}



;======================================================================================;
;  PROPERTIES  /
;=============/

Activator Property ThingToPlace auto
{MANDATORY: Object placed at the start of the spell effect}

ImageSpaceModifier property ImodFX auto
{OPTIONAL: IsMod applied at the start of the spell effect}

Int Property SecondsBeforeDelete auto

;======================================================================================;
;   EVENTS     /
;=============/


bool function CheckProperties()
	if ThingToPlace == None
; 		debug.trace(self + "Warning: ThingToPlace property is not defined!")
		
		return false
	endif
	
	return true
	
endFunction

Event OnEffectStart(Actor Target, Actor Caster)

; 	;debug.trace(self + "OnEffectStart() Target:" + Target)
	
	if checkProperties() == false
		return
	endif
	
		
	ObjectReference placedEffect

	placedEffect = Target.PlaceAtMe(ThingToPlace)
	placedEffect.moveTo(target)
	
	;Target.ForceRemoveRagdollFromWorld()
	
	If ImodFX != None				;Do we have an Imod?
		ImodFX.apply()   				; apply isMod at full strength
	EndIf
	
	
	Utility.wait(SecondsBeforeDelete)
	
	placedEffect.disable()
	placedEffect.delete()


EndEvent
