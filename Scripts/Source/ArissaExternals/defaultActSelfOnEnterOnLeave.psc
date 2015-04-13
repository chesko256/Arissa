ScriptName defaultActSelfOnEnterOnLeave extends TrapTriggerBase
{Default script that simply activates itself onTriggerEnter and onTriggerLeave}

import game
import debug

objectReference property OnlyActor auto
{By default, this property is set to the player}

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		if !onlyActor
			activate(self as ObjectReference)
		elseif (onlyActor == triggerRef)
			activate(self as ObjectReference)
		endif
		
	endEvent
	
	Event onTriggerLeave(objectReference triggerRef)
		if !onlyActor
			activate(self as ObjectReference)
		elseif (onlyActor == triggerRef)
			activate(self as ObjectReference)
		endif
	
	endEvent
endState
	