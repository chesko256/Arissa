scriptName dunAlftandMakeHostileScript extends referencealias
;
;This script is used to change actor aggression on combat start
;===================================================


auto state waiting
	event onCombatStateChanged(Actor akTarget, int aeCombatState)
		if aeCombatState > 0
			(self.getReference() as actor).setav("aggression", 2)
			goToState("done")
		endif
	endEvent
endState

state done
endState
