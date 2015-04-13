Scriptname _Arissa_MQ01_OutsideInnTriggerScript extends ObjectReference  

Quest property _Arissa_MQ01 auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		bool bIsQuestRunning = _Arissa_MQ01.IsRunning()
		bool bCorrectStage
		if _Arissa_MQ01.GetStage() == 10
			bCorrectStage = true
		else
			bCorrectStage = false
		endif

		if bIsQuestRunning && bCorrectStage
			_Arissa_MQ01.SetStage(15)
			self.Disable()
		endif
	endif
endEvent