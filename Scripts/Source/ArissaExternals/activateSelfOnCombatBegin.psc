ScriptName activateSelfOnCombatBegin extends Actor
{Script that lives on an actor that simply activates itself on Combat Begin}

import game
import debug

auto State waiting
	Event OnCombatStateChanged(Actor actorRef, int combatState)
		if combatState != 0 ; 0 = not in combat, so if the state isn't 0, they entered combat
			gotoState("allDone")
			activate(Self)
		endIf
	endEvent
endState

State allDone
	;do nothing
endState
	