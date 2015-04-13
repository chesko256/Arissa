Scriptname MG06TelescopeTriggerScript extends ObjectReference  Conditional

Quest Property MG06 auto


Event OnTriggerEnter(ObjectReference AkActionRef)

	if AkActionRef == Game.GetPlayer()
		int MG06Stage = MG06.GetStage()
		if MG06Stage == 30
			MG06.SetStage(40)
		endif
	endif


EndEvent