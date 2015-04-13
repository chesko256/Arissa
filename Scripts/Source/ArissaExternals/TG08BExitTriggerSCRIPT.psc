Scriptname TG08BExitTriggerSCRIPT extends ObjectReference  

actorBase property Karliah auto
actorBase property Brynjolf auto
quest property TG08B auto
TG08BQuestScript property myQuest auto hidden

event onTriggerEnter(objectReference akTrigger)
	if !myQuest
		myQuest = TG08B as TG08BQuestScript
	endif

	if (akTrigger as actor).getActorBase() == Karliah
		myQuest.pTG08BExitTriggeredKarliah = True
		(akTrigger as actor).evaluatePackage()
	elseif (akTrigger as actor).getActorBase() == Brynjolf
		myQuest.pTG08BExitTriggeredBrynjolf = True
		(akTrigger as actor).evaluatePackage()
	endif
endEvent
