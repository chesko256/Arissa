Scriptname MG02VisionTolfdirTriggerScript extends ObjectReference  

Quest Property MG02  Auto  

ReferenceAlias Property MG02Tolfdir  Auto  



Event OnTriggerEnter(ObjectReference ActionRef)

MG02QuestScript QuestScript = MG02 as MG02QuestScript

	if ActionRef == MG02Tolfdir.GetReference()
		if QuestScript.TolfdirUpdate == 1
			QuestScript.TolfdirUpdate=2
		endif
		if QuestScript.PlayerVisionReady==1

			if MG02Tolfdir.GetActorReference().IsInCombat() == false
				if Game.GetPlayer().IsInCombat() == false
					Utility.Wait(2)
					QuestScript.TriggerVision()
					Self.Disable()
				endif
			endif
		else
			Self.Disable()
		endif
	endif

EndEvent