Scriptname WIKill06RelativeScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
; 	Debug.Trace("WIKill06RelativeScript OnDeath(), calling stop() on quest, since a dead person can't hire thugs. Relative->" + GetReference())
	GetOwningQuest().stop()

EndEvent

