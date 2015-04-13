Scriptname DB09DinnerEnterScript extends ObjectReference  

Quest Property DB09  Auto 

Event OnTriggerEnter(ObjectReference AkActivator)

;If(game.getPlayer()==AkActivator)
	If(pGiannaAlias.GetReference()==AkActivator)
		If(DB09.GetStage()==40) 
			pGiannaEnterRoomScene.Start()
			;DB09.SetStage(50)
			Disable()
		Endif
	Endif
;Endif

EndEvent


Scene Property pGiannaEnterRoomScene  Auto  

ReferenceAlias Property pGiannaAlias  Auto  
