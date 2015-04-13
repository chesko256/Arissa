Scriptname MQ206AlduinScript extends ReferenceAlias  


Auto State WaitingForHit

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		if akCaster == Game.GetPlayer() && akEffect == Dragonrend3Effect
			gotoState("AfterHit")
			GetOwningQuest().SetStage(180)
		endif
	endEvent


endState


State AfterHit
; do nothing
endState

	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		; start combat, make aggressive
		if !GetOwningQuest().GetStageDone(120)
			GetOwningQuest().SetStage(120)
		endif
	endEvent



MagicEffect Property Dragonrend3Effect  Auto  
