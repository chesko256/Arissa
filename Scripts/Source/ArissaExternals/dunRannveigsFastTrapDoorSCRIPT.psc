Scriptname dunRannveigsFastTrapDoorSCRIPT extends ObjectReference  


import game
import debug

auto STATE DefaultState
	EVENT onTriggerEnter(objectReference triggerRef)	
		objectReference myLink = getLinkedRef()
		if myLink.GetOpenState() == 1 || myLink.GetOpenState() == 2
			;Do Nothing
		else
			myLink.activate(self as objectReference)	
		endif
	
	endEVENT
	
	EVENT OnTriggerLeave(objectReference triggerRef)
		objectReference myLink = getLinkedRef()
		utility.Wait(4)
		
		if GetTriggerObjectCount() == 0
			if myLink.GetOpenState() == 3 || myLink.GetOpenState() == 4
				;Do Nothing
			else
				myLink.activate(self as objectReference)	
			endif
		endif
		
	endEVENT
			
endSTATE
