Scriptname _Arissa_MQ01_HostileScript extends ReferenceAlias
{Handles events related to the player being hostle to Arissa during the introduction quest.}

Event OnDeath(Actor akKiller)
	if !(GetOwningQuest().IsCompleted()) && GetOwningQuest().IsRunning()
		if GetOwningQuest().IsObjectiveDisplayed(60)
			GetOwningQuest().SetObjectiveCompleted(60)
			GetOwningQuest().SetStage(201)
		else
			GetOwningQuest().SetStage(250)
		endif
	endif
endEvent