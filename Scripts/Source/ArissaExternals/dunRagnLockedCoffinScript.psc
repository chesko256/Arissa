scriptName dunRagnLockedCoffinScript extends ObjectReference

import game
import debug
import utility
import quest


Quest Property dunRagnQST Auto

Message Property LockedMessage auto

Key Property dunRagnSaereksKey auto
Key Property dunRagnTorstensKey auto


auto STATE LockedWaitingToBeActivated
	EVENT OnActivate(ObjectReference triggerRef)
		if (Game.GetPlayer().GetItemCount(dunRagnSaereksKey) == 1) && (Game.GetPlayer().GetItemCount(dunRagnTorstensKey) == 1)
			Trace("DARYL - " + self + " Player has both keys, unlocking coffin")
			dunRagnQST.SetStage(20)
			GoToState("Unlocked")
		else
			int buttonPressed = LockedMessage.Show()
			Trace("DARYL - " + self + " Player doesn't have both keys yet, just show the message.")
		endif
	;	if buttonPressed == 1
	;		dunRagnQST.SetStage(20)
	;		GoToState("Unlocked")
	;	else
	;		dunRagnQst.SetStage(10)
	;	endif
	endEVENT
endSTATE

STATE Unlocked
	;Do Nothing
endSTATE