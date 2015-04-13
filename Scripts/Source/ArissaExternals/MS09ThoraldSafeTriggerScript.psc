Scriptname MS09ThoraldSafeTriggerScript extends ObjectReference  

quest Property MS09  Auto  

ReferenceAlias Property MS09ThoraldAlias  Auto  



Event OnTrigger(ObjectReference ActionRef)

MS09QuestScript QuestScript = MS09 as MS09QuestScript

	if ActionRef == MS09ThoraldAlias.GetReference()

		if QuestSCript.MS09ThoraldToSafePoint == 0
			QuestScript.MS09ThoraldToSafePoint =1
			MS09ThoraldAlias.GetActorReference().EvaluatePackage()
		endif
		if MS09ThoraldAlias.GetActorReference().IsInCombat() == False
			MS09.SetStage( 100)
			Disable()
		endif
	endif

EndEvent

