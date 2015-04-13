Scriptname TG05MercerTriggerScript03 extends ObjectReference  Conditional

ObjectReference Property pTG05MercerRef Auto
Scene Property pTG05Scene  Auto
int Property pTG05Triggered  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG05Triggered == 0
			if Game.GetPlayer().IsInCombat() == 0
				pTG05Scene.Start()
				pTG05Triggered = 1
			endif
		endif
	endif

endEvent
