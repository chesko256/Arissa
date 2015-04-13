Scriptname dunGlenmorilWeather extends ObjectReference  
import debug

bool property TurnOn Auto
Weather property GMWeather Auto

Event OnTriggerEnter(ObjectReference obj)
	if (obj == Game.GetPlayer())
		if (TurnOn)
			GMweather.SetActive(true)
			;Notification("Weather On")
		Else
			Weather.ReleaseOverride()
		EndIf
	EndIf
EndEvent

Event OnTriggerleave(ObjectReference TriggerRef)
	if (triggerRef == game.GetPlayer())
		Weather.ReleaseOverride()
		;Notification("Weather Off")
	endif
endEvent
