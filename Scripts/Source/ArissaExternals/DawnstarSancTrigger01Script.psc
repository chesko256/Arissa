Scriptname DawnstarSancTrigger01Script extends ObjectReference  


Quest Property DB07  Auto
Quest Property DB11  Auto
Quest Property DBSancRepair  Auto 
Scene Property CiceroTauntScene1  Auto   

Event OnTriggerEnter(ObjectReference AkActivator)

;If(game.getPlayer()==AkActivator)
	;If(DB07.GetStage()==40) 
		;CiceroTauntScene1.Start()
	;Endif
;Endif


If(game.getPlayer()==AkActivator)
	;If(DBSancRepair.GetStage()==10) 
	If(DB11.GetStage()>=200) 
		NightMotherScene.Start()
		;Debug.MessageBox("Hit Trigger")
		Disable()
	Endif
Endif

EndEvent




scene Property NightMotherScene  Auto  
