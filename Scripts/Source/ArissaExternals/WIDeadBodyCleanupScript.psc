Scriptname WIDeadBodyCleanupScript extends Actor  

;**** This should ONLY BE USED ON UNIQUE ACTORS!!! ****

;This script cleans up dead actors, enables a container (ie grave/crypt) and moves all their inventory, after it Loads/unloads after a certain period of time.
;If you need to temporarily stop someone from being cleaned up, put them in the WINoBodyCleanupFaction faction.

;please do not modify this script without talking to jduvall

WIFunctionsScript Property WI Auto
{Pointer to WIFunctionsScript attached to WI quest. You MUST set this or things will be broken.}

float Property DaysBeforeCleanUp = 0.5 Auto
{Default = 0.5: What's the minimum amount of time (in days) that the body should stick around before being cleaned up. (Clean up happens during while loop.)}

ObjectReference Property DeathContainer Auto
{Container to move all the items the actor has in his inventory when cleaned up.}

actor SelfRef 	;used to keep me persistent so I get UnLoad events while I exist

state Dead
	;do nothing
	Event OnDeath(Actor akKiller)
	EndEvent
	
EndState


Event OnDeath(Actor akKiller)

	GoToState("Dead")
	
	if DeathContainer
		
		bool cleanedUp = false	
		
		while cleanedUp == false
; 			debug.trace("WIDeadBodyCleanupScript" + self + "OnDeath() In While Loop, will try cleaning up after waiting " + DaysBeforeCleanUp)
			
			utility.waitGameTime(DaysBeforeCleanUp * 24)
		
			cleanedUp = checkForCleanup()
		
		endWhile
			
	else
; 		debug.trace("WIDeadBodyCleanupScript" + self + " WARNING: NO DeathContainer!", 2)
	
	endif
		
EndEvent


bool function checkForCleanup()
	
	if IsInFaction(WI.WINoBodyCleanupFaction)
; 		debug.trace("WIDeadBodyCleanupScript" + self + "In Faction WINoBodyCleanupFaction so NOT cleaning up body.", 1)
		;do nothing
		return true ;bail out of while loop
		
	Elseif Is3DLoaded() == False
; 		debug.trace("WIDeadBodyCleanupScript" + self + "Cleaning up body.")
		cleanUpBody()
		return true
	Else
; 		debug.trace("WIDeadBodyCleanupScript" + self + "Not cleaning up body, because my 3D is loaded.")
	EndIf

	return false
	
endfunction

function cleanUpBody()
; 	debug.trace("WIDeadBodyCleanupScript" + self + "cleanUpBody() moving to WIDeadBodyCleanupCellMarker in WIDeadBodyCleanupCell and Calling RemoveAllItems() to DeathContainer, and enabling it:" + DeathContainer)
	
	;Disable()
	;*** It has been decided it's safer to move them to a holding cell, for quests that might be filling allowing for dead actors but not allowing checking for disabled actors
	
	MoveTo(WI.WIDeadBodyCleanupCellMarker)
		
	DeathContainer.SetActorOwner(GetActorBase())
	DeathContainer.Enable()
	RemoveAllItems(DeathContainer)
	
EndFunction
