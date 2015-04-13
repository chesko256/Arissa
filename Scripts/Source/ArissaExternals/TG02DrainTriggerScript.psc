Scriptname TG02DrainTriggerScript extends ObjectReference  Conditional

Quest Property pTG02Quest Auto Conditional
int Property pTG02DrainEntered Auto Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTG02DrainEntered == 0
		if pTG02Quest.getstagedone(40) == 1
			if pTG02Quest.isobjectivedisplayed(47) == 1
				pTG02Quest.setobjectivecompleted(47,1)
				pTG02DrainEntered = 1
			endif
		endif
	endif

endEvent