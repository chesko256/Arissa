Scriptname TGRDUEvidenceScript Extends ReferenceAlias Conditional

ReferenceAlias Property pEvidenceChest Auto
Quest Property pTGRDU Auto
TGRDUQuestScript Property pTGRDUQS Auto

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if pTGRDUQS.pTGRDUPlanted == 0
		if NewContainer ==  pEvidenceChest.GetRef()
			pTGRDU.SetObjectiveCompleted(10,1)
			pTGRDU.SetObjectiveDisplayed(20,1)
			pTGRDUQS.pTGRDUPlanted = 1
			pTGRDU.SetStage(20)
		endif
	endif

	if pTGRDUQS.pTGRDUPlanted == 1
		if NewContainer == Game.GetPlayer()
			pTGRDU.SetObjectiveCompleted(10,0)
			pTGRDU.SetObjectiveDisplayed(10,1)
			pTGRDU.SetObjectiveDisplayed(20,0)
			pTGRDUQS.pTGRDUPlanted = 0
			pTGRDU.SetStage(20)
		endif
	endif

EndEvent