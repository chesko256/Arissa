scriptName dunRaldbtharPuzzlePillarScript extends objectReference

objectReference property myTorch auto
objectReference property myButton auto
int property gearsMoving = 0 auto hidden

auto state waiting
	function incrementGears()
		gearsMoving += 1
		if gearsMoving >= 2
			goToState("done")
			myTorch.enable(self)
			dunRaldbtharPuzzleButtonScript myButtonScript
			myButtonScript = myButton as dunRaldbtharPuzzleButtonScript
			myButtonScript.incrementPillarsLit()
		endif
	endFunction

endState


state done
endState
	
	
function incrementGears()
endFunction
