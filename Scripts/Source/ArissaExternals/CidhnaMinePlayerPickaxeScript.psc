ScriptName CidhnaMinePlayerPickaxeScript extends ObjectReference

Weapon Property RequiredWeapon Auto
ObjectReference Property CidhnaMinePlayerBedREF Auto
Quest Property MS02 Auto
Quest Property DialogueCidhnaMine Auto

Event OnActivate(ObjectReference akActionRef)

	If akActionREf == Game.GetPlayer()
		If (MS02.IsActive() == False) && (Game.GetPlayer().GetItemCount(RequiredWeapon) >= 1)
			CidhnaMinePlayerBedREF.Activate(Game.GetPlayer())
			DialogueCidhnaMine.SetStage(45)
		Else	
; 			debug.Trace(self + "MS02 is active, can't serve time.")
		EndIf
	EndIf
	
EndEvent