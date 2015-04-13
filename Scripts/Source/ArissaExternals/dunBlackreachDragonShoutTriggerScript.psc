Scriptname dunBlackreachDragonShoutTriggerScript extends ObjectReference  
{script to detect hit by Unrelenting Force}

; spells that can trigger this
Spell property triggerSpell1 auto		
Spell property triggerSpell2 auto		
Spell property triggerSpell3 auto		



;************************************

auto State Waiting
	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Spell akSpell = akSource as Spell
; 		debug.trace(self + "OnHit by Spell=" + akSource)
		if akSpell
			if (triggerSpell1 && akSpell == triggerSpell1) || (triggerSpell2 && akSpell == triggerSpell2) || (triggerSpell3 && akSpell == triggerSpell3)
				dunBlackreachDragonQST.setstage(10)
				; disable myself
				Disable()
			endif
		endif
	endEvent
endState

;************************************

Quest Property dunBlackreachDragonQST  Auto  
