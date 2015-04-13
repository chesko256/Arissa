scriptName FavorControlQuestScript extends Quest conditional

Quest OldQuest
Quest MiddleQuest
Quest NewQuest
Message Property FavorStopWarning  Auto  
int property FavorsAcceptedCount auto conditional

; use function to be threadsafe about changing this value
function ModFavorsAcceptedCount(int value)
	FavorsAcceptedCount = FavorsAcceptedCount + value
endFunction

;Function fills in 3 quests in the order they are received into a pseudo-array
;When the function tries to fill in a 4th quest, it kills the oldest quest
Function AddQuest(Quest newestQuest)
  if (OldQuest)
    FavorStopWarning.Show()
    OldQuest.Stop()
  endIf
  OldQuest = MiddleQuest
  MiddleQuest = NewQuest
  NewQuest = newestQuest
EndFunction

;When a quest is stopped, re-order the quest pseudo-array to reflect the current number of quests
Function RemoveQuest(Quest CurrentQuest)
	If (CurrentQuest == NewQuest)
		NewQuest.Stop()
		NewQuest = MiddleQuest
		MiddleQuest = OldQuest
		OldQuest = None
	ElseIf (CurrentQuest == MiddleQuest)
		MiddleQuest.Stop()
		MiddleQuest = OldQuest
		OldQuest = None
	ElseIf (CurrentQuest == OldQuest)
		OldQuest.Stop()
		OldQuest = None
	EndIf
EndFunction

;Function clears out the quest pseudo-array
Function ClearQuests()
  if (OldQuest)
    OldQuest.Stop()    
  endIf
  If (MiddleQuest)
    MiddleQuest.Stop()
  endIf
  If (NewQuest)
    NewQuest.Stop()
  endIf
  OldQuest = None
  MiddleQuest = None
  NewQuest = None
EndFunction