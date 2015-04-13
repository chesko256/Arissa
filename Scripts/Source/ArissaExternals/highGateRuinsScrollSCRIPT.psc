Scriptname highGateRuinsScrollSCRIPT extends ObjectReference  

QUEST PROPERTY highGateQuest AUTO
int doOnce

EVENT onActivate(objectReference ref)
	IF ( doOnce == 0 )
	
		highGateQuest.SetStage(90)
		highGateQuest.SetObjectiveCompleted(20, 1)
		highGateQuest.SetObjectiveDisplayed(90, 1)
	
		doOnce = 1
	ENDIF
	
ENDEVENT
