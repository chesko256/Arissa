Scriptname CWHoldManagerScript extends Quest  
{Controls the respawning of guards in non-contested holds -- this script is attached to CW quest}

int ResetInterval = 3		;# days to wait before resetting all the guards
float ResetDay	= 2.0		;holds GameDaysPassed + ResetInterval

CWScript CWs 

Event OnInit()
	CWs = (self as quest) as CWScript

; 	CWScript.Log("CWHoldManagerScript", self + "OnInit()", 0, True, True)


EndEvent


Event OnUpdate()	;registered in CWScript OnInit()

;OBSOLETE? - letting guards respawn using normal respawn rules

; ;	CWScript.Log("CWHoldManagerScript", self + "OnUpdate()")
;	If CWs.GameDaysPassed.Value > ResetDay
; ;		CWScript.Log("CWHoldManagerScript", self + "OnUpdate() GameDaysPassed[" + CWs.GameDaysPassed.Value + "] > ResetDay[" + ResetDay  + "], calling CWScript ResetHolds() and setting future ResetDay")
;		ResetDay = CWs.GameDaysPassed.Value + ResetInterval
;		CWs.ResetHolds()
;
;	EndIf
	
EndEvent



