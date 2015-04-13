Scriptname FalmerShamanScript extends ObjectReference  

Weapon Property BoundWeaponSword  Auto  
Weapon Property BoundWeaponSwordMystic  Auto  


Event OnDying(Actor akKiller)
	RemoveItem(BoundWeaponSword, 1)
	RemoveItem(BoundWeaponSwordMystic, 1)
EndEvent


