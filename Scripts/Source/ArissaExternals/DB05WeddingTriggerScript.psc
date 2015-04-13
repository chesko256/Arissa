Scriptname DB05WeddingTriggerScript extends ObjectReference  

Scene Property pWeddingScene01  Auto  
Scene Property MusicScene  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If pDB05.GetStage () == 10
		pWeddingScene01.Start()
		;MusicScene.Start()
		Disable()
	Endif
Endif

EndEvent






Quest Property pDB05  Auto  
