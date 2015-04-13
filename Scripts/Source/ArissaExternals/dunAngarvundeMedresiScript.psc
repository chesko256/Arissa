Scriptname dunAngarvundeMedresiScript extends ReferenceAlias  

import Debug

Quest Property myQuest Auto

ObjectReference Property TrapStarter  Auto  

Event OnDeath(Actor akKiller)
	;notification("Medresi Dead")
	TrapStarter.activate(TrapStarter,false)
	myQuest.setStage(100)
endEvent

