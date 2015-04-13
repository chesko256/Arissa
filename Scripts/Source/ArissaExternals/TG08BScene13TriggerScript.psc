Scriptname TG08BScene13TriggerScript extends ObjectReference  Conditional

Scene Property pTG08BExploreScene13  Auto  
int Property pTG08BTriggered  Auto  
ReferenceAlias Property pTG08BMercerAlias  Auto  Conditional
quest property TG08B auto
TG08BQuestScript property myQuest auto hidden

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08BTriggered == 0
			pTG08BExploreScene13.Start()
			pTG08BMercerAlias.GetRef().Enable()
			pTG08BTriggered = 1
		endif

		if !myQuest
			myQuest = TG08B as TG08BQuestScript
		endif
		myQuest.pTG08BStatueDoorReached = True
	endif

endEvent