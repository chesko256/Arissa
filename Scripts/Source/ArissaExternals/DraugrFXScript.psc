Scriptname DraugrFXScript extends  ActiveMagicEffect  
{Attaches and manages fx}



import utility
import form

;===============================================

Actor selfRef
ActorBase myActorBase
int draugrSex
VisualEffect Property DraugrMaleEyeGlowFX Auto
VisualEffect Property DraugrFemaleEyeGlowFX Auto

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		myActorBase = caster.GetLeveledActorBase()		
		;If sex is male (only one currently working) play glow eye art
		if myActorBase.GetSex() == 0
			if (selfRef.GetSleepState() == 3)
; 				Debug.Trace("Draugr man is sleeping! 3")
			else
				;Play glow art
				DraugrMaleEyeGlowFX.Play(selfRef, -1)
			endif
		endif
		;if sex is female (currently not returned) play debug text to say this is now working
		if myActorBase.GetSex() == 1
			if (selfRef.GetSleepState() == 3)
; 				Debug.Trace("Draugr fem is sleeping! 3")
			else
				DraugrFemaleEyeGlowFX.Play(selfRef, -1)
			endIf
		endif
	ENDEVENT
	
	Event OnGetUp(ObjectReference akFurniture)
; 		Debug.Trace("Draugr just got up from " )
		if myActorBase.GetSex() == 0
			;Play glow art
			DraugrMaleEyeGlowFX.Play(selfRef, -1)
		endif
		;if sex is female (currently not returned) play debug text to say this is now working
		if myActorBase.GetSex() == 1
			DraugrFemaleEyeGlowFX.Play(selfRef, -1)
		endif
	EndEvent
	
	EVENT onDeath(actor myKiller)

		DraugrMaleEyeGlowFX.Stop(selfRef)
		DraugrFemaleEyeGlowFX.Stop(selfRef)

	ENDEVENT