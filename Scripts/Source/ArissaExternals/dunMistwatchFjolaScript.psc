Scriptname dunMistwatchFjolaScript extends ReferenceAlias  
import Debug

quest Property myQuest auto

Location Property MistwatchLoc  Auto 

Event OnDeath(Actor akKiller)
;	myQuest.setstage(75)
	if (myQuest.isStageDone(85) == 1)
		myquest.setstage(100)
	else
		myQuest.setstage(75)
	endif
	MistwatchLoc.SetCleared()
endEvent



