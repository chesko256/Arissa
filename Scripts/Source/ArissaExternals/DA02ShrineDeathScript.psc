Scriptname DA02ShrineDeathScript extends ReferenceAlias  
{Script on CultistX aliases that handles the onDeath event.}

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as DA02Script).decrementCountCultists(self)
EndEvent
