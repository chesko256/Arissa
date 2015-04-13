Scriptname dunYngvildSoulgemScript extends ObjectReference  
import Debug
import Utility

int scriptFired

Quest property myQuest Auto

Event onLoad()
	scriptFired = 0
endEvent

Event OnGrab()
	if (scriptFired == 0)
		myQuest.setStage(50)
		scriptFired == scriptFired + 1
	endIf
endEvent

Event OnActivate(ObjectReference akActionRef)
	if (scriptFired == 0)
		myQuest.setStage(50)
		scriptFired == scriptFired + 1
	endIf
endEvent


