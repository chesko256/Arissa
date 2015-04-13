Scriptname MQ206ThroatoftheWorldTriggerScript extends ObjectReference  
{track all objects that enter the trigger so they can be disabled/reenable during MQ206}


EVENT onTriggerEnter(objectReference akActionRef)
	if bIsActive
		AddToList(akActionRef)
	endif
endEVENT

Event OnTriggerLeave(ObjectReference akActionRef)
	if bIsActive
		DisableList.RemoveAddedForm(akActionRef)
	endif
endEVENT


function AddToList(ObjectReference akActionRef)
	; check to see if we should add this to our list
	; 
	; not the player, duh
	if akActionRef == Game.GetPlayer()
		return
	endif

	; add to list
	DisableList.AddForm(akActionRef)
endFunction


; disable/enable tracked objects
function DisableObjects(bool bDisable = true)
; 	debug.trace(self + "DisableObjects: START")
	; turn off tracking while enabling/disabling (otherwise list changes out from under us)
	bool bIsActiveSaved = bIsActive
	bIsActive = false
; 	debug.trace(self + "DisableObjects: bIsActiveSaved=" + bIsActiveSaved)

    int cfIndex = 0
    while (cfIndex < DisableList.GetSize())
	if bDisable
; 		debug.trace(self + "DisableObjects:         disabling " +  (DisableList.GetAt(cfIndex) as ObjectReference))
	        (DisableList.GetAt(cfIndex) as ObjectReference).Disable()
	else
	        (DisableList.GetAt(cfIndex) as ObjectReference).Enable()
	endif
        cfIndex += 1
    endwhile

	; put bIsActive back to what it was
	bIsActive = bIsActiveSaved
; 	debug.trace(self + "DisableObjects: DONE")
endFunction

; use this to turn on/off object tracking
; (turn OFF before disabling)
function SetActive(bool bActive)
	bIsActive = bActive
endFunction

; this clears list when trigger is done being used
function ClearList()
	DisableList.Revert()
endFunction

; VARIABLES
bool bIsActive = true			; set to false to turn off tracking

; PROPERTIES

FormList Property DisableList  Auto  
{List to track objects to disable}

