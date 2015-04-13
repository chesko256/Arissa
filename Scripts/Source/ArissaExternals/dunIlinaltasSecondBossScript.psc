ScriptName dunIlinaltasSecondBossScript extends Actor
{On Combat start, start scene and summon three skeletons. Enabling and disabling fx}

import game
import debug

Actor Property skeleton01 auto
Actor Property skeleton02 auto
Actor Property skeleton03 auto
ObjectReference Property caster01 auto
spell Property resurrection auto
spell Property reanimateSelf auto
Scene Property BossFightScene auto


auto State Waiting
Event onCombatStateChanged(Actor AkTarget, int aeCombatState)
	if (akTarget == Game.GetPlayer())
		if(aeCombatState == 1)
			bossFightScene.Start()
			resurrection.cast(caster01,skeleton01)
			resurrection.cast(caster01,skeleton02)
			resurrection.cast(caster01,skeleton03)
			utility.wait(1)
			reanimateSelf.cast(skeleton01, skeleton01)
			reanimateSelf.cast(skeleton02, skeleton02)
			reanimateSelf.cast(skeleton03, skeleton03)
			;skeleton01.PlaceAtMe(SummonFX)
			;skeleton02.PlaceAtMe(SummonFX)
			;skeleton03.PlaceAtMe(SummonFX)
			;Utility.Wait(1)
			;skeleton01.resurrect()
			;Utility.Wait(0.5)
			;skeleton02.resurrect()
			;Utility.Wait(0.5)
			;skeleton03.resurrect()
		endif
		gotoState("allDone")
	endif
EndEvent
EndState

State allDone
EndState


	