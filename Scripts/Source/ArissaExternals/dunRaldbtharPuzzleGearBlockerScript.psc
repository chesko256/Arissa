scriptName dunRaldbtharPuzzleGearBlockerScript extends objectReference

explosion property havokNudge auto

auto state waiting
	event onCellAttach()
		SetMotionType(4)
	endEvent
	
	event onActivate(objectReference akActivator)
		objectReference myLinkedRef
		myLinkedRef = getLinkedRef()
		if myLinkedRef
			myLinkedRef.activate(self)
			SetMotionType(1)
			self.setDestroyed()
			if havokNudge
				self.placeAtMe(havokNudge)
			endIf
			goToState("Done")
		endif
	endEvent
endstate


state Done
endState
