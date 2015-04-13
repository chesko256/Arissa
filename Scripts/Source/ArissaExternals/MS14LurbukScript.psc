Scriptname MS14LurbukScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as MS14).LurbukArrived = 1

EndEvent
