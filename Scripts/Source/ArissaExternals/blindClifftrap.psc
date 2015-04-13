scriptName blindCliffTrap extends objectReference
{This is a test script of a flamethrower trap}

import debug
import weapon

weapon  property myWeapon auto
objectReference property myLink auto

EVENT onInit()
	myLink = getLinkedRef()
endEVENT

EVENT onTrigger(objectReference triggerRef)
	myWeapon.fire(myLink)
endEVENT
