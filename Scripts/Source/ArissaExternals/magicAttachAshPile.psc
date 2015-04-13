scriptName magicAttachAshPile extends ActiveMagicEffect
{Scripted effect for ash pile}



;======================================================================================;
;               PROPERTIES  /
;=============/

float property fDelay = 0.83 auto
{time to wait before switching to Spawning Ash Pile}
Activator property AshPileObject auto
{The object we use as a pile.}




;======================================================================================;
;	 EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)

	utility.wait(fDelay)                           
	Target.AttachAshPile(AshPileObject)                   

EndEvent


