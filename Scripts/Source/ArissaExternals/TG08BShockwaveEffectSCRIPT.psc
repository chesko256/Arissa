scriptName TG08BShockwaveEffectSCRIPT extends ActiveMagicEffect
{Scripted effect for the shockwave}



;======================================================================================;
;  PROPERTIES  /
;=============/


explosion property tg08bShockwaveExplosion auto

;======================================================================================;
;   EVENTS     /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)
	Target.placeAtMe(tg08bShockwaveExplosion)
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)

endEvent
