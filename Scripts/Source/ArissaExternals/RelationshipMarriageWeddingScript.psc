ScriptName RelationshipMarriageWeddingScript extends Quest

Float property MarriageDay auto
GlobalVariable Property GameDaysPassed auto
GlobalVariable Property GameDay auto
GlobalVariable Property GameHour auto
Location Property TempleofMara auto

Event OnUpdateGameTime()

	;Track when the wedding should take place
; 	debug.trace(self + "Waiting for wedding day: " + MarriageDay + " and today's current day is: " + Math.Floor(GameDaysPassed.GetValue()))
	
	; If it's the wedding day, set up the wedding
	If Math.Floor(GameDaysPassed.GetValue()) == MarriageDay && GetStageDone(10) == 0 && GetStage() < 100
; 		debug.trace(self + "setup the wedding")
		SetStage(10)
	EndIf
	
	; If it's past the wedding day, fail everything
	If Math.Floor(GameDaysPassed.GetValue()) > MarriageDay && GetStageDone(20) == 0 && GetStage() < 100
; 		debug.trace(self + "player is late to wedding, shut down")
		SetStage(150)
	EndIf
	
	;if enough time has passed, make sure the wedding shuts down
	If GetStage() == 500
		Setstage(1000)
	EndIf

EndEvent