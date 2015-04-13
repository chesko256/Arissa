scriptname NorRotatingDoorLeverScript extends objectReference
{Placed on a NorLever01, this script can control up to 15 simultaneously rotating NorRotatingDoors.}

import debug
import utility
import game
import sound

objectReference property Door01 auto
objectReference property Door02 auto
objectReference property Door03 auto
objectReference property Door04 auto
objectReference property Door05 auto

sound property DRSStoneRotatingDiscLPM auto

int SFXinstance1
int SFXinstance2
int SFXinstance3
int SFXinstance4
int SFXinstance5

bool property startActive auto
{true if door should already be rotating}

bool leftNext = TRUE	; this bool helps us remember which state to go to next

EVENT onInit()
	playAnimation("MidPosition")
	if startActive == true
		wait(RandomFloat(0.25, 2))
		activate(getPlayer())
	endif
endEVENT

AUTO STATE OFFpos
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busyState")
		trace("Switch Animating Down")
		if leftNEXT == true
			playAnimationandWait("pushDown","pushed")
			trace("done animating")
			gotoState("LEFTpos")
			leftNEXT = false
		else
			playAnimationandWait("pullDown","pulled")
			trace ("done animating")
			gotoState("RIGHTpos")
			leftNEXT = true
		endif
	endEVENT
endSTATE

STATE LEFTpos
	EVENT onBeginState()
		door01.playAnimation("rotateLeft")
		SFXinstance1 = DRSStoneRotatingDiscLPM.Play(door01)
		door02.playAnimation("rotateLeft")
		SFXinstance2 = DRSStoneRotatingDiscLPM.Play(door02)
		door03.playAnimation("rotateLeft")
		SFXinstance3 = DRSStoneRotatingDiscLPM.Play(door03)
		door04.playAnimation("rotateLeft")
		SFXinstance4 = DRSStoneRotatingDiscLPM.Play(door04)
		door05.playAnimation("rotateLeft")
		SFXinstance5 = DRSStoneRotatingDiscLPM.Play(door05)
		trace("entering left state")
	endEVENT
	
	EVENT onActivate(objectReference triggerREF)
		gotoState("busyState")
		playAnimationandWait("pushUp","unPushed")
		gotoState("OFFpos")
	endEVENT
	
	EVENT onEndState()
		door01.playAnimation("stop")
		stopInstance(SFXinstance1)
		door02.playAnimation("stop")
		stopInstance(SFXinstance2)
		door03.playAnimation("stop")
		stopInstance(SFXinstance3)
		door04.playAnimation("stop")
		stopInstance(SFXinstance4)
		door05.playAnimation("stop")
		stopInstance(SFXinstance5)
		trace("exiting left state")
	endEVENT
endSTATE

STATE RIGHTpos
	EVENT onBeginState()
		door01.playAnimation("rotateRight")
		SFXinstance1 = DRSStoneRotatingDiscLPM.Play(door01)
		door02.playAnimation("rotateRight")
		SFXinstance2 = DRSStoneRotatingDiscLPM.Play(door02)
		door03.playAnimation("rotateRight")
		SFXinstance3 = DRSStoneRotatingDiscLPM.Play(door03)
		door04.playAnimation("rotateRight")
		SFXinstance4 = DRSStoneRotatingDiscLPM.Play(door04)
		door05.playAnimation("rotateRight")
		SFXinstance5 = DRSStoneRotatingDiscLPM.Play(door05)
		trace("entering right state")
	endEVENT
	
	EVENT onActivate(objectReference triggerREF)
		gotoState("busyState")
		playAnimationandWait("pullUp","unPulled")
		gotoState("OFFpos")
	endEVENT
	
	EVENT onEndState()
		door01.playAnimation("stop")
		stopInstance(SFXinstance1)
		door02.playAnimation("stop")
		stopInstance(SFXinstance2)
		door03.playAnimation("stop")
		stopInstance(SFXinstance3)
		door04.playAnimation("stop")
		stopInstance(SFXinstance4)
		door05.playAnimation("stop")
		stopInstance(SFXinstance5)
		trace("exiting right state")
	endEVENT
endSTATE

STATE busyState
	; don't do anything while I'm busy.
endSTATE