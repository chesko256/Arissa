Scriptname CWMission07EnemySoldierScript extends ReferenceAlias  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	Actor AggressorActor = akAggressor as Actor
	
	if abSneakAttack 
		GetActorReference().kill()
	EndIf
	
	
	if AggressorActor != Game.GetPlayer() && AggressorActor.isSneaking()
		GetActorReference().kill()
		
		;assumes its the guy you are ambushing, but it doesn't really matter that much
		GetOwningQuest().setStage(60)
		
	EndIf
	

EndEvent

Event OnDeath(Actor akKiller)
; 	CWScript.Log("CWMission07EnemySoldierScript", "OnDeath() calling checkForVictory()")

	GetOwningQuest().setStage(60)
	(GetOwningQuest() as CWMission07Script).checkForVictory()

EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if akTarget == Game.GetPlayer()
		GetOwningQuest().setStage(60)
	EndIf
	

EndEvent
