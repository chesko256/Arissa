Scriptname WIAssault02LetterScript extends ReferenceAlias  
{Set quest stage when player reads letter.}

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		GetOwningQuest().setStage(10)

	endif

endEvent