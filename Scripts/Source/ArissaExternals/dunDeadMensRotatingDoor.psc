Scriptname dunDeadMensRotatingDoor extends ObjectReference  
{A variant of the standard rotating door script for the puzzle in Dead Mens' Respite. Since this puzzle involves multiple doors being rotated by a single lever, this script is placed on each individual door.}

bool property startOpen Auto

EVENT onLoad()
	IF(!startOpen)
		self.playAnimation("SnapOpen")
	ELSE
		self.playAnimation("SnapClosed")
	ENDIF
endEVENT

EVENT onActivate (objectReference triggerRef)
; 	Debug.Trace("DOOR " + Self + " ROTATING.")
	IF(!startOpen)
		self.playAnimation("RotateClosed")
		startOpen = TRUE
	ELSE
		self.playAnimation("RotateOpen")
		startOpen = FALSE
	ENDIF
ENDEVENT