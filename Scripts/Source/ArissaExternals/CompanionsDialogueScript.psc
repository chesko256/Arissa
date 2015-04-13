Scriptname CompanionsDialogueScript extends Quest Conditional

bool Property PlayerAroundJorrvaskr auto conditional

Faction Property CompanionsFaction auto
MiscObject Property Gold001 auto

GlobalVariable Property CompanionsThievingThreshold auto conditional

CompanionsHousekeepingScript Property CentralScript auto

Function PayCrimeGold()
	Game.GetPlayer().RemoveItem(Gold001, CompanionsFaction.GetCrimeGold())
	CompanionsFaction.SetCrimeGold(0)
	; 78431 
	CompanionsFaction.SetCrimeGoldViolent(0)
	; /78431 
	CentralScript.PlayerThievingAndNotPaying = false
	CompanionsThievingThreshold.SetValueInt(0)
EndFunction

Function CheckThievingThreshold(Actor speaker)
	if (CentralScript.PlayerThievingAndNotPaying && CompanionsFaction.GetCrimeGold() >= CompanionsThievingThreshold.GetValueInt())
		speaker.StartCombat(Game.GetPlayer())
	elseif (!CentralScript.PlayerThievingAndNotPaying)
		CentralScript.PlayerThievingAndNotPaying = true
		CompanionsThievingThreshold.SetValueInt(CompanionsFaction.GetCrimeGold() + 10)
	endif
EndFunction
