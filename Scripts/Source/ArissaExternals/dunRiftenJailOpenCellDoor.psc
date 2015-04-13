Scriptname dunRiftenJailOpenCellDoor extends ObjectReference

ObjectReference property EscapeTriggerDoor auto

Event OnActivate(ObjectReference obj)
	EscapeTriggerDoor.Activate(Game.GetPlayer())
EndEvent