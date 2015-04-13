scriptName SlowdownStrikeScript extends actor
{A more complete prototype script for slowdown around power attacks}

spell property slowTime auto

EVENT onLoad()
		registerForAnimationEvent(self, "slowdownStart")
endEVENT

Event OnAnimationEvent(ObjectReference akSource, string EventName)
	
		if (eventName == "slowdownStart")	; not strictly necessary, but just verify we are catching the correct event			
			; call our function to make sure it's appropriate to play the slowdown effect
			if SlowdownCheck() == TRUE	
				slowTime.cast(self, game.getPlayer())
			else
; 				debug.trace("Tried slowdown, but player not target or in view: "+self)
			endif
		endif
		
endEVENT


bool FUNCTION SlowdownCheck()

	actor myTarget = getCombatTarget()
	objectReference selfREF = self as objectReference
	float angle = myTarget.getHeadingAngle(selfREF)
	bool returnValue = FALSE
	
	; save off the relative heading.  THe goal here is to make sure the enemy is not just on-screen but his weapon is visible, hence the lower threshold on screen-left
; 	debug.trace("heading to target: "+ angle)
	
	if myTarget == game.getPlayer()
		if myTarget.getAnimationVariableBool("isBlocking") == TRUE && myTarget.getEquippedShield() != NONE
			if ((angle < 30) || (angle > -25))
				if myTarget.getDistance(selfREF) <= 300
; 					debug.trace("player can see attacker, trigger slowdown")
					returnValue = TRUE		
				endif
			endif
		endif
	endif		
	
	return returnValue
	
endFUNCTION
