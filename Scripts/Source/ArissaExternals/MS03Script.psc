Scriptname MS03Script extends Quest  Conditional

int Property Alarm  Auto  
{Alarm set off in Meadery? Used in stages 55 and 57
}

int Property WorkingWithMaven auto Conditional


;Measure distance from MS03LetrushHideoutMarker to tell when the player is in the Hideout
Event OnUpdate()

	if getStage() == 110
		if Game.GetPlayer().getDistance(LetrushHideoutMarker) < 500 && Alias_LouisLetrush.GetRef().getDistance(LetrushHideoutMarker) < 500 
			;call stage 150, which will determine which scene begins
			setstage(150)

		endif
	endif

endEvent

ObjectReference Property LetrushHideoutMarker  Auto  

ReferenceAlias Property Alias_LouisLetrush  Auto  
