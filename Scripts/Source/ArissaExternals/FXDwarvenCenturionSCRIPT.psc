Scriptname FXDwarvenCenturionSCRIPT extends ActiveMagicEffect  
{Add the fx art to the dwarven centurion, sphere,and spider. There are tests for properties being filler since not all three have three addons.}

import utility
import form

;===============================================
actor selfRef
VisualEffect Property FXDwarvenCenturion Auto
VisualEffect Property FXDwarvenCenturionArm01 Auto
VisualEffect Property FXDwarvenCenturionArm02 Auto
int test

	EVENT OnEffectStart(Actor Target, Actor Caster)
		selfRef = caster
		if (selfRef.GetSleepState() == 3)
; 			Debug.Trace("Dwarven cent is sleeping! 3")
			selfRef.PlaySubGraphAnimation( "StopEffect" )
		else
			FXDwarvenCenturion.Play(selfRef, -1)
			FXDwarvenCenturionArm01.Play(selfRef, -1)
			FXDwarvenCenturionArm02.Play(selfRef, -1)
		endIf
	ENDEVENT
	
	Event OnGetUp(ObjectReference akFurniture)
; 		Debug.Trace("Dwarven cent just got up from " )
			FXDwarvenCenturion.Play(selfRef, -1)
			FXDwarvenCenturionArm01.Play(selfRef, -1)
			FXDwarvenCenturionArm02.Play(selfRef, -1)
			selfRef.PlaySubGraphAnimation( "AutoReset" )
	endEvent
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		FXDwarvenCenturion.Stop(selfRef)
		FXDwarvenCenturionArm01.Stop(selfRef)
		FXDwarvenCenturionArm02.Stop(selfRef)
	ENDEVENT
	
	EVENT onDeath(actor myKiller)
		selfRef.PlaySubGraphAnimation( "StopEffect" )
		wait(8.0)
		FXDwarvenCenturion.Stop(selfRef)
		FXDwarvenCenturionArm01.Stop(selfRef)
		FXDwarvenCenturionArm02.Stop(selfRef)
	ENDEVENT
	