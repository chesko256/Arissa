Scriptname DA05HircinesRingScript extends ObjectReference  

Spell Property HircinesRingPower auto
Quest Property CompanionsCentralQuest auto

Event OnEquipped(Actor akActor)
	if (akActor == Game.GetPlayer() && (CompanionsCentralQuest as CompanionsHousekeepingScript).PlayerHasBeastBlood)
		Game.GetPlayer().AddSpell(HircinesRingPower, false)
	endif
EndEvent

Event OnUnEquipped(Actor akActor)
	if (akActor == Game.GetPlayer() && (CompanionsCentralQuest as CompanionsHousekeepingScript).PlayerHasBeastBlood)
		Game.GetPlayer().RemoveSpell(HircinesRingPower)
	endif
EndEvent


