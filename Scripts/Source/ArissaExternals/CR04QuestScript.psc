Scriptname CR04QuestScript extends CompanionsRadiantQuest Conditional 

ReferenceAlias Property Brute auto
ReferenceAlias Property BruteActivated auto
ReferenceAlias Property FavorDialogueOpponent_Remote auto ; on DialogueFavorGeneric

Function Accepted()
	FavorDialogueOpponent_Remote.ForceRefTo(Brute.GetRef())
	BruteActivated.ForceRefTo(Brute.GetRef())
	parent.Accepted()
EndFunction

Function CheckIntimidate(Actor opponent)
; 	Debug.Trace("CRQ CR04: Opponent: " + opponent + "; Brute: " + BruteActivated.GetReference())
	if (BruteActivated.GetReference() == opponent)
		SetStage(20)
	endif
EndFunction

Function Cleanup()
	FavorDialogueOpponent_Remote.Clear()
	parent.Cleanup()
EndFunction
