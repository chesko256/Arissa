scriptName TG08BMercerInvisibilityEffectSCRIPT extends ActiveMagicEffect
{Scripted effect for the shockwave}



;======================================================================================;
;  PROPERTIES  /
;=============/

keyword property MagicInvisibility auto
explosion property tg08bInvisibilityExplosion auto
bool effectActive = false
float property loopTime = 0.3 auto
quest property TG08B auto

;======================================================================================;
;   EVENTS     /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)
	effectActive = True
	while effectActive
		if !Target.hasMagicEffectWithKeyword(MagicInvisibility)
			Target.placeAtMe(tg08bInvisibilityExplosion)
		endif
		utility.wait(loopTime)
	endwhile
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	effectActive = false
endEvent
