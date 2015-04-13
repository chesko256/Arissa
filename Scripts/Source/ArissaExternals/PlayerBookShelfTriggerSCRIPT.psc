Scriptname PlayerBookShelfTriggerSCRIPT extends ObjectReference  

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


auto STATE WaitForBooks

	EVENT OnBeginState()
		;Trace(self + " BOOKTRIGGER - Waiting For Books!")
	endEVENT

	EVENT OnTriggerEnter(ObjectReference TriggerRef)
		;Trace("DARYL - " + self + " Reference " + TriggerRef + " has ENTERED")

	endEvent

	EVENT OnTriggerLeave(ObjectReference TriggerRef)
		; Reference has left this trigger
		if GetParentCell().IsAttached()
			;Trace("DARYL - " + self + " Reference " + TriggerRef + " has EXITED")
			if (TriggerRef == Game.GetPlayerGrabbedRef())
				; Check to see if the player is holding it
				;Trace("DARYL - " + self + " Player has a hold of this reference, do nothing")
			else
				; Player isnt' grabbing this reference, check to see if it's in the container.
				if Shelfcontainer.GetItemCount(TriggerRef.GetBaseObject()) >= 1
					Shelfcontainer.RemoveItem(TriggerRef.GetBaseObject(), 1)
					(Shelfcontainer as PlayerBookShelfContainerScript).CurrentBookAmount = (Shelfcontainer as PlayerBookShelfContainerScript).CurrentBookAmount - 1
					(ShelfContainer as PlayerBookShelfContainerScript).RemoveBooks((TriggerRef.GetBaseObject()), 1)
				else
				; There is no book based on this form in the container
					;Trace("DARYL - " + self + " Container doesn't contain this book")
				endif
			endif
		endif
	endEvent


endSTATE


STATE IgnoreBooks
	Event OnBeginState()
		;Trace(self + " BOOKTRIGGER - Ignoring Books!")
	endEVENT
endSTATE



int Property testint  Auto  
