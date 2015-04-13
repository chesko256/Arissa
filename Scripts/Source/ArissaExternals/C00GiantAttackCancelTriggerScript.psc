Scriptname C00GiantAttackCancelTriggerScript extends ObjectReference  

Quest Property C00GiantAttack auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		C00GiantAttack.SetStage(200)
		Delete()
	endif
EndEvent
