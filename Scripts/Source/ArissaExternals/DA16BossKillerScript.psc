Scriptname DA16BossKillerScript extends ReferenceAlias  Conditional

DA16QuestScript Property pDA16QS  Auto  
GlobalVariable Property pDA16Boss Auto

Event OnDeath(Actor akKiller)

	pDA16Boss.Value += 1
	pDA16QS.BossTally()

EndEvent