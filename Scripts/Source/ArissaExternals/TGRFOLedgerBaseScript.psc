Scriptname TGRFOLedgerBaseScript extends ObjectReference  Conditional

Quest Property pTGRFOQuest Auto
Message Property pTGRFOMessage Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTGRFOQuest.GetStage() != 10
			pTGRFOMessage.Show()
		endif
	endif

endEvent