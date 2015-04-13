scriptName dunRaldbtharPuzzleGearScript extends objectReference

bool property jammed = true auto hidden

event onLoad()
	if jammed
		playAnimation ("startJammed")
	else
		playAnimation ("startLooping")
	endif
endEvent
	
auto state waiting
	event onActivate(objectReference akActivator)
		if (akActivator as dunRaldbtharPuzzleGearBlockerScript) || (akActivator as dunRaldbtharPuzzleGearScript)
			goToState("done")
			jammed = False
			playanimation("FixLoop")
			objectReference myLinkedRef
			myLinkedRef = getLinkedRef()
			dunRaldbtharPuzzlePillarScript myPillar
			myPillar = myLinkedRef as dunRaldbtharPuzzlePillarScript
			if myPillar
				myPillar.incrementGears()
			elseif myLinkedRef
				myLinkedRef.activate(self)
			endif
		endif
	endEvent
endstate


state done
endstate
