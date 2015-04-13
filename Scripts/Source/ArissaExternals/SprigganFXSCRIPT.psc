Scriptname SprigganFXSCRIPT extends ActiveMagicEffect  
{Attaches and controlss spriggan FX}

import utility
import form

Actor selfRef
VisualEffect Property SprigganFXAttachEffect Auto
Spell Property crSprigganHeal01 Auto
Spell Property crSprigganCallCreatures Auto
Idle Property FFselfIdle  Auto  
int doOnce
;===============================================

;RegisterForSleep() ; Before we can use OnSleepStart we must register.
 

	EVENT OnEffectStart(Actor Target, Actor Caster)
		;Play your particles.
		selfRef = caster		
		;test to see if spriggan is in ambush mode
		if (selfRef.GetSleepState() == 3)
; 			Debug.Trace("Spriggan is sleeping! 3")
			selfRef.PlaySubGraphAnimation( "KillFX" )
		else
			SprigganFXAttachEffect.Play(selfRef, -1)
		endIf
	ENDEVENT

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		SprigganFXAttachEffect.Stop(selfRef)
	endEvent
	
	Event OnGetUp(ObjectReference akFurniture)
; 		Debug.Trace("We just got up from " )
		SprigganFXAttachEffect.Play(selfRef, -1)
		selfRef.PlaySubGraphAnimation( "Revive" )
	endEvent
	
	EVENT onDeath(actor myKiller)
		;(selfRef as actor).PlaySubGraphAnimation( "LeavesScared" )
		;wait(10.0)
		selfRef.PlaySubGraphAnimation( "KillFX" )
		wait(10.0)
		SprigganFXAttachEffect.Stop(selfRef)	
	ENDEVENT
	
	EVENT onCombatStateChanged(Actor akTarget, int aeCombatState)
		if aeCombatState == 1
			selfRef.playIdle(FFselfIdle)
			utility.wait(3.0)
			
			crSprigganCallCreatures.cast(selfRef,selfRef)
		endif
	endEVENT
	
	Event OnEnterBleedout()
; 		Debug.Trace("dude im bleeeding out" )
		if doOnce == 0
			selfRef.PlaySubGraphAnimation( "KillFX" )
			wait(2.0)
			crSprigganHeal01.Cast(selfRef)
			selfRef.setActorValue("variable07",1)
			selfRef.evaluatePackage()
			wait(1.0)		
			selfRef.PlaySubGraphAnimation( "Revive" )
			doOnce = 1
		endIf
	ENDEVENT
	
	
