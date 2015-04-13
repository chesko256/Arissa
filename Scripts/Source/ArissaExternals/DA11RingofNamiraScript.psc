ScriptName DA11RingofNamiraScript extends ObjectReference

Perk Property DA11Cannibalism  Auto  

Event OnEquipped(Actor akActor)

	If akActor == Game.GetPlayer()
		Game.GetPlayer().AddPerk(DA11Cannibalism )
	EndIf

EndEvent

Event OnUnequipped(Actor akActor)

	If akActor == Game.GetPlayer()
		Game.GetPlayer().RemovePerk(DA11Cannibalism )
	EndIf

EndEvent

