Scriptname shipwreck04JewelryBoxSCRIPT extends ObjectReference  
{when the player picks up this box, advance the Trius quest.}

QUEST PROPERTY shipwreckQuest AUTO
int doOnce

EVENT onActivate(objectReference ref)
	IF ( doOnce == 0 )
	
		shipwreckQuest.SetStage(30)
		shipwreckQuest.SetObjectiveDisplayed(20, 1)
	
		doOnce = 1
	ENDIF
	
ENDEVENT
