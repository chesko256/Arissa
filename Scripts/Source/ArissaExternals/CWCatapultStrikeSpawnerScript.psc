Scriptname CWCatapultStrikeSpawnerScript extends ObjectReference  

Activator Property CWCatapultStrike Auto
{BASEOBJECT: Pointer to CWCatapultStrike activator}

int numLinkedRefs

int lastChosenLink

Event OnLoad()
	
	lastChosenLink = 0
	numLinkedRefs = countLinkedRefChain()

EndEvent

Function CallCatapultStrike()
; 	debug.trace(self + "CallCatapultStrike()")
	;Call a catapult strike sfx on itself (0) or a random linkedref (n)
	;note: it won't ever call a strike on the same marker more than once, unless there aren't any links
	
	int randomLinkNum = lastChosenLink
	
	While randomLinkNum == lastChosenLink && NumLinkedRefs != 0
		randomLinkNum = Utility.RandomInt(0, numLinkedRefs)
	EndWhile
	
	lastChosenLink = randomLinkNum
	
	ObjectReference placeAtRef = GetNthLinkedRef(randomLinkNum)
	
; 	debug.trace(self + "CallCatapultStrike() callingPlaceAtMe(CWCatapultStrike) on " + placeAtRef)
	placeAtRef.placeAtMe(CWCatapultStrike)
	
EndFunction

