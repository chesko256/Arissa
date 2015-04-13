Scriptname MS11InvestigateKillTriggerScript extends ObjectReference  

ReferenceAlias Property InvestigateTrigger auto

Event OnTriggerEnter(ObjectReference akActivator)
; 	Debug.Trace("MS11: Entering trigger...")
	if ( (akActivator as Actor) != None )
		if (InvestigateTrigger.GetReference())
			(InvestigateTrigger as MS11InvestigateTriggerScript).Cleanup()
		endif
		Delete()
	endif
EndEvent

