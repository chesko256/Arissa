Scriptname dunPOISnowyGhostFreeformScript extends ObjectReference  


GlobalVariable property gameHour auto
Actor property ghost auto
ObjectReference Property graverobberEnableMarker auto


auto State waiting
Event OnTriggerEnter(objectReference actronaut)
		if (gameHour.getValue() >= 20 || gameHour.getValue() <= 5)
			ghost.enable(true)
			ghost.evaluatepackage()
			graverobberEnableMarker.enable()	
			self.disable()
		EndIf
	endEvent
EndState


