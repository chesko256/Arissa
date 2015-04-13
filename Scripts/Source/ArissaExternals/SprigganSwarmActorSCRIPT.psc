Scriptname SprigganSwarmActorSCRIPT extends ActiveMagicEffect conditional
{Attaches and manages witchlights's fx}
;======================================================================================;
;	IMPORTS     /
;=============/
import utility
import form
import game
;======================================================================================;
;	PROPERTIES  /
;=============/
VisualEffect Property SprigganSwarmFXAttachEffect Auto
objectReference property mySprigganSwarm auto conditional hidden
actorBase property SprigganSwarmBase auto

;======================================================================================;
;	VARIABLES   /
;=============/
ObjectReference selfRef

;======================================================================================;
;	EVENTS	    /
;=============/

	EVENT OnEffectStart(Actor Target, Actor Caster)
	
	
		selfRef = caster
		selfRef.RegisterForSingleUpdate(0.25)
		int i = 10 ; recursion limiter for 3dLoaded check
		while selfRef.is3dLoaded() == FALSE
			; wait for onLoad() to complete
			;  too costly ???
			if i >= 10
; 				debug.trace("Recursion of limit ("+i+") hit by: "+self)
				return
			else
				i+=1
; 				debug.trace("While() recursion ("+i+")")
			endif
		endWhile
		; only attack FX once the3D is loaded
		SprigganSwarmFXAttachEffect.Play(selfRef, -1)
		
	ENDEVENT
	
	
	EVENT onDeath(actor myKiller)
	
		SprigganSwarmFXAttachEffect.Stop(selfRef)

	ENDEVENT