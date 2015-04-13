Scriptname dunAnsilvundKeyAliasScript extends ReferenceAlias  
{generic script for one-shot quest stage update}

quest property dunAnsilvundQST auto
QF_dunAnsilvundQST_0003D721 property myQuestScript auto hidden

auto STATE waitingForPlayer
	
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if akNewContainer == game.getPlayer()
			myQuestScript = dunAnsilvundQST as QF_dunAnsilvundQST_0003D721
			myQuestScript.keyObtained = True
			myQuestScript.checkQuestEnd()
		endif	
	endEvent

endSTATE
