Scriptname TestSetAVLeverScript extends ObjectReference  

import game
import debug

string property sActorVariable = "Variable01" auto
{By default, this property is set to Variable01. Set which actor variable to set as a string}

float property fActorVariable = 1.0 auto
{By default this property is set to 1. Set what you want the actor variable to be changed to} 

float property fActorVariableReset = 0.0 auto
{What to set the actor value back to if you pull the lever twice.
 By default this property is set to 0.} 


objectReference property OnlyActor auto
{By default, this property is set to the player}

function ActivateNow(objectReference triggerRef, bool bSetActorValue = true)
; 	debug.trace(self + "activated")
	ObjectReference myLink = getLinkedRef()
	Actor myActor = myLink as actor
	if bSetActorValue
		gotoState("actorvalueset")
; 		debug.trace(self + " setting actor value=" + sActorVariable + " to " + fActorVariable)
		myActor.SetAV(sActorVariable, fActorVariable)
	else
		gotoState("normal")
; 		debug.trace(self + " setting actor value=" + sActorVariable + " back to " + fActorVariableReset)
		myActor.SetAV(sActorVariable, fActorVariableReset)
	endif
	myActor.EvaluatePackage()
endFunction

auto state normal
Event OnActivate(objectReference triggerRef)
	if !onlyActor && triggerRef == GetPlayer()
		activateNow(triggerRef)
	endif
		
	if onlyActor == triggerRef
		activateNow(triggerRef)
	endif
	
endEvent
endstate

state actorvalueset
Event OnActivate(objectReference triggerRef)
	if !onlyActor && triggerRef == GetPlayer()
		activateNow(triggerRef, false)
	endif
		
	if onlyActor == triggerRef
		activateNow(triggerRef, false)
	endif
	
endEvent

endState