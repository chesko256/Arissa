Scriptname MG07LabyrinthianTriggerScript extends ObjectReference  

Quest Property MG07  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MG07.GetStage() == 10
			MG07.SetStage(20)
		endif
	endif

EndEvent