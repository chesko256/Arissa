Scriptname WispShadeActorScript extends ActiveMagicEffect  
{Actor Script for the Wisp Shades}
;======================================================================================;
;	PROPERTIES	     /
;===================/
explosion property ExplosionIllusionLight01 auto
VisualEffect Property WispFXAttachEffect Auto

ObjectReference selfRef

;======================================================================================;
;	EVENTS	    /
;=============/
EVENT OnEffectStart(Actor Target, Actor Caster)
		
; 	debug.trace("SHADE: Effect Started")
	selfRef = caster
	
	int i = 20 ; recursion limiter for 3dLoaded check
	while selfRef.is3dLoaded() == FALSE
		; wait a bit for the 3d to load
		if i >= 10
; 			debug.trace("Recursion of limit ("+i+") hit by: "+self)
			return
		else
			i+=1
; 			debug.trace("While() recursion ("+i+")")
			utility.wait(0.1)
		endif
	endWhile
	; only attach FX once 3D is loaded
	
; 	debug.trace("SHADE: Past While loop, try to attach FX")
	WispFXAttachEffect.Play(selfRef, -1)
; 	debug.trace("SHADE: FX attach has been attempted")
		
ENDEVENT


EVENT OnDying(Actor akKiller)

	WispFXAttachEffect.Stop(selfRef)
	selfRef.placeatme(ExplosionIllusionLight01)
	selfref.disable()
	selfref.delete()

ENDEVENT

