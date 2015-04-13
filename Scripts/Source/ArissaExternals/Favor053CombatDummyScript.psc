ScriptName Favor053CombatDummyScript extends ReferenceAlias

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If ( akAggressor == Game.GetPlayer() )
		;Need to hook up the specific types of attacks when those work		

		;Player performs a basic attack on the dummy
		If (GetOwningQuest().GetStage() == 12)
			GetOwningQuest().SetStage(14)
		EndIf

		;Player performs a power attack on the dummy
		If (GetOwningQuest().GetStage() == 15)
			GetOwningQuest().SetStage(16)
		EndIf

		;Player performs a bash on the dummy 
		If (GetOwningQuest().GetStage() == 17)
			GetOwningQuest().SetStage(18)
		EndIf
	EndIF
	
EndEvent