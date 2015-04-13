ScriptName SkyBreakerScript extends ObjectReference

import Weather 
Weather Property pRain Auto

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If akSource == Self
		If asEventName == "weaponDraw"
			pRain.ForceActive()
			UnRegisterForAnimationEvent(self, "weaponDraw")
			RegisterForAnimationEvent(self, "weaponSheathe")
		EndIf
	EndIf
	
	If akSource == Self
		If asEventName == "weaponSheathe"
			Weather.ReleaseOverride()
			UnRegisterForAnimationEvent(self, "weaponSheathe")
		EndIf
	EndIf

EndEvent

Event OnEquipped(Actor akActor)

	RegisterForAnimationEvent(self, "weaponDraw")

EndEvent

Event OnUnequipped(Actor akActor)

	UnRegisterForAnimationEvent(self, "weaponDraw")

EndEvent