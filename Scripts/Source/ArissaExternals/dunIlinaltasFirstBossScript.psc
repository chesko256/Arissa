ScriptName dunIlinaltasFirstBossScript extends Actor
{When combat starts, the necromancer will lift the drawbridge separating him from the player.}

import game
import debug

ObjectReference Property drawbridge auto

auto State Waiting
Event onCombatStateChanged(Actor AkTarget, int aeCombatState)
	if (akTarget == Game.GetPlayer())
		if(aeCombatState == 1)
			drawbridge.activate(self)
		endif
		gotoState("allDone")
	endif
EndEvent
EndState

State allDone
EndState


	