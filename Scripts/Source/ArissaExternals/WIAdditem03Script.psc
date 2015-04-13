Scriptname WIAdditem03Script extends WorldInteractionsScript  Conditional
{Local extension of WorldInteractionScript}

Book Property pContract  Auto  Conditional
{The contract found on the thugs where the victim hires them to attack the player.}

float vThugDay Conditional
;Turn on the thugs when GameDaysPassed > than this.

ReferenceAlias Property pThug1  Auto  
{Pointer to Thug1 alias}

Location Property pDebugPlayerLoc Auto
Location Property pDebugThugLoc Auto

;pGameDaysPassed is property declared in parent script, and set in the quest form, not surprisingly it points to the global variable GameDaysPassed

STATE polling	;set in stage 0
	EVENT onUpdate()	;registered in stage 0
; 		debug.trace("WIAdditem03Script polling for GameDaysPassed > vThugDay")
		if vThugDay == 0
			vThugDay = pGameDaysPassed.value + 1
; 			debug.trace("WIAdditem03Script setting vThugDay to " + vThugDay)
		elseif pGameDaysPassed.value > vThugDay
; 			debug.trace("WIAdditem03Script: GameDaysPassed > vThugDay, checking player not in the same location as Thug1")
			
			pDebugPlayerLoc = Game.getPlayer().getCurrentLocation()
			pDebugThugLoc = pThug1.getReference().getCurrentLocation()

			if Game.getPlayer().getCurrentLocation() != pThug1.getReference().getCurrentLocation()
				setstage(10)	;enable thugs
				gotoState("")
			endif

		endif
	endEVENT

endSTATE

