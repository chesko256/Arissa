scriptName demoGiantWalkbySCRIPT extends ObjectReference

ObjectReference property Giant01 auto
ObjectReference property Giant02 auto

bool doEVPonce

EVENT onTriggerEnter(ObjectReference triggerRef)
	if triggerRef == Game.GetPlayer() && Giant01.isDisabled() == TRUE
; 		debug.trace("Player has triggered Giant walk-by scene")
; 		debug.trace("Giant01 == "+giant01)
; 		debug.trace("Giant02 == "+giant02)
		Giant01.enable()
		Giant02.enable()
	endif
endEVENT

EVENT onTriggerLeave(ObjectReference triggerRef)
	if triggerRef == game.getPlayer() && doEVPonce == FALSE
; 		debug.trace("Player is coming! Look busy!")	
		;Giant01.moveto(Giant01)
		;Giant02.moveto(Giant01)
		(Giant01 as actor).evaluatepackage()
		(Giant02 as actor).evaluatepackage()		
		doEVPonce = TRUE
	endif
endEVENT
