scriptName dunAlftandFlameDoorController extends trapTriggerBase

objectReference property dunAlftandFlameDoorTrap01 auto
objectReference property dunAlftandFlameDoorTrap02 auto
objectReference property dunAlftandFlameDoorTrap03 auto
objectReference property dunAlftandFlameDoorTrap04 auto
objectReference property dunAlftandFlameDoor auto

TrapFlamethrower property dunAlftandFlameDoorTrapScript01 auto hidden
TrapFlamethrower property dunAlftandFlameDoorTrapScript02 auto hidden
TrapFlamethrower property dunAlftandFlameDoorTrapScript03 auto hidden
TrapFlamethrower property dunAlftandFlameDoorTrapScript04 auto hidden
objectReference property objSelf auto hidden

auto state Closed
	event onBeginState()
; 		debug.Trace(self + ": has entered closed state")
		if dunAlftandFlameDoor.getOpenState() == 1
; 			debug.Trace(self + ": has found that my door is open and should close")
			dunAlftandFlameDoor.activate(objSelf)
		else
; 			debug.Trace(self + ": has found that my door is closed and should closed")
		endif
		if dunAlftandFlameDoorTrapScript01.isFiring
			dunAlftandFlameDoorTrapScript01.activate(objSelf)
		endif
		if dunAlftandFlameDoorTrapScript02.isFiring
			dunAlftandFlameDoorTrapScript02.activate(objSelf)
		endif
		if dunAlftandFlameDoorTrapScript03.isFiring
			dunAlftandFlameDoorTrapScript03.activate(objSelf)
		endif
		if dunAlftandFlameDoorTrapScript04.isFiring
			dunAlftandFlameDoorTrapScript04.activate(objSelf)
		endif
		
	endEvent
	
	event onActivate(objectReference akActivator)
		if dunAlftandFlameDoor.getOpenState() == 3
			goToState("Open")
		endif
	endEvent
endState


state Open
	event onBeginState()
; 		debug.Trace(self + ": has entered open state")
		if dunAlftandFlameDoor.getOpenState() == 3
; 			debug.Trace(self + ": has found that my door is open and should close")
			dunAlftandFlameDoor.activate(objSelf)
		else
; 			debug.Trace(self + ": has found that my door is open and should open")
		endif
		if !dunAlftandFlameDoorTrapScript01.isFiring
			dunAlftandFlameDoorTrapScript01.activate(objSelf)
		endif
		if !dunAlftandFlameDoorTrapScript02.isFiring
			dunAlftandFlameDoorTrapScript02.activate(objSelf)
		endif
		if !dunAlftandFlameDoorTrapScript03.isFiring
			dunAlftandFlameDoorTrapScript03.activate(objSelf)
		endif
		if !dunAlftandFlameDoorTrapScript04.isFiring
			dunAlftandFlameDoorTrapScript04.activate(objSelf)
		endif		
	endEvent
	
	
	event onActivate(objectReference akActivator)
		if dunAlftandFlameDoor.getOpenState() == 1
			goToState("Closed")
		endif
	endEvent
endState


event onCellAttach()
	objSelf = self as objectReference
	dunAlftandFlameDoorTrapScript01 = dunAlftandFlameDoorTrap01 as TrapFlamethrower
	dunAlftandFlameDoorTrapScript02 = dunAlftandFlameDoorTrap02 as TrapFlamethrower
	dunAlftandFlameDoorTrapScript03 = dunAlftandFlameDoorTrap03 as TrapFlamethrower
	dunAlftandFlameDoorTrapScript04 = dunAlftandFlameDoorTrap04 as TrapFlamethrower
endEvent

