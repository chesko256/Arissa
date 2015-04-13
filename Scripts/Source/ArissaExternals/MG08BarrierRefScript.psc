Scriptname MG08BarrierRefScript extends ObjectReference  


MagicEffect Property MG08StaffEffect  Auto  
Spell Property MG08StaffSpell  Auto

int DoOnce

Quest Property MG08  Auto  



Event OnHit(ObjectReference Aggressor, Form Source, Projectile AkProjectile, bool abPowerAttack, bool AbSneakAttack, bool abBashAttack, bool abHitBlocked)


; Debug.Trace(Self + " Hit by " + Source)

	if Source == MG07StaffEnchantment
		if DoOnce == 0
			DoOnce=1
			MG07CollegeBarrierBridgeBlizzardRef.PlayAnimation("StopEffect")
			Self.PlayAnimation("TransitionAnim")
			MG07BarrierDisableSound.Enable()
			Utility.Wait(3.4)
			MG08.SetStage(20)
			MG08BarrierCollisionRef.Disable()
		endif
	endif


EndEvent
MagicEffect Property MG07StaffEffect  Auto  




Enchantment Property MG07StaffEnchantment  Auto  

ObjectReference Property MG08BarrierCollisionRef  Auto  

ObjectReference Property MG07CollegeBarrierBridgeBlizzardRef  Auto
ObjectReference Property MG07BarrierDisableSound  Auto  
