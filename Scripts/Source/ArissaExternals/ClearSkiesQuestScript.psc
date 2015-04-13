Scriptname ClearSkiesQuestScript extends Quest  
{quest script for clear skies controller}

import debug

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
	iClearSkiesLevel  = aiValue1
	trace(self + " OnStoryScript: level = " + iClearSkiesLevel)
endEvent


function ClearSkiesStart()
	; get clear weather for player's location
	ClearWeatherOverride = Weather.FindWeather(NewWeatherType)
	trace(self + " ClearSkiesStart: clear weather = " + ClearWeatherOverride)

	if ClearWeatherOverride

		; transition to that weather
		ClearWeatherOverride.SetActive( abOverride = true)

		; calculate duration
		int waitTime = iDurationLevel1
		if iClearSkiesLevel == 2
			 waitTime = iDurationLevel2
		elseif iClearSkiesLevel == 3
			 waitTime = iDurationLevel3
		endif
		trace(self + " ClearSkiesStart: duration = " + waitTime)

		; register for single update, which is what will stop this quest and release weather override
		RegisterForUpdateGameTime(waitTime)

	else
		Stop()
	endif
endFunction

event OnUpdateGameTime()
	; single update = time to shut down
	trace(self + " OnUpdate: stopping quest")
	Stop()
endEvent

int Property iClearSkiesLevel  Auto  
{level of shout passed in from event (1-3)
}

Weather Property ClearWeatherOverride  Auto  
{current clear weather - need to release override when quest stops}

int Property iDurationLevel1 = 1  Auto  
{real time seconds for Clear Skies level 1}

int Property iDurationLevel2  = 2 Auto  
{real time seconds for Clear Skies level 2}

int Property iDurationLevel3  = 3 Auto  
{real time seconds for Clear Skies level 3}



int Property NewWeatherType  Auto  
