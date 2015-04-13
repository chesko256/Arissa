Scriptname MGRitual04ItemTriggerScript extends ReferenceAlias  

Quest Property MGRitual04  Auto  


Event OnTriggerEnter (ObjectReference ActionRef)

	If ActionRef == Game.GetPlayer()
		if MGRitual04.GetStage() == 20
			(MGRitual04 as MGRitual04QuestScript).InTrigger=1
			MGRitual04.SetStage(30)
			Self.GetReference().Disable()
		endif
	endif


EndEvent