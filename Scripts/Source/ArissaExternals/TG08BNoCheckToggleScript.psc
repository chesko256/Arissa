Scriptname TG08BNoCheckToggleScript extends ObjectReference  Conditional

TG08BQuestScript Property pTG08BQS Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BQS.pTG08BNoCheck == 1
			pTG08BQS.pTG08BNoCheck = 0
		endif
	endif

endEvent