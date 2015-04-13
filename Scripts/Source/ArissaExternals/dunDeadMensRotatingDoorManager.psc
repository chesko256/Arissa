Scriptname dunDeadMensRotatingDoorManager extends ObjectReference  
{Variant of the standard rotating door system for the puzzle in Dead Mens' Respite.}

ObjectReference property pullBar Auto
{One of the pullBars that controls the Rotating Door puzzle.}

ObjectReference property pullBar2 Auto
{One of the pullBars that controls the Rotating Door puzzle.}

Keyword property collisionKeyword Auto
{Keyword for the collision linkedref.}

Keyword property doorKeyword Auto
{Keyword for the rotating doors.}

Auto State Ready
	Event OnActivate(ObjectReference obj)
		GoToState("Busy")
		pullBar.playAnimation("Pull")
		pullBar2.playAnimation("Pull")
		Self.GetLinkedRef(collisionKeyword).Enable()
		Self.GetLinkedRef(doorKeyword).Activate(Self)
		Utility.Wait(2)
		Self.GetLinkedRef(collisionKeyword).Disable()
		GoToState("Ready")
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference obj)
		pullBar.playAnimation("Pull")
		pullBar2.playAnimation("Pull")
; 		;Debug.Trace("Ignoring you...")
	EndEvent
EndState