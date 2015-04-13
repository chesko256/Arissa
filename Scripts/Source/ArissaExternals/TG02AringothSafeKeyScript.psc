Scriptname TG02AringothSafeKeyScript extends ReferenceAlias  Conditional

Quest Property pTG02Quest  Auto  
int Property pDone Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if pDone == 0
		if akNewContainer == Game.GetPlayer()
			pTG02Quest.SetObjectiveCompleted(48,1)
			pDone = 1
		endif
	endif

endEvent