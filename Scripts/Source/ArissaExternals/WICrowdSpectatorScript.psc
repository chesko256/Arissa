Scriptname WICrowdSpectatorScript extends ReferenceAlias  

Event OnCellDetach()
; 	debug.trace(self + "OnCellDetach() calling stop on quest")
	GetOwningQuest().stop()

EndEvent


Event OnUnload()
; 	debug.trace(self + "OnUnload() calling stop on quest")
	GetOwningQuest().stop()

EndEvent
