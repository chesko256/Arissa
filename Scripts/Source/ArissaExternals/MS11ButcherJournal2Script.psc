Scriptname MS11ButcherJournal2Script extends ObjectReference  

Quest Property MS11 auto

Event OnRead()
	(MS11 as MS11QuestScript).PlayerReadJournal2 = True
EndEvent
