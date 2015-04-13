Scriptname DB09TowerEnterDoorLockTrigScript extends ObjectReference  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB09.GetStage()==20)
		pSolitudeTowerInteriorDoor.Lock (true)
             pSolitudeTowerInteriorDoor.SetLockLevel (255)
		Disable()
	Endif
Endif

EndEvent

ObjectReference Property pSolitudeTowerInteriorDoor  Auto  

Quest Property DB09  Auto  
