scriptname MS06RotatingDoorSCRIPT extends objectReference
{this script actually lives on the NorRotatingDoor's associated NorLever, not the door itself}

import debug
import utility
import game
import sound

objectReference property myDoor auto
{Point to the associated Door}
bool property startActive auto
{true if door should already be rotating}
sound property DRSStoneRotatingDiscLPM auto
{SFX for the stone disc}

bool leftNext = TRUE	; this bool helps us remember which state to go to next

int SFXinstance

EVENT onLoad()
	playAnimation("MidPosition")
	if startActive == true
		wait(RandomFloat(0.25, 2))
		activate(getPlayer())
	endif
endEVENT

AUTO STATE OFFpos
	EVENT onActivate (objectReference triggerRef)
		myDoor = getLinkedREF()     ; this is a hack to get around an issue with load order on the activator property
		;trace(""+self+" my Door = "+myDoor)
		gotoState ("busyState")
		trace("Switch Animating Down")
		if leftNEXT == true
			playAnimationandWait("pushDown","pushed")
			trace ("done animating")
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
		utility.wait(0.4)
		myDoor.playAnimation("rotateLeft")
		SFXinstance = DRSStoneRotatingDiscLPM.Play(myDoor)
		trace("entering left state")
	endEVENT
	
	EVENT onActivate(objectReference triggerREF)
		gotoState("busyState")
		playAnimationandWait("pushUp","unPushed")
; 		debug.trace("start wait")
		utility.wait(04)
; 		debug.trace("end wait")
		gotoState("OFFpos")
	endEVENT
	
	EVENT onEndState()
; 		debug.trace("play endstate stuff (left)")
		myDoor.playAnimation("Stop")
		stopInstance(SFXinstance)
		trace("exiting left state")
	endEVENT
endSTATE

STATE RIGHTpos
	EVENT onBeginState()
		utility.wait(0.4)
		myDoor.playAnimation("rotateRight")
		SFXinstance = DRSStoneRotatingDiscLPM.Play(myDoor)
		trace("entering right state")
	endEVENT
	
	EVENT onActivate(objectReference triggerREF)
		gotoState("busyState")
		playAnimationandWait("pullUp","unPulled")
		utility.wait(0.4)
		gotoState("OFFpos")
	endEVENT
	
	EVENT onEndState()
		myDoor.playAnimation("Stop")
		stopInstance(SFXinstance)
		trace("exiting right state")
	endEVENT
endSTATE

STATE busyState
	; don't do anything while I'm busy.
endSTATE
