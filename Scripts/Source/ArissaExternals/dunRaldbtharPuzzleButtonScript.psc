scriptName dunRaldbtharPuzzleButtonScript extends objectReference


int property PillarsLit = 0 auto hidden
bool property blockActivate = true auto hidden
message property dunRaldbtharButtonMSG auto

event onLoad()
	if blockActivate
		self.blockActivation()
	endif
endEvent

auto state closed
	event onActivate(objectReference akActivator)
		dunRaldbtharButtonMSG.show()
	endEvent
	
	function incrementPillarsLit()
		PillarsLit += 1
		if PillarsLit >= 2
			goToState("waiting")
			playAnimationAndWait("Open","Done")
			goToState("Open")
			self.blockActivation(false)
		endif
	endfunction

endState

state open

	
	event onActivate(objectReference akActivator)
		goToState("waiting")
		playAnimationAndWait("Trigger01","done")
		;goToState("Open")
	endEvent
endState

state waiting
endState



function incrementPillarsLit()
endfunction
