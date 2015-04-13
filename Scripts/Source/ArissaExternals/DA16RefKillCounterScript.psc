Scriptname DA16RefKillCounterScript extends ObjectReference  Conditional

DA16QuestScript Property pDA16QS Auto

Event OnDeath(Actor akKiller)

	pDA16QS.LibraryTally()

endEvent