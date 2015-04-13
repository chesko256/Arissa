Scriptname FFRiften14ItemScript extends ReferenceAlias  Conditional

Quest Property pFFRiften14Quest Auto
int Property pStage Auto
int Property pObtain Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if pObtain == 0
		if akNewContainer == Game.GetPlayer()
			pFFRiften14Quest.SetStage(pStage)
			pObtain = 1
		endif
	endif

endEvent