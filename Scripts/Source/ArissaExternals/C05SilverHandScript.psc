Scriptname C05SilverHandScript extends ObjectReference  

Quest Property OwningQuest auto


Event OnDeath(Actor akKiller)
	(OwningQuest as C05QuestScript).KilledSilverHand()
EndEvent
