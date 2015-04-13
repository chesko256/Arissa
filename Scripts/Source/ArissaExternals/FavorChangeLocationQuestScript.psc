scriptName FavorChangeLocationQuestScript extends quest conditional

GlobalVariable Property GameDaysPassed auto

GlobalVariable Property pFavorTimeLeft auto

Faction Property FavorQuestGiverFaction Auto

float fHourAsFloat = 0.0 ; set in OnInit
float fFavorEndTime
float fNextNotifyTime
float fFavorTimerReset

float fLastUpdateDays = 0.0

bool bTimerCancelled = false

LocationAlias Property pFavorLocation Auto

bool Property bDisplayObjective  Auto  
{set to true to display objective and timer}

float fFavorTimer

Event OnInit()
	fHourAsFloat = 1.0 / 24.0
EndEvent

Event OnUpdateGameTime()
; 	debug.trace(self + "OnUpdateGameTime")
	
	float fCurrentTimeDays = GameDaysPassed.Value
	float fTimePassed = (fCurrentTimeDays - fLastUpdateDays) / fHourAsFloat
	
; 	;Debug.Trace(self + "Time passed since last update: " + fTimePassed + " hours")
	
	;run reset timer if the player is not in the favor location or a child of the favor location
	If Game.GetPlayer().IsInLocation(pFavorLocation.GetLocation()) == False
		; decrement timer
		fFavorEndTime = fFavorEndTime - fTimePassed
; 		Debug.Trace(self + "Timer left " + fFavorEndTime + " hours")
		if fFavorEndTime <= 0
			; run out of time
			SetStage(200)
		else
			; update last update time
			fLastUpdateDays = fCurrentTimeDays
		endif
	else
		; reset timer
		ResetTimer()
	endif
EndEvent

Function FavorStartUp()
; 	debug.trace(self + "FavorStartUp")
	;start local copy of favor timer
	fFavorEndTime = pFavorTimeLeft.GetValue()
	
	; save original time so we can reset
	fFavorTimerReset = pFavorTimeLeft.GetValue()
	; set starting update time
	fLastUpdateDays = GameDaysPassed.Value
	
	;Poll to see if the player leaves the location
	RegisterForUpdateGameTime(0.2)
EndFunction

Function FavorAccepted()
	
	;Stop polling
	UnregisterForUpdateGameTime()

	if bDisplayObjective
		SetObjectiveDisplayed(10, 1)
	endif
	
EndFunction

Function ResetTimer()
; 	debug.trace(self + "ResetTimer")
	;Reset the favor timer
	fLastUpdateDays = GameDaysPassed.Value
	fFavorEndTime = fFavorTimerReset
EndFunction
	
Function FavorShutdown()
; 	debug.trace(self + "FavorShutdown")
	;Stop polling
	UnregisterForUpdateGameTime()

	;Reset the favor timer if one exists
	If (pFavorTimeLeft)	!= None
		pFavorTimeLeft.SetValue(fFavorTimerReset)
	EndIf

	;Handle loose objectives
	If GetStageDone(20) == 1
		CompleteAllObjectives()
	Else
		; fail objectives if the quest is stopped for any other reason
		FailAllObjectives()
	EndIf

	Stop()

EndFunction