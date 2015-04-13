Scriptname defaultAddItemScript extends Actor  
{Adds an item to this reference in a Reset-safe way. Not directly usable, but extended by the defaultAddItem<TYPE>Scripts}

Form property ItemToAdd Auto Hidden
{YOU CAN'T FILL THIS PROPERTY IN THE EDITOR. Use one of the defaultAddItem<TYPE> scripts instead.}

int property count = 1 Auto
{The number of instances of the item the actor should have. Defaults to 1.}

bool property parentUnique = True Auto Hidden
{If the player already has this item, don't give the actor another one. Defaults to True.}

bool property shouldEquip = False Auto
{ACTORS ONLY: Should we equip this item?}

bool property forceEquip = False Auto
{ACTORS ONLY: Should we force this item to stay equipped?}

bool addedItem = False

;On load, add the item.
Event OnLoad()
	if (!addedItem)
		addedItem = True
		AddItemIfNeeded()
	EndIf
EndEvent

;On reset, add the item.
Event OnReset()
	addedItem = True
	AddItemIfNeeded()
EndEvent

Function AddItemIfNeeded()
	;If (parentUnique && Player has item), don't generate.
	if (Game.GetPlayer().GetItemCount(ItemToAdd) == 0 || !parentUnique)
		Self.AddItem(ItemToAdd, (count - Self.GetItemCount(ItemToAdd)), True)
		if (shouldEquip && (Self as Actor) != None)
			Self.EquipItem(ItemToAdd, forceEquip, True)
		EndIf
	EndIf
EndFunction

