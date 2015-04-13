Scriptname CR04BruteScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	if (Game.GetPlayer() == akKiller)
		GetOwningQuest().SetStage(30)
	else
		GetOwningQuest().SetStage(40)
	endif
EndEvent
