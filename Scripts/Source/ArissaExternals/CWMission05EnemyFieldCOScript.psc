Scriptname CWMission05EnemyFieldCOScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(100)
EndEvent
