Scriptname FreeformCollegeANotesScript extends ReferenceAlias  


Event OnContainerChanged (ObjectReference NewContainer, ObjectReference OldContainer)

	if NewContainer == Game.GetPlayer()
		NoteThief.SetStage(20)
	endif

EndEvent
Quest Property NoteThief  Auto  
