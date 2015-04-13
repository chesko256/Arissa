Scriptname DA16RefKillLabScript extends ObjectReference  Conditional

DA16QuestScript Property pDA16QS Auto

Event OnDeath(Actor akKiller)

	pDA16QS.LabTally()

endEvent
