Scriptname DB09MaroDisableTriggerScript extends ObjectReference  

Quest Property pDB09  Auto  
ReferenceAlias Property pMaroAlias  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(pMaroAlias.GetReference()==AkActivator)
	pDB09Script Script = pDB09 as pDB09Script
	;if Script.pMaroPosition == 3
	If(pDB09.GetStage()==70) 
		pMaroAlias.GetReference().Disable()
		Disable()
	Endif
Endif

EndEvent


