Scriptname CR05QuestScript extends CompanionsRadiantQuest Conditional


ReferenceAlias Property Boss auto

Function Accepted()
	parent.Accepted()
	Boss.GetReference().GetParentCell().Reset()
EndFunction
