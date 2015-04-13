Scriptname CWMission11AllyScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(205)

EndEvent
