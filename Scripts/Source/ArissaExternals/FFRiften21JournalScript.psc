Scriptname FFRiften21JournalScript extends ReferenceAlias  Conditional

GlobalVariable Property pCount  Auto  
FFRiften21QuestScript Property pFFR21QS  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()

		pFFR21QS.JournalCheck()

	endif

endEvent