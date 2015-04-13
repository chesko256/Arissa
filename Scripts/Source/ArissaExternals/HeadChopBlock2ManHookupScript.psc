Scriptname HeadChopBlock2ManHookupScript extends ObjectReference  
{
- This script hooks up the two people in the head chop block furniture and makes them play the chop animation together.

}

import utility
import Debug

ObjectReference executionerActor

ObjectReference executioneeActor

Idle property animIdle auto
{This is the idle that the executioner will play when everything is ready.}

Keyword property executionerKeyword auto
{The keyword that designates the executioner from the soon to be dead.}

;*****************************************

auto STATE readyToChop

Event OnActivate( ObjectReference akActionRef )
; 	debug.trace(self + " OnActivate: " + akActionRef)
	if ( akActionRef.HasKeyword( executionerKeyword ) )
		Actor testActor = akActionRef as Actor
; 		debug.trace(self+ "The executioner is in place: " + akActionRef )
		executionerActor = akActionRef
	else
; 		debug.trace(self+ "The victim is in place: " + akActionRef )
		executioneeActor = akActionRef
	endif
	

	;if it's ready, then do the chop!
	if ( executioneeActor != none && executionerActor != none )
		gotoState("chopping")
; 		debug.trace(self+ "Both in place, ready to chop" )
		RegisterForUpdate(0.5)
	endif
endEvent

endState

STATE chopping
	; do nothing for now
endState

Event OnUpdate() 
; 	debug.trace(self + " OnUpdate")
	UnregisterForUpdate()
	;if it's ready, then do the chop!
	if ( executioneeActor != none && executionerActor != none )		
; 		debug.trace(self+ "CHOPPING START" )
		wait(5)

		;set up the relationship
		if ( !executioneeActor.AddDependentAnimatedObjectReference( executionerActor ) )
			Notification( "dependence broken." )
		endif
		
		;play the idle and wait..
		Actor myExecutionee = executioneeActor as Actor
		; do NOT kill the player!
		if myExecutionee == Game.GetPlayer()
			; TODO - play alternate animation for player execution
			wait(2)
		else
			if ( !myExecutionee.PlayIdle( animIdle ) )
; 				debug.trace(self+ " play idle failed" )
			endif
			wait(2)
		endif
		
		;Now clean up.  Set the executionee to NULL, since he's no longer needed...
		executioneeActor.RemoveDependentAnimatedObjectReference( executionerActor )
		executioneeActor = none
		gotoState("readyToChop")
; 		debug.trace(self+ "CHOPPING END" )
	endif
endEvent