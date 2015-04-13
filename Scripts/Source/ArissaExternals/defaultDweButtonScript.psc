scriptName defaultDweButtonScript extends objectReference

sound property QSTAstrolabeButtonPressX auto
objectReference property objSelf auto hidden

event onCellAttach()
	objSelf = self as objectReference
	playAnimation("Open")
endEvent


auto state open
	event onActivate(objectReference akActivator)
		goToState("waiting")
		playAnimationAndWait("Trigger01","done")
		if QSTAstrolabeButtonPressX
			QSTAstrolabeButtonPressX.play(objSelf)
		endif
		goToState("Open")
	endEvent
endState

state waiting
endState
