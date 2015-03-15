Scriptname _Arissa_MQ02CaveEntranceScript extends ObjectReference  

Quest property _Arissa_MQ02 auto
_Arissa_iNPC_Behavior property iNPCSystem auto

Event OnTrigger(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if _Arissa_MQ02.IsRunning() && _Arissa_MQ02.GetStage() == 40
			_Arissa_MQ02.SetStage(50)
		endif

		if !_Arissa_MQ02.IsCompleted()
			if !iNPCSystem.IsFollowing
				iNPCSystem.EngageFollowBehavior()
			endif

			iNPCSystem.CanWait = false

		endif

	endif
endEvent