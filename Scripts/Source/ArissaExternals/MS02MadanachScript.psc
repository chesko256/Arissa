ScriptName MS02MadanachScript extends ReferenceAlias

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (akAggressor == Game.GetPlayer())
		If (GetOwningQuest().GetStageDone(80) == 0) && (GetOwningQuest().GetStageDone(200) == 0)
			GetOwningQuest().SetStage(200)
		EndIf
	EndIf

EndEvent

Event OnDeath(Actor akKiller)

	GetOwningQuest().SetStage(200)
	GetOwningQuest().SetStage(210)

EndEvent