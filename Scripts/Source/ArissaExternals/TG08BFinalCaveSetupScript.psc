Scriptname TG08BFinalCaveSetupScript extends ObjectReference  Conditional

Quest Property pTG08B Auto


Event OnTriggerEnter(ObjectReference akActionRef)

		if pTG08B.getstage() < 55
			pTG08B.setstage (55)
		endif

endEvent
