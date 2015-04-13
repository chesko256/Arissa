Scriptname MG08TEMPBarrierTriggerScript extends ObjectReference  

Quest Property MG08  Auto  

ObjectReference Property Barrier  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MG08.GetStage() == 10
			MG08.SetStage(20)
			Barrier.Disable()
		endif
	endif

EndEvent