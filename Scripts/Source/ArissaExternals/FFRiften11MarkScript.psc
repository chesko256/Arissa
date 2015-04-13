Scriptname FFRiften11MarkScript extends ReferenceAlias  Conditional

Quest Property pFFRiften11Quest Auto
int Property pStage Auto
int Property pObtain Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if pObtain == 0
		if akNewContainer == Game.GetPlayer()
			pFFRiften11Quest.SetStage(pStage)
			pObtain = 1
		endif
	endif

endEvent