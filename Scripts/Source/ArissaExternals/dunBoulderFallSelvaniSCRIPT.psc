scriptName dunBoulderFallSelvaniSCRIPT extends actor
{quest script for Selvani Nethri}

quest property myQuest auto
{dunBoulderFallQST only}

EVENT onDeath(Actor akKiller)
		if myQuest.getStageDone(15) == true
			myQuest.setStage(200)
		endif
endEVENT
