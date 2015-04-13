Scriptname CR02QuestScript extends CompanionsRadiantQuest Conditional

LocationAlias Property AnimalDen auto
ReferenceAlias Property BeastBoss auto

Function Setup()
; 	Debug.Trace("CRQ: CR02 alias den: " + AnimalDen.GetLocation())
; 	Debug.Trace("CRQ: CR02 alias boss: " + BeastBoss.GetReference())
	parent.Setup()
EndFunction

Function Accepted()
	parent.Accepted()
	BeastBoss.GetReference().GetParentCell().Reset()
EndFunction
