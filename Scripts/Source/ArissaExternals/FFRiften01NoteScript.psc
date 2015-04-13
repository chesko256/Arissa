Scriptname FFRiften01NoteScript extends ReferenceAlias  Conditional

Quest Property pFFRiften01Quest  Auto  
int Property pGotNote Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	
	if pGotNote == 0
		if akNewContainer == Game.GetPlayer()
			pFFRiften01Quest.Setstage(40)
			pGotNote = 1
		endif
	endif

endEvent