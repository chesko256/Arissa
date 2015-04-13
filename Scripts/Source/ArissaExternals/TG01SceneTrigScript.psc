Scriptname TG01SceneTrigScript extends ObjectReference  Conditional

int Property pTriggered  Auto  
Quest Property pTG01  Auto  
Scene Property pTavernIntroScene  Auto  


event onTriggerEnter (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTriggered == 0
			if pTG01.getstage() == 10		
				pTavernIntroScene.Start()	
				pTriggered = 1
				Disable()
			endif	
		endif
	endif

endEvent