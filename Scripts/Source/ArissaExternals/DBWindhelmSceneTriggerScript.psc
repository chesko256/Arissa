Scriptname DBWindhelmSceneTriggerScript extends ObjectReference  

Scene Property pDBWindhelmScene  Auto  
Quest Property pWindhelmDialogue  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)


If(game.getPlayer()==AkActivator)
	DialogueWindhelmScript Script = pWindhelmDialogue as DialogueWindhelmScript
       if Script.DBScene == 0
		pDBWindhelmScene.Start()
		Disable()
	Endif
Endif

EndEvent

