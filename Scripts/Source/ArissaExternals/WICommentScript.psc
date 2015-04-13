Scriptname WICommentScript extends Quest  

;Primarily used to handle functionality of setting globals that are used by individual WIComment quests to control how often comments about the player are heard

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property WICommentNextAllowed auto

float DaysUntilNextAllowed = 0.04  ;about 1 "game hour" expressed in GameDaysPassed

Function Commented()
	float NextAllowed = GameDaysPassed.GetValue() + DaysUntilNextAllowed
	
; 	debug.trace("WICommentScript Commented() setting WICommentNextAllowed to " + NextAllowed)
	
	WICommentNextAllowed.SetValue(NextAllowed)

EndFunction
