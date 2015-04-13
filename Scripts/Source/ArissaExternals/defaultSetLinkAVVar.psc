ScriptName defaultSetLinkAVvar extends objectReference
{Default script that lives on a trigger.  Once triggered, it sets an actor value (property) to a value (property)}

import game
import debug

string property sActorVariable = "Variable01" auto
{By default, this property is set to Variable01. Set which actor variable to set as a string}

float property fActorVariable = 1.0 auto
{By default this property is set to 1. Set what you want the actor variable to be changed to} 

objectReference property OnlyActor auto
{By default, this property is set to the player}

bool property doOnce auto
{By default, this trigger fires only once}

function ActivateNow(objectReference triggerRef)
	ObjectReference myLink = getLinkedRef()
	Actor myActor = myLink as actor
	myActor.SetAV(sActorVariable, fActorVariable)
	myActor.EvaluatePackage()
	if doOnce == true
		gotoState("allDone")
	endif
endFunction

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		if !onlyActor && triggerRef == GetPlayer()
			activateNow(triggerRef)
		endif
		
		if onlyActor == triggerRef
			activateNow(triggerRef)
		endif
		
	endEvent
endState

State allDone
	;do nothing
endState
	