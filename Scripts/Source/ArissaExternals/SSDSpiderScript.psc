Scriptname SSDSpiderScript extends ObjectReference  Conditional

DialogueShorsStoneQuestScript Property pSSDQS  Auto  Conditional

Event OnDeath(Actor akKiller)

	pSSDQS.SpiderCheck()

endEvent