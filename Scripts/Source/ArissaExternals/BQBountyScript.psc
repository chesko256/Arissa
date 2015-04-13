Scriptname BQBountyScript extends ReferenceAlias  
{Script attached to BQ quests' Bounty Alias (basically an onDeath script)}

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(100)

EndEvent
