Scriptname dunKarthspirePlatePuzzleSCRIPT extends TrapTriggerBase  
{script for the pressure plates in Karthspire redoubt}

; //if we're one of the safe tiles to walk on
BOOL PROPERTY bSafe=FALSE AUTO
SPELL PROPERTY spellDmg AUTO

PERK PROPERTY karthLightFoot AUTO


; //the reference to the master script (dunKarthspirePuzzleMaster)
OBJECTREFERENCE PROPERTY castSource AUTO

; //main script variable
dunKarthspirePuzzleMaster mainScript

OBJECTREFERENCE victim

EVENT onLoad()

	; //setting the master script to be the one with the stored vars
	mainScript = castSource AS dunKarthspirePuzzleMaster

endEVENT

auto STATE Active
		
		
	EVENt OnTriggerEnter( objectReference triggerRef )	
; 		;debug.TRACE(self + " has been entered by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		
		IF(triggerRef == game.getPlayer() && game.getPlayer().hasPerk(karthLightFoot))
			playAnimation("Down")
			
		ELSE	

			IF(!mainScript.plateSolved)
				spellDmg.cast(castSource, triggerRef)
				TriggerSound.play(self)
			ENDIF
			
			playAnimation("Down")
		
		ENDIF
		
	endEVENT
	
	EVENT OnTriggerLeave( objectReference triggerRef )
; 		;debug.TRACE(self + " has been exited by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		if objectsInTrigger == 0
			playAnimation("Up")
		endif
	endEVENT
	
endSTATE

STATE DoNothing			;Dummy state, don't do anything if animating
	EVENT OnTriggerEnter( objectReference triggerRef )	
; 		;debug.TRACE(self + " has been entered by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	endEVENT
	
	EVENT OnTrigger( objectReference triggerRef )	
	ENDEVENT
	
	EVENT OnTriggerLeave( objectReference triggerRef )
; 		;debug.TRACE(self + " has been exited by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		IF(objectsInTrigger == 0)
			goToState ("Inactive")
			playAnimation("Up")
		
		ENDIF
		
	endEVENT
endSTATE
