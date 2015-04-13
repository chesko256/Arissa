Scriptname C06WolfSpriitScript extends ReferenceAlias  


Event OnDeath(Actor akKiller)
	GetOwningQuest().SetStage(70)
	GetReference().Disable()
EndEvent
