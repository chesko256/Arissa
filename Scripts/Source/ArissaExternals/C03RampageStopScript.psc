Scriptname C03RampageStopScript extends ObjectReference  

Quest Property C03Rampage auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		(C03Rampage as C03RampageQuest).TurnBack()
	endif
EndEvent
