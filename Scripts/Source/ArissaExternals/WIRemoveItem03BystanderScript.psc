Scriptname WIRemoveItem03BystanderScript extends ReferenceAlias  

Event OnCombatStateChanged(Actor attacker, int aeCombatState)
	if aeCombatState == 0 ; 0 means combat ended
; 		debug.trace("WIRemoveItem03BystanderScript OnCombatEnd() for" + self + "calling stop on quest.")
		GetOwningQuest().Stop()
	EndIf
EndEvent

Event OnEnterBleedout()
; 	debug.trace("WIRemoveItem03BystanderScript OnEnterBleedout() for" + self + "calling stop on quest.")
	GetOwningQuest().Stop()
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	ObjectReference Bystander1Ref = (GetOwningQuest() as WIRemoveItem03Script).Bystander1.GetReference()
	ObjectReference Bystander2Ref = (GetOwningQuest() as WIRemoveItem03Script).Bystander2.GetReference()

	if akAggressor != Bystander1Ref && akAggressor != Bystander2Ref
; 		debug.trace("WIRemoveItem03BystanderScript OnHit() for" + self + " hit by someone:" + akAggressor + " other than Bystander1:" + Bystander1Ref + " or Bystander2:" + Bystander2Ref + " so calling stop on quest.")
		GetOwningQuest().Stop()
	EndIf
EndEvent

Event OnUnload()
; 	debug.trace("WIRemoveItem03BystanderScript OnUnload() for" + self + "calling stop on quest.")
	GetOwningQuest().Stop()
EndEvent
