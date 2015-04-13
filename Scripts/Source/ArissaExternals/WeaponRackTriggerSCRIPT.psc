Scriptname WeaponRackTriggerSCRIPT extends ObjectReference Hidden 

import game
import debug
import utility

Keyword Property WRackActivator Auto

;The activator we must disable if there is already something in this trigger
ObjectReference Property ActivatorRef Auto Hidden

;Reference that is currently in the trigger
ObjectReference Property RefCurrentlyInTrig Auto Hidden

;1 = if something is in this trigger, 0 = empty
Bool Property HasBeenTriggered Auto Hidden

Int Property numInTrig Auto Hidden

Bool Property AlreadyInit Auto Hidden

Bool Property IgnoreArmor = FALSE Auto


EVENT OnReset()
	AlreadyInit = FALSE
	;Trace("DARYL - " + self + " running OnReset() and AlreadyInit = " + AlreadyInit)
endEVENT

EVENT OnLoad()
	;Trace("DARYL - " + self + " running OnLoad() and AlreadyInit = " + AlreadyInit)
	if (AlreadyInit == FALSE) && (self.IsEnabled())
		ActivatorRef = GetLinkedRef(WRackActivator)
		if (ActivatorRef)
			ActivatorRef.Enable()
		endif
		ActivatorRef = NONE
		AlreadyInit = TRUE
		;Trace("DARYL - " + self + " The Activator Ref is " + ActivatorRef)
	else
		;Do nothing
	endif
	;Trace("DARYL - " + self + " finishing OnLoad() and AlreadyInit = " + AlreadyInit)
endEVENT

;EVENT OnCellLoad()
;	;Trace("DARYL - " + self + " running OnCellLoad() and AlreadyInit = " + AlreadyInit)
;	if (AlreadyInit == FALSE) && (self.IsEnabled())
;		ActivatorRef = GetLinkedRef(WRackActivator)
;		AlreadyInit = TRUE
;		;Trace("DARYL - " + self + " The Activator Ref is " + ActivatorRef)
;	else
;		;Do nothing
;	endif
;	;Trace("DARYL - " + self + " finishing OnCellLoad() and AlreadyInit = " + AlreadyInit)
;endEVENT


auto STATE WaitingForReference
	EVENT onTriggerEnter(objectReference triggerRef)
		;Trace("DARYL - " + self + " Just OnTriggerEntered by " + triggerref)
		
		if (IgnoreArmor == TRUE) && (triggerRef.GetBaseObject() as Armor)
			;Trace("DARYL - " + self + " I'm ignoring armor, and this is armor, so I'm doing nothing.")
			;Do Nothing
		else
			;Trace("DARYL - " + self + " I'm updating as normal")
			;numInTrig = (numInTrig + 1)
			HasBeenTriggered = TRUE
			ActivatorRef = GetLinkedRef(WRackActivator)
			if ActivatorRef
				ActivatorRef.Disable()
			endif
			ActivatorRef = NONE
		endif
			
		
	endEVENT
	EVENT OnTriggerLeave(objectReference triggerRef)
		;Trace("DARYL - " + self + " A References has EXITED, refs in this trigger now = " + numInTrig)
		
		if (IgnoreArmor == TRUE) && (triggerRef.GetBaseObject() as Armor)
			;Trace("DARYL - " + self + " I'm ignoring armor, and this is armor, so I'm doing nothing.")
			;Do Nothing
		else
			;Trace("DARYL - " + self + " I'm updating as normal")
			;numInTrig = (numInTrig - 1)
		endif

		if (GetTriggerObjectCount() == 0)
			ActivatorRef = GetLinkedRef(WRackActivator)

			HasBeenTriggered = FALSE
			ActivatorRef.Enable()

			ActivatorRef = NONE

		endif
	endEVENT
endSTATE


