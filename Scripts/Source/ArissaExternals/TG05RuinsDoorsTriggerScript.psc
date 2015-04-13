Scriptname TG05RuinsDoorsTriggerScript extends ObjectReference  Conditional

ObjectReference Property pTG05MercerRef Auto
Quest Property pTG05Quest  Auto
int Property pTG05Triggered  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == pTG05MercerRef
		if pTG05Triggered == 0
			pTG05Quest.SetStage(30)
			pTG05Triggered = 1
		endif
	endif

endEvent