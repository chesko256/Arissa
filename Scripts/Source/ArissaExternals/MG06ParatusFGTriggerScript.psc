Scriptname MG06ParatusFGTriggerScript extends ObjectReference  

Quest Property MG06  Auto  



ReferenceAlias Property MG06Paratus  Auto  

Event OnTriggerEnter(ObjectReference ActionRef)

	MG06QuestScript QuestScript = MG06 as MG06QuestScript


	if ActionRef == Game.GetPlayer()

			



		if QuestScript.MG06ParatusTracker == 0
			QuestScript.MG06ParatusTracker=1
			MG06Paratus.GetActorReference().EvaluatePackage()
		endif
	endif

EndEvent