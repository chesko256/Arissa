Scriptname WIKill04LetterScript extends ReferenceAlias  
{Script attached to Letter alias in WIKill04}


Event OnEquipped(Actor akActor)
; debug.trace(self + "OnEquiped()")
	if GetOwningQuest().GetStage() < 10 && akActor == Game.GetPlayer()
		GetOwningQuest().setStage(10)
	EndIf
 EndEvent
 