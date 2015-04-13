Scriptname PlayerPotionRackTriggerScript extends ObjectReference   

import debug
import utility

ObjectReference Property ShelfContainer auto hidden

Bool Property AlreadyLoaded = FALSE Auto Hidden


EVENT OnCellLoad()
	if AlreadyLoaded == FALSE
		ShelfContainer = GetLinkedRef()
		AlreadyLoaded = TRUE
	endif
endEVENT


STATE WaitForBooks

	EVENT OnBeginState()
		trace(self + " BOOKTRIGGER - Waiting For Books!")
	endEVENT

	EVENT OnTriggerEnter(ObjectReference TriggerRef)
		Trace("DARYL - " + self + " Reference " + TriggerRef + " has ENTERED")

	endEvent

	EVENT OnTriggerLeave(ObjectReference TriggerRef)
		Trace("DARYL - " + self + " Reference " + TriggerRef + " has EXITED")
		Shelfcontainer.RemoveItem(TriggerRef.GetBaseObject(), 1)
		(Shelfcontainer as PlayerBookShelfContainerScript).CurrentBookAmount = (Shelfcontainer as PlayerBookShelfContainerScript).CurrentBookAmount - 1
		(ShelfContainer as PlayerBookShelfContainerScript).RemoveBooks((TriggerRef.GetBaseObject()), 1)
	endEvent


endSTATE


auto STATE IgnoreBooks
	Event OnBeginState()
		trace(self + " BOOKTRIGGER - Ignoring Books!")
	endEVENT
endSTATE


