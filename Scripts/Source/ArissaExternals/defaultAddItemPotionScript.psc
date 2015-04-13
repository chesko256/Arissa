Scriptname defaultAddItemPotionScript extends defaultAddItemScript  
{Adds a potion to this reference in a Reset-safe way.}

Potion property _PotionToAdd Auto

bool property unique = False Auto
{If the player already has this item, don't give the actor another one. Defaults to False for potions.}


;Stores the armor. DefaultAddItemScript takes care of the rest.
Event OnInit()
	ParentUnique = Unique
	ItemToAdd = _PotionToAdd
EndEvent
