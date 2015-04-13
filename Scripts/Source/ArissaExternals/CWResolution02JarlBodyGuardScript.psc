Scriptname CWResolution02JarlBodyGuardScript extends ReferenceAlias  

Event OnInit()
	(GetOwningQuest() as CWResolution02Script).incrementCountBodyGuards()

EndEvent

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as CWResolution02Script).decrementCountBodyGuards()

EndEvent