Scriptname SilverSwordScript extends ObjectReference  

Perk Property SilverPerk auto

Event OnEquipped(Actor akActor)
	akActor.AddPerk(SilverPerk)
EndEvent

Event OnUnEquipped(Actor akActor)
	akActor.RemovePerk(SilverPerk)
EndEvent