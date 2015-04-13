Scriptname CWResolution01JarlBodyGuardScript extends ReferenceAlias  

Event OnInit()
	(GetOwningQuest() as CWResolution01Script).incrementCountBodyGuards()

EndEvent

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as CWResolution01Script).decrementCountBodyGuards()

EndEvent
