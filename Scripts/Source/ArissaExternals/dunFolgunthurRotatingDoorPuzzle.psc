scriptname dunFolgunthurRotatingDoorPuzzle extends objectReference
{Synchronized rotating door levers for Folgunthur.}

import debug
import utility
import game

objectReference property Door01 auto
objectReference property Door02 auto

objectReference property Lever01 auto
objectReference property Lever02 auto

objectReference property InvisibleCollision auto

bool doorState = True

EVENT onInit()
	Door02.playAnimation("SnapClosed")
	Door01.PlayAnimation("SnapOpen")
endEVENT

Auto STATE Active
	EVENT onActivate(objectReference triggerRef)
		GoToState("Busy")

		IF(doorState)
			door01.playAnimation("RotateClosed")
			door02.playAnimation("RotateOpen")
			
			Lever01.playAnimation("FullPush")
			InvisibleCollision.Enable()
			Lever02.playAnimationAndWait("FullPush","FullPushedUp")
			InvisibleCollision.Disable()

			doorState = False
		ELSE
			door01.playAnimation("RotateOpen")
			door02.playAnimation("RotateClosed")
			
			Lever01.playAnimation("FullPull")
			InvisibleCollision.Enable()
			Lever02.playAnimationAndWait("FullPull","FullPulledDown")
			InvisibleCollision.Disable()
			
			doorState = True
		ENDIF
		GoToState("Active")
	ENDEVENT
endSTATE

State Busy
	EVENT onActivate (objectReference triggerRef)
	EndEvent
EndState