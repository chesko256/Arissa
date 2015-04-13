Scriptname dunFellglowOnLoadUpdateDoor extends ObjectReference
{Script on the Fellglow Keep boss' door. On load, unlocks the door as appropriate.}

;If true, lock the door on load. If false, unlock it.
bool property LockDoor Auto

Event OnLoad()
	Self.Lock(LockDoor)
EndEvent