Scriptname TestPolymorphEffectScript extends ActiveMagicEffect  

;======================================================================================;
;               PROPERTIES  /
;=============/

Race Property PolymorphRace auto

;======================================================================================;
;               EVENTS                     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
	if (Target.GetActorBase().GetRace() != PolymorphRace)
		Target.SetRace(PolymorphRace)		
	endif
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	; change back
	Target.SetRace(None) 
endEvent

