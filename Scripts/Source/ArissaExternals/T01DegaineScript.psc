Scriptname T01DegaineScript extends ReferenceAlias  


Event OnDeath(Actor akKiller)
	if (GetOwningQuest().GetStage() == 30)
		GetOwningQuest().SetObjectiveFailed(30, 1)
	endif
EndEvent
