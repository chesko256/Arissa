Scriptname TriggerRaceMenuScript extends ObjectReference  Conditional
{pops race menu on trigger
}

Auto STATE Listening
	Event OnLoad()
			; show race menu
			gotoState ("done")
			bDone = true
			game.ShowRaceMenu()
			disable()
	endEvent

;	EVENT onTriggerEnter (objectReference triggerRef)
;		if triggerRef == Game.GetPlayer()
;			; show race menu
;			gotoState ("done")
;			game.ShowRaceMenu()
;			disable()
;		endif
;	endEVENT
endState

STATE done
	; do nothing
endSTATE


bool Property bDone  Auto  Conditional

