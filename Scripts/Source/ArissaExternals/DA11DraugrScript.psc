ScriptName DA11DraugrScript extends ReferenceAlias

Event OnDeath(Actor akKiller)

	(GetOwningQuest() as DA11QuestScript).DraugrDead()
	
EndEvent 