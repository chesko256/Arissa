Scriptname MGR02FocusPointScript extends ReferenceAlias  


Event OnActivate(ObjectReference ActionRef)

MGR02QuestScript QuestScript = GetOwningQuest() as MGR02QuestScript

	if ActionRef == Game.GetPlayer()
		QuestScript.FocusPointActivate(Self.GetReference())
	endif


EndEvent