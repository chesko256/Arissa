Scriptname FXDraugrMagicWepsSCRIPT extends ObjectReference  
{Add fx to magic draugr weapons.}

VisualEffect Property  FXDraugrMagicSwordStreakEffect Auto
Weapon Property MG07DraugrMagicSword Auto
int doOnce
; string rightWep
; string leftWep

Event OnEquipped(Actor akActor)
; rightWep= Game.GetPlayer().GetEquippedWeapon()
; leftWep =Game.GetPlayer().GetEquippedWeapon(true)
; ; debug.trace(rightWep)
; ; debug.trace(leftWep)
	while akActor.IsWeaponDrawn() == false
		utility.wait (0.1)
; 		;debug.trace("fx are waiting")
	endWhile
	if doOnce == 0 
		utility.wait (0.3)
		FXDraugrMagicSwordStreakEffect.Play(akActor, -1)
		doOnce = 1
	endIf
endEvent



Event OnUnEquipped(Actor akActor)
	FXDraugrMagicSwordStreakEffect.Stop(akActor)
	doOnce = 0
endEvent

