Scriptname TG05MercerTriggerScript extends ObjectReference  Conditional

ObjectReference Property pTG05MercerRef Auto
Scene Property pTG05Scene  Auto
int Property pTG05Triggered  Auto
Quest Property pTG05Quest Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG05Triggered == 0
			pTG05Quest.SetObjectiveCompleted(20,1)
			pTG05Quest.SetObjectiveDisplayed(35,1)		
			pTG05Scene.Start()
			pTG05Triggered = 1
		endif
	endif

endEvent