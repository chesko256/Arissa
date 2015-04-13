Scriptname defaultAddItemWeaponScript extends defaultAddItemScript  
{Adds a weapon to this reference in a Reset-safe way.}

Weapon property _WeaponToAdd Auto

bool property unique = False Auto
{If the player already has this item, don't give the actor another one. Defaults to False for Weapons & Armor.}


;Stores the weapon. DefaultAddItemScript takes care of the rest.
Event OnInit()
	ParentUnique = Unique
	ItemToAdd = _WeaponToAdd
EndEvent
