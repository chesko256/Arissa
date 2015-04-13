Scriptname dunMistwatchChristerScript extends ReferenceAlias   
import Debug

quest Property myQuest auto
Faction Property FjolaFaction auto


Event OnDeath(Actor akKiller)
	myQuest.setstage(85)
	if (myQuest.isStageDone(75) == 1)
		myquest.setstage(100)
	endif
	if (myQuest.isStageDone(70) == 0)
		;Notification("Fjola Gets Mad")
		FjolaFaction.setPlayerEnemy()
	endif
endEvent
