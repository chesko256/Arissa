Scriptname WuuthradScript extends ObjectReference  

Perk Property WuuthradPerk auto

Event OnEquipped(Actor akActor)
	akActor.AddPerk(WuuthradPerk)
EndEvent

Event OnUnEquipped(Actor akActor)
	akActor.RemovePerk(WuuthradPerk)
EndEvent