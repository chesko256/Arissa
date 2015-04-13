Scriptname C01AmbushStartLever extends ObjectReference  


Scene Property AmbushScene auto
Quest Property C01 auto
ReferenceAlias Property Observer auto
Cell Property MyCell auto

auto State Ready
	Event OnActivate(ObjectReference akActivator)
		(C01 as C01QuestScript).AmbushLeverPulled = true
		if (!(C01 as C01QuestScript).ObserverCloseBy)
; 			Debug.Trace("C01: Observer having trouble following; compensating.")
			Observer.GetReference().MoveTo((C01 as C01QuestScript).ObserverCompensationPoint)
			if (Observer.GetReference().GetParentCell() != MyCell)
; 				Debug.Trace("C01: Something has gone horribly wrong. Skipping lever effect.")
				return
			endif
		endif

		AmbushScene.Start()
		GoToState("Done")
	EndEvent
EndState


State Done
EndState