Scriptname JailBedScript extends ObjectReference  
{hopefully temp script to serve jail time}

Faction Property CrimeFaction  Auto  
{crime faction that owns this jail}

int jailTime

import Game

Message Property JailBedMsg  Auto  


Event OnActivate(ObjectReference akActivateRef)
	if akActivateRef == Game.GetPlayer()
		; jailTime = CrimeFaction.GetDaysInJail()
		; TEMP:
		jailTime = 10
		if JailBedMsg.Show( jailTime ) == 0
			serveTime()
		endif
	endif
endEvent
