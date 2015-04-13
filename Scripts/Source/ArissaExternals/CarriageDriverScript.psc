Scriptname CarriageDriverScript extends ObjectReference conditional
{new simple furniture version}

Keyword property myHorseKeyword auto
{use to get horse I'm assigned to}

bool property bSitting auto Conditional

; ***** VARIABLES **********
Actor meAsActor

;**************************

event OnCellLoad()
	(GetLinkedRef(myHorseKeyword) as Actor).SetRestrained(true)
endEvent

Event OnSit(ObjectReference akFurniture)
	if akFurniture == GetLinkedRef()
		bSitting = true
	endif
endEvent

Event OnGetUp(ObjectReference akFurniture)
	if akFurniture == GetLinkedRef()
		bSitting = false
	endif
endEvent
