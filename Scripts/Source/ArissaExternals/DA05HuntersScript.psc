Scriptname DA05HuntersScript extends ReferenceAlias  

Quest property DA05 Auto

Event OnDeath(Actor akKiller)
	(DA05 as DA05QuestScript).KillHunter(GetActorReference())
endEvent
