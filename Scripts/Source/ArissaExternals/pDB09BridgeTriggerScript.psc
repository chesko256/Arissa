Scriptname pDB09BridgeTriggerScript extends ObjectReference  

Quest Property DB09  Auto 
Scene Property pMaroBridgeScene Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

;If(game.getPlayer()==AkActivator)
	;If(DB09.GetStage()==60)
		Game.DisablePlayerControls()
		pDB09Script Script = DB09 as pDB09Script
		;Utility.Wait(1)
		pMaroBridgeScene.Start()
		Script.pMaroPosition = 2
		Disable()
	;Endif
;Endif

EndEvent
