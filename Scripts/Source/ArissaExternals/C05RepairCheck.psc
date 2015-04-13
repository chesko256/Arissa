Scriptname C05RepairCheck extends ObjectReference  

Quest Property C04 auto
Quest Property C05 auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (C04.IsCompleted() && !C05.GetStageDone(1))
		C05.SetStage(1)
		Delete()
	endif
EndEvent