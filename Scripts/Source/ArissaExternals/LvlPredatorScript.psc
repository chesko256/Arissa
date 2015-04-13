Scriptname LvlPredatorScript extends Actor 
{used to disable linked multiples for certain types of predator}

import game


Faction Property SoloFaction1  Auto  
{solo predator faction}

Faction Property SoloFaction2  Auto  
{solo predator faction}

Faction Property SoloFaction3  Auto  
{solo predator faction}

Keyword Property SoloKeyword  Auto  
{if I have a link of this keyword, I'm not the "solo" predator}


; when I load, if I'm in one of the solo predator factions, and have a link, disable me
event OnCellLoad()
; 	debug.trace("I am a " + self.getRace())
	if CheckForDisable()
		disable()
	else
		enable()
	endif

endEvent

bool function CheckForDisable()
	bool bDisableMe = false
	actor myselfActor = (self as ObjectReference) as Actor
	if (SoloFaction1 && myselfActor.IsInFaction(SoloFaction1)) || (SoloFaction2 && myselfActor.IsInFaction(SoloFaction2)) || (SoloFaction3 && myselfActor.IsInFaction(SoloFaction3))
; 		debug.trace(self + "CheckForDisable() - in solo faction: " + solofaction1 + ", " + solofaction2 + ", " + solofaction3)
		if SoloKeyword && GetLinkedRef(SoloKeyword)
; 			debug.trace(self + "CheckForDisable() - DISABLING MYSELF: I have link(" + GetLinkedRef(SoloKeyword) + " with keyword " + solokeyword)
			bDisableMe = true
		endif
	endif

	if (SoloKeyword && GetLinkedRef(SoloKeyword))
		Actor myLinkSolo = getLinkedRef(SoloKeyword) as Actor
		if(self.getRace() != myLinkSolo.getRace())
			;I have a link of this keyword and that link is a different race than me
			bDisableMe = true
		endif
	endif

	return bDisableMe
endFunction
