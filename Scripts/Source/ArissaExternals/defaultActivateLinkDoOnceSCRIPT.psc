ScriptName defaultActivateLinkDoOnceSCRIPT extends objectReference
{Default script intended for triggers.  When hit, they'll activate their linked reference}

import game
import debug

objectReference property OnlyActor auto
{Set this property if you want to only allow activation from a specific actor, such as the player}

bool property doOnce auto
{by default, this trigger fires once only.}

function ActivateNow(objectReference trigRef)
; 	Debug.Trace("Activating: " + self + " " + myLink)
	objectReference myLink = getLinkedRef()

	self.activate(self, true)
	if MyLink != NONE
		myLink.activate(self as objectReference)	
	endif
	if doOnce == true
		gotoState("allDone")
	endif
endFunction

auto STATE waiting
	EVENT onTriggerEnter(objectReference actronaut)
; 	Debug.Trace("Trigger Enter: " + actronaut)
			
		if !onlyActor
			activateNow(actronaut)
		endif
		
		if onlyActor == actronaut
			activateNow(actronaut)
		endif
		
	endEVENT
endSTATE

STATE allDone
;do nothing
endSTATE
	