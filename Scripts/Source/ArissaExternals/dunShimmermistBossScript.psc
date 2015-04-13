ScriptName dunShimmermistBossScript extends Actor
{On Combat start, falmer will activate centurion, waking him and getting back to the fight.}

import game
import debug

Actor Property centurion auto
ObjectReference Property caster01 auto
spell Property wakingSpell auto




auto State Waiting
Event onCombatStateChanged(Actor AkTarget, int aeCombatState)
	if (akTarget == Game.GetPlayer())
		if(aeCombatState == 1)
			utility.wait(3)
			centurion.activate(centurion)
			utility.wait(1)
			self.evaluatePackage()
		endif
		gotoState("allDone")
	endif
EndEvent
EndState

State allDone
EndState


	