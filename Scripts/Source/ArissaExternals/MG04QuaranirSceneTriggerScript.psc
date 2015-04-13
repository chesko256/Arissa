Scriptname MG04QuaranirSceneTriggerScript extends ReferenceAlias  


Event OnTriggerEnter(ObjectReference ActionRef)


	if ActionRef == Game.GetPlayer()
		if MG04.GetStage() == 30

			QuaranirAlias.GetActorReference().EvaluatePackage()
			MG04MonkSceneQuest.Start()
;			QuaranirOpeningLineScene.Start()
			Self.GetReference().Disable()

		endif
	endif

EndEvent


Scene Property QuaranirOpeningLineScene  Auto

Quest Property MG04  Auto

Quest Property MG04MonkSceneQuest  Auto

ReferenceAlias Property QuaranirAlias  Auto