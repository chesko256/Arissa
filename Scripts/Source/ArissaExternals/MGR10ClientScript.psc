Scriptname MGR10ClientScript extends ReferenceAlias  


Event OnDeath(Actor Killer)

	if GetOwningQuest().GetStage() == 10
		GetOwningQuest().SetStage(255)
	endif

EndEvent