Scriptname MGR21EffectScript extends ActiveMagicEffect  

Perk Property CostPerk  Auto  

Perk Property OtherPerk  Auto  


Event OnEffectStart(Actor AkTarget, Actor akCaster)

	Game.GetPlayer().AddPerk(CostPerk)
	Game.GetPlayer().AddPerk(OtherPerk)

EndEvent


Event OnEffectFinish(Actor AkTarget, Actor AkCaster)

	Game.GetPlayer().RemovePerk(CostPerk)
	Game.GetPlayer().RemovePerk(OtherPerk)

EndEvent