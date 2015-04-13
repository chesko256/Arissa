scriptName dunBlindCliffKickoffSCRIPT extends objectReference
{minor custom script for Blind Cliff Cave Upper} 

quest property myQST auto
objectReference property MalkaREF auto
scene property dunBlindCliffMelkaBarksScene auto

bool done = FALSE

auto STATE waiting

	EVENT onTriggerEnter(objectReference actronaut)
		if myQST.getStage() < 15 && done == FALSE
			myQST.start()
			myQST.setStage(10)
			while (game.getPlayer()).hasLOS(malkaREF) == TRUE
				dunBlindCliffMelkaBarksScene.start()
; 				debug.trace(self + " has detected player looking @ Malka.  Force Greet")
				malkaREF.activate(game.getPlayer())
				done == TRUE
				gotoState("inactive")
				return
			endWhile
		endif
	endEVENT
	
endSTATE

STATE inactive
	; nothing here
endSTATE
