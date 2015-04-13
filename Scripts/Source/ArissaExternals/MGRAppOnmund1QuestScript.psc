Scriptname MGRAppOnmund1QuestScript extends Quest  Conditional

int Property HelpAsked  Auto  Conditional

int Property EnthirInfo  Auto  Conditional


Function EarlyStaffAcquire()


	if Game.GetPlayer().GetItemCount(Staff.GetReference()) > 0
		SetStage(30)
	endif

EndFunction

ReferenceAlias Property Staff  Auto  
