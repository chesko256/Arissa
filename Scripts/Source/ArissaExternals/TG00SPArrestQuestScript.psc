Scriptname TG00SPArrestQuestScript extends Quest  Conditional

Keyword Property pTG00SPArrestCWOwner Auto Conditional
ObjectReference Property pTG00SPArrestPrisonMarker Auto Conditional

Event OnUpdateGameTime()

	if GetStage() == 20
		SetStage(30)
	endif

endEvent