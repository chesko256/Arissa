Scriptname DA08EbonyBladeAlertEffectScript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
; 	Debug.Trace("DA08: Alert from strike -- " + akTarget + " is target; " + akCaster + " is caster.")
	if ( (akTarget == akCaster) || (akTarget == Game.GetPlayer()) )
; 		Debug.Trace("DA08: Bailing out from strike; target is caster or player.")
		return
	endif

	if (akTarget.GetCrimeFaction() == akCaster.GetCrimeFaction())
		if (akTarget.HasLOS(Game.GetPlayer()) || akTarget.HasLOS(akCaster))
			akTarget.SendAssaultAlarm()
			; akTarget.StartCombat(Game.GetPlayer())
		else
; 			Debug.Trace("DA08: Bailing out from strike; can't see player or victim.")
		endif
		akTarget.SetActorValue("Variable02", 100.0)
	else
; 		Debug.Trace("DA08: Bailing out from strike; target in different crime faction.")
	endif
EndEvent

