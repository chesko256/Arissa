Scriptname MQ105ShoutTargetScript extends ReferenceAlias  
{script to respond to being struck by shouts}

MagicEffect Property PushEffect  Auto  

MagicEffect Property SprintEffect  Auto  

ActorBase Property SprintActor Auto  ; the actor that is watching for the sprint "hit" (TEMP)

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if akCaster == Game.GetPlayer()
		if akEffect == PushEffect
			GetOwningQuest().setstage(25)
		elseif akEffect == SprintEffect
			; TEMP -- this is only until we can do the real sprint and get through the door
			; only if Borri is hit by this
			if GetRef().GetBaseObject() == SprintActor
				GetOwningQuest().setstage(140)
			endif
		endif
	endif
endEvent
