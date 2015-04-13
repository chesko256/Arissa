Scriptname MG05CreatureScript extends ReferenceAlias  Conditional

MG05QuestScript  MG05  


Event OnDeath(Actor akKiller)

	MG05= GetOwningQuest() as MG05QuestScript
	MG05.VCount()

EndEvent