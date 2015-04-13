Scriptname pDB06ScheduleScript extends ReferenceAlias  

Quest Property pDB06  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

;Tracks the player picking up the schedule

; ;debug.trace ("objective displaying"+pDB06.IsObjectiveDisplayed (8))
if pDB06.IsObjectiveDisplayed (8)
	DB06Script Script = pDB06 as DB06Script
	if Script.pTookSchedule==0 
		if (akNewContainer == Game.GetPlayer())
			pDB06.SetObjectiveCompleted (8)
			Script.pTookSchedule=1
; 			;debug.trace ("triggering"+akNewContainer)
		endif
	endif
endif

EndEvent




int Property pTookSchedule  Auto  
