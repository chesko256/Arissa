Scriptname WIKill02Script extends WorldInteractionsScript  conditional
{Extends WorldInteractionsScript which extends Quest.}

float Property pDeathDay  Auto  
{When the victim died - holds the day as float (in terms of GameDaysPassed)}

float Property pHauntDay  Auto  
{when the ghost should start haunting - holds a float (in terms of GameDaysPassed + a number of days in the future)}

int Property pGhostState  Auto  conditional
{0 = not ghost yet, 1 = is ghost, should haunt when > pHauntDay, 2=haunting relative}

ReferenceAlias Property pVictim  Auto  
{pointer to Victim alias}

ReferenceAlias Property pRelative  Auto  
{pointer to Relative alias}

Event OnUpdate()	;registered/unregistered in stage 0/255
	if pGhostState == 0
		;turn into ghost when player leaves
		if pVictim.getReference().GetCurrentLocation() != Game.GetPlayer().GetCurrentLocation()
			if Game.GetPlayer().HasLOS(pVictim.GetReference()) == 0
				pGhostState = 1
				pVictim.getReference().disable()
			endif
		endif
	
	elseif pGhostState == 1
		;if it's time to start haunting
		if pHauntDay < pGameDaysPassed.value
			;start haunting relative if player is not near the relative
			if pRelative.getReference().GetCurrentLocation() != Game.GetPlayer().GetCurrentLocation()
				if Game.GetPlayer().HasLOS(pRelative.GetReference()) == 0
					debug.messageBox("WIKill02Script: using Reset() in place of Resurrect() because that function doesn't exist yet. This needs to change when Resurrect() is in.")
					pVictim.getReference().reset()
					pVictim.getReference().moveto(pRelative.GetReference())
					pVictim.getReference().enable()
					
					UnregisterForUpdate()
					pGhostState = 2
				endif
			endif

		endif

	endif
	

endEvent


