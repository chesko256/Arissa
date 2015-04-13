scriptName dunRaldbtharWebTriggerScript extends objectReference

objectReference property dunRaldbtharWebToDestroy01 auto
objectReference property dunRaldbtharWebToDestroy02 auto


auto state waiting
	event onTriggerEnter (objectReference akTrigger)
		if akTrigger == game.GetPlayer()
			goToState("Done")
			utility.wait(0.5)
			dunRaldbtharWebToDestroy01.damageObject(10)
			dunRaldbtharWebToDestroy02.damageObject(10)
		endif
	endEvent
endState


state Done
endState
