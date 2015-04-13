Scriptname WIChangeLocation09DragonScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
; 	debug.trace("WIChangeLocation09DragonScript OnDeath() calling stop() on quest")
	GetOwningQuest().stop()	

EndEvent
