Scriptname TG08BStatueDoorTriggerSCRIPT extends ObjectReference  

actorBase property Karliah auto
actorBase property Brynjolf auto
quest property TG08B auto
TG08BQuestScript property myQuest auto hidden

event onTriggerEnter(objectReference akTrigger)
	if !myQuest
		myQuest = TG08B as TG08BQuestScript
	endif

	if (akTrigger as actor).getActorBase() == Karliah				\
			|| (akTrigger as actor).getActorBase() == Brynjolf	\
			|| akTrigger == game.getPlayer()
		
		myQuest.pTG08BStatueDoorReached = True
	endif
endEvent
