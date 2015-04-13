Scriptname MS10FallingOffBoat extends ObjectReference  


Quest Property MS10 auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (!MS10.GetStageDone(60))
			; LOL player
			MS10.SetObjectiveFailed(42)
			MS10.SetStage(60)
		endif
		Delete()
	endif
EndEvent

