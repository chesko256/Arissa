Scriptname MS14BenorScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as MS14).BenorArrived = 1

EndEvent
