Scriptname CWMission06TurncoatScript extends ReferenceAlias  
{Checks for death and calls function to decrement property on parent quest and set stage if property is zero.}

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as CWMission06Script).DecrementTurncoatAliveCount()

EndEvent

