Scriptname WERJ07DistanceCheck extends ReferenceAlias  
import Debug
import Utility

int Property myStage  Auto  

Quest Property myQuest  Auto  
Scene Property ScenetoEnd  Auto  
Scene Property ScenetoStart  Auto  

int distanceCheck = 750
bool breakLoop

EVENT onLoad()  
	;Notification("Load")					
	if myQuest.getStageDone(myStage) == FALSE
		UpdateLoop()											; Before we can use onUdate() we must register.
	endIf																	; This script will update every (2) seconds
endEVENT
 
EVENT onUnload()
	breakLoop = True
endEVENT
 
Function UpdateLoop()
	While (myQuest.GetStage() < myStage && !breakLoop)
		if (getReference().getDistance(game.getplayer()) <= distanceCheck)
			ScenetoEnd.Stop()
			wait(0.1)
			;myQuest.setStage(myStage)	
			ScenetoStart.Start()
		EndIf
		;Notification("BING")
		Wait(2)
	EndWhile
	breakLoop = False
EndFunction

