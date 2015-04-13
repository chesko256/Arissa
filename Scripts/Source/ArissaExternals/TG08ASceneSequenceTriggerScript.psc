Scriptname TG08ASceneSequenceTriggerScript extends ObjectReference  


int Property pTG08ADone Auto
ObjectReference Property pTG08AKarliah Auto
Quest Property pTG08AQuest Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == pTG08AKarliah
		if pTG08ADone == 0
			(pTG08AQuest as TG08AQuestScript).pTG08ASeq += 1
			pTG08ADone = 1
		endif
	endif

endEvent