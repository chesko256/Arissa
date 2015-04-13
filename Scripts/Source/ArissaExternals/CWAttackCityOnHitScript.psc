Scriptname CWAttackCityOnHitScript extends ReferenceAlias  
{Script on CWAttackCity aliases Jarl, Housecarl, and guards, to make them hostile if they get attacked during the confrontation scene.}

int StageToSetWhenAttacked = 31

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		actor actorRef = akAggressor as Actor

; 		CWScript.Log("CWAttackCityOnHitScript", self + "OnHit() actorRef:" + actorRef)
		
		GetOwningQuest().setStage(StageToSetWhenAttacked)



EndEvent
