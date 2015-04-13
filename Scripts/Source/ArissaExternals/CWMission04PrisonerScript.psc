Scriptname CWMission04PrisonerScript extends ReferenceAlias  

Event OnCellLoad()
	GetOwningQuest().setStage(15)

EndEvent

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as CWMission04Script).checkAllPrisonersKill()


EndEvent
