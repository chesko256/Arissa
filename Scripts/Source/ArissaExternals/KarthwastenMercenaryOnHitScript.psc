ScriptName KarthwastenMercenaryOnHitScript extends ReferenceAlias

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)


	If (akAggressor == Game.GetPlayer()) && (GetOwningQuest().GetStageDone(7) == 0)
		GetOwningQuest().SetStage(7)
	EndIf

EndEvent