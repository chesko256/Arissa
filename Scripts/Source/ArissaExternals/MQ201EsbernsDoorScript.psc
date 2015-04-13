Scriptname MQ201EsbernsDoorScript extends ReferenceAlias  
{script on Esbern's door in the Ratway}

auto STATE readyToPlayScene
event OnActivate(objectReference triggerREF)
	if triggerRef == game.getPlayer()
		EsbernLockedDoorScene.Start()
		gotoState("scenePlaying")
	endif
endEvent

endSTATE

STATE scenePlaying
	; this state doesn't do anything
	EVENT onActivate(objectReference triggerRef)
	endEvent
endSTATE

EVENT onActivate(objectReference triggerRef)
endEvent


Scene Property EsbernLockedDoorScene  Auto  
{scene that plays when you activate locked door}
