Scriptname WIAddItem04Script extends WorldInteractionsScript  Conditional
{Extension of WorldInteractionsScript which extends Quest script.}

float Property pQuestStopDay  Auto  Conditional
{Quest will stop when GameDaysPassed > than this.}


STATE polling	;set in stage 0
	EVENT onUpdate()	;registered in stage 0
; 		debug.trace("WIAdditem04Script polling for GameDaysPassed > pQuestStopDay")
		if pGameDaysPassed.value > pQuestStopDay
; 			debug.trace("WIAdditem04Script: GameDaysPassed > pQuestStopDay")
			Stop()	;stop quest
			gotoState("")
		endif
	endEVENT

endSTATE