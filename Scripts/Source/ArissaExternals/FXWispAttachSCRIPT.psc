Scriptname FXWispAttachSCRIPT extends ActiveMagicEffect  
{Attaches and manages wisp's fx}

import utility
import form

;===============================================

ObjectReference selfRef
VisualEffect Property WispFXAttachEffect Auto

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		WispFXAttachEffect.Play(selfRef, -1)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)			
		WispFXAttachEffect.Stop(selfRef)
	ENDEVENT
	
	EVENT onDeath(actor myKiller)

		WispFXAttachEffect.Stop(selfRef)

	ENDEVENT
	
