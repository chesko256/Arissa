Scriptname DragonrendEffectScript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	; force dragon to land
; 	debug.trace(self + " Dragonrend OnEffectStart")
;	akTarget.SetAllowFlying(false)		; REMOVED - Dragonrend actor value now prevents flying
	; if I'm Alduin, I'm no longer invulnerable
	if akTarget.IsInFaction(AlduinFaction)
		akTarget.GetActorBase().SetInvulnerable(false)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	; allow dragon to fly again if no other effects are active
; 	debug.trace(self + " Dragonrend OnEffectFinish - getav Dragonrend=" + akTarget.GetActorValue("Dragonrend") )
	if akTarget.GetActorValue("Dragonrend") <= 0
; 		debug.trace(self + " Dragonrend OnEffectFinish")
;		akTarget.SetAllowFlying(true)		; REMOVED - Dragonrend actor value now prevents flying
		; if I'm Alduin, I'm invulnerable again
		if akTarget.IsInFaction(AlduinFaction) && akTarget.GetActorValuePercentage("health") > AlduinMinHealthForInvulnerable
			akTarget.GetActorBase().SetInvulnerable(true)
		endif
	endif
endEvent


Faction Property AlduinFaction  Auto  
{if I'm Alduin, special rules apply}

float Property AlduinMinHealthForInvulnerable = 0.35 auto
{if I'm Alduin, what's the min health where I go back to being invulnerable when dragonrend wears off?}
