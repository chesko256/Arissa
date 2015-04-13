Scriptname TGNQuestScript extends Quest  Conditional

float pTGNAward
Spell Property pNightingaleShadowPerkSpell Auto
Spell Property pNightingaleSubterfuge Auto
Spell Property pNightingaleStrife Auto

Bool Function CanIAward()

	Return Utility.GetCurrentGameTime() >= pTGNAward

endFunction

Function AwardDone()

	pTGNAward = Utility.GetCurrentGameTime() + 1

endFunction

Function CleanUpSpells()

	Game.GetPlayer().RemoveSpell(pNightingaleShadowPerkSpell)
	Game.GetPlayer().RemoveSpell(pNightingaleSubterfuge)
	Game.GetPlayer().RemoveSpell(pNightingaleStrife)

endFunction