Scriptname MS14JorgenScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as MS14).JorgenArrived = 1

EndEvent
