Scriptname dunExploreCompleteSCRIPT extends ReferenceAlias  
{A simple script which takes a quest and a stage and calls it complete.}

QUEST PROPERTY myQuest AUTO

EVENT onACTIVATE(objectReference ref)
	
	IF(ref AS ACTOR == game.getPlayer())
		myQuest.completeQuest()
	ENDIF

ENDEVENT
