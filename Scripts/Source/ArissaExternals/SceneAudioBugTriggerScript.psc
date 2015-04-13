Scriptname SceneAudioBugTriggerScript extends ObjectReference  

Scene Property pNightMotherCall  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)


If(game.getPlayer()==AkActivator)
	;If(DB10.GetStage()==40)
		Debug.MessageBox("You've hit the trigger box, and the scene DB10NightMotherCallScene should play.")
		pNightMotherCall.Start()
		Disable()
	;Endif
Endif

EndEvent






Quest Property DB10  Auto  
