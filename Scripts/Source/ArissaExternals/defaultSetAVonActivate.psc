ScriptName defaultSetAVonActivate extends Actor
{Default script that lives on an actor. When activated, its actor value (property) gets set to a value (property)}

import game
import debug

string property sActorVariable auto
{By default, this property is set to Variable01. Set which actor variable to set as a string}

float property fActorVariable auto
{By default this property is set to 1. Set what you want the actor variable to be changed to} 

bool property doOnce auto
{By default, this fires only once}

auto State waiting
	Event onActivate(ObjectReference triggerRef)
		self.setAV(sActorVariable, fACtorVariable)
		self.evaluatePackage()
		if (doOnce == true)
			gotoState ("allDone")
		else
			gotoState ("waiting")
		endif
		
		
	endEvent	
endState

State allDone
	;do nothing
endState
	