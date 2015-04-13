scriptName TG08BInvisibilityExplosionEffectSCRIPT extends ActiveMagicEffect
{Scripted effect for invisibility}



;======================================================================================;
;  PROPERTIES  /
;=============/


bool effectActive = false
float property loopTime = 0.3 auto
quest property TG08B auto

actorBase property MercerFrey auto

;======================================================================================;
;   EVENTS     /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)
	effectActive = True
	if (Target as actor).getActorBase() == MercerFrey
		while effectActive
			if Target.getActorValue("Variable07") == 0
				dispel()
			endif
			utility.wait(loopTime)
		endwhile
		
	endif
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	effectActive = false
endEvent
