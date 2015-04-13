Scriptname MS10HaldynScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	GetOwningQuest().SetStage(70)
endEvent
