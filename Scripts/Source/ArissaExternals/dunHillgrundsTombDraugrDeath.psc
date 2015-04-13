scriptName dunHillgrundsTombDraugrDeath extends actor
;
;script that goes on draugr and tells the controller script when they have died
;=============================================================

keyword property linkRefKeyword auto
dunHillgrundsTombEndController myController

auto state waiting
	event onDeath(Actor akKiller)
		if getLinkedRef(linkRefKeyword)
			myController = (getLinkedRef(linkRefKeyword) as dunHillgrundsTombEndController)
			myController.incrementDeathCounter()
			goToState("complete")
		else
; 			debug.Trace("ERROR: " + self + " does not have a linked Reference!")
		endIf
	endEvent
endState


state complete

endState
