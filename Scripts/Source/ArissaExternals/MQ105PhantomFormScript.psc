Scriptname MQ105PhantomFormScript extends Actor  

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
; 	debug.trace(self + "OnMagicEffectApply: " + akCaster + ", " + akEffect)
	if akCaster == Game.GetPlayer()
		if akEffect == VoicePushEffect2
; 			debug.trace(self + "GOOD HIT")
			kill()
			(MQ105 as MQ105QuestScript).IncrementPushTargetCount(self)
			; clear "weak hit" flag
			(MQ105 as MQ105QuestScript).PushTrialWeakHit = false
			(MQ105 as MQ105QuestScript).PushTrialGoodHit = true
		elseif akEffect == VoicePushEffect
; 			debug.trace(self + "WEAK HIT")
			; flag a "weak hit" so Arngeir can comment
			(MQ105 as MQ105QuestScript).PushTrialWeakHit = true
		endif
	endif
endEvent

Event OnDeath(Actor akKiller)
	; allow scene to advance when the summoned actor dies for any reason
	(MQ105 as MQ105QuestScript).PushTrialWaiting = false
endEvent

MagicEffect Property VoicePushEffect  Auto  
MagicEffect Property VoicePushEffect2  Auto  
MagicEffect Property VoicePushEffect3 Auto  

Quest Property MQ105 Auto
