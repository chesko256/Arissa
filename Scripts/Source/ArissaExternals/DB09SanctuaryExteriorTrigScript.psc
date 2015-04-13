Scriptname DB09SanctuaryExteriorTrigScript extends ObjectReference  

Quest Property DB09  Auto  
Quest Property DB10 Auto

Event OnTriggerEnter(ObjectReference AkActivator)

DB06Script Script = pDB06 as DB06Script
If(game.getPlayer()==AkActivator)
	;if pDB06.GetStage() == (20)
		if pDB06.IsObjectiveDisplayed (30)
			if Script.pPlantedLetter==1
				pDB06.SetStage (30)
			Endif
		Endif
	;Endif
Endif


If(game.getPlayer()==AkActivator)
	If(DB09.GetStageDone(70))
		DB09.SetStage (200)
		DB10.SetStage(10)
		pSoldierScene.Start()
		Disable()
	Endif
Endif

 

EndEvent


Scene Property pSoldierScene  Auto  

Quest Property pDB06  Auto  

ReferenceAlias Property MaroAlias  Auto  
