scriptName magicPlaceExplosionScript extends ActiveMagicEffect
{Scripted magic effect Placing an Explosion at the target of a magic effect.}



;======================================================================================;
;  PROPERTIES  /
;=============/

Explosion property ExplosionRef auto
{The name of the Explosion we will be placing.}


;======================================================================================;
;  VARIABLES   /
;=============/


;======================================================================================;
;   EVENTS     /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)

	Target.placeatme(ExplosionRef)
	
endEvent
