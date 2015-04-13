Scriptname PlayerBookShelfClickTriggerSCRIPT extends ObjectReference  

import debug
import utility

ObjectReference Property ShelfContainer auto hidden

Keyword Property BookShelfContainer Auto

Bool Property AlreadyLoaded = FALSE Auto Hidden


EVENT OnCellLoad()
	if AlreadyLoaded == FALSE
		ShelfContainer = GetLinkedRef(BookShelfContainer)
		AlreadyLoaded = TRUE
	endif
endEVENT


EVENT OnActivate(ObjectReference TriggerRef)
	
	Trace("DARYL - " + self + " I've been activated, opening container: " + ShelfContainer)
	ShelfContainer.Activate(Game.GetPlayer(), FALSE)

endEVENT	
