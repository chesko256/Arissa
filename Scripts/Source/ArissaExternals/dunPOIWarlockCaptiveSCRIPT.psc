Scriptname dunPOIWarlockCaptiveSCRIPT extends ObjectReference  
import Debug
import Utility

int Property myStage  Auto  
int Property myStageReleased Auto
int Property myStageAttacked Auto

Quest Property myQuest  Auto  


bool isAttacked = FALSE
int distanceCheck = 2500
bool breakLoop

EVENT onLoad()                       
	if myQuest.getStageDone(myStage) == FALSE
		UpdateLoop()											; Before we can use onUdate() we must register.
	endIf																	; This script will update every (2) seconds
endEVENT
 
EVENT onUnload()
	breakLoop = True
endEVENT
 
Function UpdateLoop()
	While (myQuest.GetStage() < myStage && !breakLoop)
		if (getDistance(game.getplayer()) <= distanceCheck)
			myQuest.Start()
			myQuest.setStage(myStage)	
		EndIf
		Wait(2)
	EndWhile
	breakLoop = False
EndFunction

Event OnActivate(ObjectReference akActionRef)
	if ((akActionRef == game.getPlayer()) && (isAttacked == FALSE))
		myQuest.setstage(myStageReleased)
		elseIf ((akActionRef == game.getPlayer()) && (isAttacked == TRUE))
		myQuest.setStage(myStageAttacked)
	endif
endEVENT

EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akAggressor == game.getPlayer())
		;Notification("Ouch!")
		isAttacked = TRUE
		if (myQuest.isStageDone(myStageReleased) == TRUE)
			myQuest.setStage(myStageAttacked)
		endif
	endif
endEVENT

