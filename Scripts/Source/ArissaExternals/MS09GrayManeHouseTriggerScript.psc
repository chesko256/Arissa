Scriptname MS09GrayManeHouseTriggerScript extends ObjectReference  

Quest Property MS09  Auto  

ReferenceAlias Property MS09Avulstein  Auto  


Event OnTriggerEnter (ObjectReference AkActionRef)

	MS09QuestScript MS09Script = MS09 as MS09QuestScript


	if MS09.GetStage() < 10 
		if AkActionRef == Game.GetPlayer()
			if MS09Script.MS09AvulsteinSceneTrigger == 0 
				MS09Script.MS09AvulsteinSceneTrigger = 1
				MS09Avulstein.GetActorReference().EvaluatePackage()
			endif
		endif
	endif

EndEvent
