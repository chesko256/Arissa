Scriptname highGateRuinsAnskaSCRIPT extends ObjectReference  
{The main script to run Anska through High Gate.}

;track the quest so we know what to do
quest PROPERTY highGateQuest AUTO

ReferenceAlias Property aAnska Auto

;as the player hits the triggers, update Anska
bool PROPERTY trig00 AUTO
bool PROPERTY trig10 AUTO
bool PROPERTY trig20 AUTO
bool PROPERTY trig30 AUTO
bool PROPERTY trig40 AUTO
bool PROPERTY trig50 AUTO
bool PROPERTY trig60 AUTO

EVENT onDeath(ACTOR killer)

	; //fail the quest
	highGateQuest.setStage(150)
	
ENDEVENT
