Scriptname WerewolfTransformVisual extends ActiveMagicEffect  

Armor Property WolfSkinFXArmor auto
Race Property WerewolfRace auto

VisualEffect property FeedBloodVFX auto
Idle Property IdleWerewolfTransformation auto
Sound Property NPCWerewolfTransformation auto
Sound Property NPCWerewolfTransformationB2D auto
Sound Property NPCWerewolfTransformationB3D auto

Quest Property PlayerWerewolfQuest auto

Event OnEffectStart(Actor Target, Actor Caster)
;     Debug.Trace("WEREWOLF: Starting change anim...")

    if (Target.GetActorBase().GetRace() != WerewolfRace)
		; Add the tranformation wolf skin Armor effect 
		Target.equipitem(WolfSkinFXArmor,False,True)
		
        RegisterForAnimationEvent(Target, "SetRace")
        Target.PlayIdle(IdleWerewolfTransformation)
        Utility.Wait(10)
        TransformIfNecessary(Target)
    endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
;     Debug.Trace("WEREWOLF: Getting anim event -- " + akSource + " " + asEventName)
    if (asEventName == "SetRace")
        TransformIfNecessary(akSource as Actor)
    endif
EndEvent

Function TransformIfNecessary(Actor Target)
	if (Target == None)
; 		Debug.Trace("WEREWOLF: Trying to transform something that's not an actor; bailing out.", 2)
		return
	endif

	UnRegisterForAnimationEvent(Target, "SetRace")

	Race currRace = Target.GetRace()
	if (currRace != WerewolfRace)
; 		Debug.Trace("WEREWOLF: VISUAL: Setting race " + WerewolfRace + " on " + Target)
		if (Target != Game.GetPlayer())
; 			Debug.Trace("WEREWOLF: VISUAL: Target is not player, doing the transition here.")
			Target.SetRace(WerewolfRace) ;TEEN WOLF
			
			; Remove the transformation effect armor if he/she has it on.
			if (Target.GetItemCount(WolfSkinFXArmor) > 0) 
				(Target.Removeitem(WolfSkinFXArmor, 1, True, none))
			endif
		else
			CompanionsHousekeepingScript chs = (PlayerWerewolfQuest as PlayerWerewolfChangeScript).CompanionsTrackingQuest as CompanionsHousekeepingScript
			if (chs.PlayerOriginalRace == None)
				chs.PlayerOriginalRace = currRace
			endif
			PlayerWerewolfQuest.SetStage(1)
        endif
		
    endif
EndFunction


