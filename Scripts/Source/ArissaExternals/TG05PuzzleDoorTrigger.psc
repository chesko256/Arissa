Scriptname TG05PuzzleDoorTrigger extends ObjectReference  

Quest Property pTG05Quest  Auto
int Property pTG05Triggered  Auto  
ReferenceAlias Property pTG05Mercer Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	
	if akActionRef == pTG05Mercer.GetActorRef()
		if pTG05Triggered == 0
			pTG05Quest.Setstage(40)
			pTG05Triggered = 1
		endif
	endif

endEvent