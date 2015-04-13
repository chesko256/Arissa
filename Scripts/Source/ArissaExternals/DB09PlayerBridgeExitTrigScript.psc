Scriptname DB09PlayerBridgeExitTrigScript extends ObjectReference  

Quest Property DB09  Auto 
ObjectReference Property pTowerBridgeDoor  Auto 
ObjectReference Property pAgent1  Auto  
ObjectReference Property pAgent2  Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB09.GetStage()==60)
		pTowerBridgeDoor.Lock (true)
		pTowerBridgeDoor.SetLockLevel (255)
		Game.EnableFastTravel(false)
		pAgent1.Disable()
		pAgent2.Disable()
		pGianna.Disable()
		pNoble1.Disable()
		pNoble2.Disable()
		pNoble3.Disable()
		pEmperorDecoy.Disable()
		;Disable()
	Endif
Endif

EndEvent


Event OnTriggerLeave(ObjectReference AkActivator)
; 	debug.trace(self + "OnTriggerLeave: akActivator=" + akactivator)
	If(game.getPlayer()==AkActivator)
; 		debug.trace(self + "OnTriggerLeave: player leaving trigger")
		If(DB09.GetStage()==60)
; 			debug.trace(self + "OnTriggerLeave: player leaving trigger - setting stage 70")
			DB09.SetStage(70)
		Endif
	Endif

EndEvent



ObjectReference Property pGianna  Auto  

ObjectReference Property pNoble1  Auto  

ObjectReference Property pNoble2  Auto  

ObjectReference Property pNoble3  Auto  

ObjectReference Property pEmperorDecoy  Auto  
