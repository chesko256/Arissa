scriptname CWSiegeActivatorSCRIPT extends objectReference


import game
import debug

quest property DefendQuest Auto
quest property AttackQuest Auto

int property DefendStage Auto
int property AttackStage Auto



auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
	
		if AttackQuest.IsRunning()
			AttackQuest.SetStage(AttackStage)
			GoToState("hasBeenTriggered")
			
		elseif DefendQuest.IsRunning()
			DefendQuest.SetStage(DefendStage)
			GoToState("hasBeenTriggered")
			
		endif
		
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE