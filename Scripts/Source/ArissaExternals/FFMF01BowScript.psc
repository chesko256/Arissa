Scriptname FFMF01BowScript extends ReferenceAlias  

Quest Property pFFMF01Quest Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if pFFMF01Quest.GetStage() >= 20
			pFFMF01Quest.SetStage(30)
		endif
	endif

endEvent