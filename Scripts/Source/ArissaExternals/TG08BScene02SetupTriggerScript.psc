Scriptname TG08BScene02SetupTriggerScript extends ObjectReference  Conditional

ReferenceAlias Property pTG08BMercerAlias  Auto  Conditional
int Property pTG08BTriggered  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BTriggered == 0
			pTG08BMercerAlias.GetActorRef().Enable()
			pTG08BTriggered = 1
		endif
	endif

endEvent