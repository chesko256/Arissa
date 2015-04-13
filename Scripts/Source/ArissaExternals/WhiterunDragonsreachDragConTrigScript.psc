Scriptname WhiterunDragonsreachDragConTrigScript extends ObjectReference  

Scene Property pDragonsreachScene  Auto  
  
 

Event OnTriggerEnter(ObjectReference AkActivator)

DialogueWhiterunScript Script = WhiterunDialogueQuest as DialogueWhiterunScript
If(game.getPlayer()==AkActivator)
	if Script.pDragonConvo == 0
		pDragonsreachScene.Start()
		;Script.pDragonConvo == 1
		Disable()
	Endif
Endif

EndEvent

Quest Property WhiterunDialogueQuest  Auto  
