Scriptname defaultAddItemKeyScript extends defaultAddItemScript  
{Adds a key to this reference in a Reset-safe way.}

Key property _KeyToAdd Auto

bool property unique = True Auto
{If the player already has this item, don't give the actor one. Defaults to True for keys.}


;Stores the key. DefaultAddItemScript takes care of the rest.
Event OnInit()
	ParentUnique = Unique
	ItemToAdd = _KeyToAdd
EndEvent
