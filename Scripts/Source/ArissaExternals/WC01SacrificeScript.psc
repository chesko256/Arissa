Scriptname WC01SacrificeScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	if (akKiller == Game.GetPlayer())
		GetOwningQuest().SetStage(100)
	endif
EndEvent
