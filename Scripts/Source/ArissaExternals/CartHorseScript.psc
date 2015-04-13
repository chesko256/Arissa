Scriptname CartHorseScript extends ObjectReference  
{script for horse that pulls cart
handle combat situations etc.}

ObjectReference Property myCart  Auto  
{cart I'm assigned to}

Event OnLoad()
	; restrain horse so it can't run around
	Actor selfActor = (self as ObjectReference) as Actor
endEvent
