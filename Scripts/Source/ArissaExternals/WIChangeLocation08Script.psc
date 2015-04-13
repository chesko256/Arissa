Scriptname WIChangeLocation08Script extends WorldInteractionsScript  
{Extends WorldInteractionsScript which extends Quest}

Keyword Property WIGamesTagStart auto	
Keyword Property WIGamesHideAndSeekStart auto	

LocationAlias Property NewLocation Auto
ReferenceAlias Property Child1 Auto
ReferenceAlias Property Child2 Auto

function startGame(int whichGame = 0, bool PlayerInvolved = False)
{0 = random, 1 = Tag, 2 = Hide and Seek}

; 	debug.trace("WIChangeLocation08Script startGame()")

	if whichGame == 0
		whichGame = Utility.RandomInt(1, 2)
	EndIf
	
	if whichGame == 1
		if PlayerInvolved == True
			WIGamesTagStart.SendStoryEvent(NewLocation.GetLocation(), Game.GetPlayer(), Child1.GetReference())
			
		Elseif Child2.GetReference() ;as long as there is someone else to play with, start a game between the two kids
			WIGamesTagStart.SendStoryEvent(NewLocation.GetLocation(), Child1.GetReference(), Child2.GetReference())
			
		EndIf
	
	elseif whichGame == 2
		if PlayerInvolved == True
			WIGamesHideAndSeekStart.SendStoryEvent(NewLocation.GetLocation(), Game.GetPlayer(), Child1.GetReference())
			
		Elseif Child2.GetReference() ;as long as there is someone else to play with, start a game between the two kids
			WIGamesHideAndSeekStart.SendStoryEvent(NewLocation.GetLocation(), Child1.GetReference(), Child2.GetReference())
			
		EndIf
	EndIf
	
; 	debug.trace("WIChangeLocation08Script startGame() stopping quest")
	
	stop()

EndFunction


