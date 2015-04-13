ScriptName BladesAlchPotionScript extends ActiveMagicEffect

Perk Property MQBladesDragonResearch Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget == Game.GetPlayer()
		Game.GetPlayer().AddPerk(MQBladesDragonResearch)
	EndIf
EndEvent