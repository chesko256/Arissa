Scriptname C06KodlakScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	if (GetOwningQuest().GetStage() == 60)
		GetOwningQuest().SetStage(70)
	endif
endEvent