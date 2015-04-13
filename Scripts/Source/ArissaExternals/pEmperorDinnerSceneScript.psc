Scriptname pEmperorDinnerSceneScript extends ObjectReference  

Quest Property DB09  Auto 
Scene Property pEmperorDinnerScene Auto  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB09.GetStage()==40)
		;Noble1Alias.GetActorReference().PlayAnimation(ChairEatingSoupStart)
		;Noble2Alias.GetActorReference().PlayAnimation(ChairEatingSoupStart)
		;Noble3Alias.GetActorReference().PlayAnimation(ChairEatingSoupStart)
		;EmperorDecoyAlias.GetActorReference().PlayAnimation(ChairEatingSoupStart)
		Noble1Alias.GetActorReference().PlayIdle(ChairEatingSoupStart)
		Noble2Alias.GetActorReference().PlayIdle(ChairEatingSoupStart)
		Noble3Alias.GetActorReference().PlayIdle(ChairEatingSoupStart)
		EmperorDecoyAlias.GetActorReference().PlayIdle(ChairEatingSoupStart)
		pEmperorDinnerScene.Start()
		Disable()
	Endif
Endif

EndEvent

ReferenceAlias Property Noble1Alias  Auto  
ReferenceAlias Property Noble2Alias  Auto  
ReferenceAlias Property Noble3Alias  Auto  
ReferenceAlias Property EmperorDecoyAlias  Auto  

Idle Property ChairEatingSoupStart  Auto  
