scriptName DBSanctuaryFusedDoor extends objectReference
{Displays a message about the fused door.}

Message property FusedMessage Auto

Event OnLoad()
     BlockActivation(True)
EndEvent

Event OnActivate(ObjectReference obj)
	FusedMessage.Show()
EndEvent