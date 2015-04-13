Scriptname MS06CultistSceneScript extends ReferenceAlias  
{for all necromancer cultists in initial scene}

MS06Script myQuestScript

Event OnDeath(Actor akKiller)
	; increment dead count
	myQuestScript = GetOwningQuest() as MS06Script
	myQuestScript.IncrementDeadCultists()
endEvent