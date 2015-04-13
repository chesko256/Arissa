Scriptname SpellTomeRemoveScript extends ObjectReference  

Event OnEquipped(Actor akActor)
	If akActor == Game.GetPlayer()
		akActor.RemoveItem(SpellTome, 1)
	EndIf
EndEvent

book Property SpellTome  Auto  
