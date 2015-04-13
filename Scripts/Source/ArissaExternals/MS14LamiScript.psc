Scriptname MS14LamiScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as MS14).LamiArrived = 1

EndEvent
