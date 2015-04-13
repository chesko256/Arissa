Scriptname HonorhallInitialSceneTriggerScript extends ObjectReference

Scene Property pHonorhallScene  Auto  
Quest Property pRiftenDialogue  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)


If(game.getPlayer()==AkActivator)
	DialogueRiftenQuestScript Script = pRiftenDialogue as DialogueRiftenQuestScript
       if Script.pHonorhallEnterScene == 0
		pHonorhallScene.Start()
		Disable()
	Endif
Endif

EndEvent
  
