scriptName C01dustmansCairnCollisionBlockerScript extends objectReference
{this script is used to turn off/on a collision volume that locks the player in a room}

objectReference property myEnableRef auto
objectReference property myDisableRef auto

auto state Off
	event onActivate(objectReference akActivator)
; 		debug.trace(self + " has recieved activate from " + akActivator)
		if akActivator == myEnableRef
			self.enable(self)
			goToState("On")
		endif
	endEvent
endState


state on
	event onActivate(objectReference akActivator)
; 		debug.trace(self + " has recieved activate from " + akActivator)
		if akActivator == myDisableRef
			self.disable(self)
			goToState("Off")
		endif
	endEvent
endstate
