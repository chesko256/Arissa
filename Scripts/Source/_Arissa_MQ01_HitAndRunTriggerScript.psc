Scriptname _Arissa_MQ01_HitAndRunTriggerScript extends ObjectReference  

Quest property _Arissa_MQ01 auto
Scene property _Arissa_MQ01_HitAndRunCommentScene auto
ReferenceAlias property Alias_Arissa auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		bool bIsQuestRunning = _Arissa_MQ01.IsRunning()
		bool bCorrectStage
		if _Arissa_MQ01.GetStage() == 15
			bCorrectStage = true
		else
			bCorrectStage = false
		endif

		if bIsQuestRunning && bCorrectStage
			_Arissa_MQ01_HitAndRunCommentScene.Start()
			utility.wait(10.0)
			;Don't trigger attack until player is looking away.
			while Game.GetPlayer().HasLOS(Alias_Arissa.GetReference())
				utility.wait(0.1)
			endwhile

			;Player lost sight of Arissa; knock his lights out
			_Arissa_MQ01.SetStage(20)
			self.Disable()
		endif
	endif
endEvent

