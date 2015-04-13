Scriptname CWCatapultWeaponFireSCRIPT extends ObjectReference  
{Script that fires a catapult projectile every 'Rand' seconds.}

import utility
import weapon
import debug

bool Property Looping auto hidden
float Property WaitTimer Auto hidden
ammo Property CatapultAmmo Auto
weapon Property CatapultWeap Auto



Event OnLoad()	
	Looping = TRUE
	GoToState("FireLoop")
endEVENT


Event OnUnload()
	Looping = FALSE
	GoToState("Waiting")
endEVENT



auto state Waiting
	;Waiting...
endstate


state FireLoop
	EVENT OnBeginState()
		;trace("DARYL - In 'FireLoop' State")
		;Looping = TRUE
		;trace("DARYL - Setting 'Looping' to " + Looping)
		While(Looping)
			;trace ("DARYL - Entering WHILE loop and waiting " + waitTimer + " seconds before firing.")
			waitTimer = randomFloat(4.0, 7.0)
			;trace ("DARYL - Now setting the WaitTimer to " + waitTimer)
			wait(waitTimer)
			;trace ("DARYL - " + self + " firing " + CatapultAmmo + " from " + CatapultWeap)
			if (self as ObjectReference).IsEnabled()
				;trace ("DARYL - Marker is loaded, firing.")
				CatapultWeap.fire( self as objectReference, CatapultAmmo)
			else
				;trace ("DARYL - Marker isn't loaded, no longer firing")
				Looping = False
			endif
		endWhile
	goToState("Waiting")
	endEvent
endstate
		
		
		
;myCatapult = AliasCatapult.GetReference() as CWCatapultWeaponFireScript

;myCatapult.goToState("FireLoop")

;myCatapult.Looping = False
