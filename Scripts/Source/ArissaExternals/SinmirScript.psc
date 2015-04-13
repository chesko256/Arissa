Scriptname SinmirScript extends Actor Conditional

Outfit Property pStormcloakOutfit  Auto  Conditional
Faction Property pGovRuling  Auto  Conditional

Event OnLoad()

	if IsInFaction(pGovRuling) == 1
		SetOutfit(pStormCloakOutfit)		
	endif

endEvent