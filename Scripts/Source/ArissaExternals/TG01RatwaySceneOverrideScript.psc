Scriptname TG01RatwaySceneOverrideScript extends ObjectReference  Conditional

Quest Property pDRRQuest  Auto  
int Property pTriggered Auto
Scene Property pRatwayScene Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			pRatwayScene.Stop()
		endif
	endif

endEvent