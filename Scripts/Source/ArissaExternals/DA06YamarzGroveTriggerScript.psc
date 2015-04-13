Scriptname DA06YamarzGroveTriggerScript extends ObjectReference  

Quest Property DA06  Auto  

ReferenceAlias Property Yamarz  Auto  


Event OnTriggerEnter (ObjectReference TriggerRef)

DA06QuestScript QuestScript = DA06 as DA06QuestScript

	if TriggerRef == Yamarz.GetReference()
		if QuestScript.YamarzGroveMarker == 0
			QuestScript.YamarzGroveMarker =1
			Yamarz.GetActorReference().EvaluatePackage()
		endif
	endif

EndEvent