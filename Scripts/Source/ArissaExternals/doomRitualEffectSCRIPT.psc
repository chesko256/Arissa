Scriptname doomRitualEffectSCRIPT extends ActiveMagicEffect  

FACTION PROPERTY playerAlly AUTO
SPELL PROPERTY reAnimate AUTO

EVENT onEffectStart(Actor akTarget, Actor akCaster)
	reanimate.cast(akTarget, game.getPlayer())
	
	akTarget.removeFromAllFactions()
	akTarget.setFactionRank(playerAlly, 4)
	akTarget.stopCombat()
	
endEVENT


