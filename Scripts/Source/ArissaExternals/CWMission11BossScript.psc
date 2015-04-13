Scriptname CWMission11BossScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(30)

EndEvent
