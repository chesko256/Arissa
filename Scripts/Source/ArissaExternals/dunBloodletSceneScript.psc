Scriptname dunBloodletSceneScript extends Actor 


quest property dunBloodletQST auto
objectReference property wolfLever auto

Event onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
 dunBloodletQST.setstage(200)
 endEvent

 Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState == 1 && (dunBloodletQST.isRunning()) == false
		wolfLever.activate(wolfLever)
	endif
 endEvent
  