Scriptname defaultAddItemArmorScript extends defaultAddItemScript  
{Adds a piece of armor to this reference in a Reset-safe way.}

Armor property _ArmorToAdd Auto

bool property unique = False Auto
{If the player already has this item, don't give the actor another one. Defaults to False for Weapons & Armor.}


;Stores the armor. DefaultAddItemScript takes care of the rest.
Event OnInit()
	ParentUnique = Unique
	ItemToAdd = _ArmorToAdd
EndEvent
