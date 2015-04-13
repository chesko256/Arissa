scriptName dunBrinehammerJournal extends objectReference
{this script is to start the quest when the player reads the journal}

quest property dunBrinehammerQST auto
int property myStage = 0 auto

auto State waiting
	event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if akNewContainer == game.getPlayer()
			goToState("done")
			dunBrinehammerQST.start()
		else
; 			debug.Trace(self + ": was added to some other container")
		endif
	endEvent
endState

state done
endState
