scriptName defaultEquipItemOnLoad extends Actor
{ Causes the actor to equip the specified item(s) on load. }

Weapon property WeaponToEquip Auto
Armor property ArmorToEquip Auto
Light property TorchToEquip Auto
bool property preventRemoval Auto
bool property silent Auto

Event OnLoad()
	if (!Self.IsDead() && !Self.IsDisabled())
		if (WeaponToEquip != None)
			Self.EquipItem(WeaponToEquip, preventRemoval, silent)
		EndIf
		if (ArmorToEquip != None)
			Self.EquipItem(ArmorToEquip, preventRemoval, silent)
		EndIf
		if (TorchToEquip != None)
			Self.EquipItem(TorchToEquip, preventRemoval, silent)
; 			Debug.Trace("FORCING TORCH: " + Self + " " + preventRemoval)
		EndIf
	EndIf
EndEvent