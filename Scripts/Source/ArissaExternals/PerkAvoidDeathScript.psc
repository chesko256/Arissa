Scriptname PerkAvoidDeathScript extends ActiveMagicEffect  

; ready to heal you
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked )
; ;	debug.trace(self + " Enter Bleedout");	
	If PerkAvoidDeathTimer.GetValue() < GameDaysPassed.GetValue()
		; cast heal spell
		PercentHealth = GetTargetActor().GetAVPercentage("Health")
		If PercentHealth < 0.1
			HealSpell.Cast(GetTargetActor())
			PerkAvoidDeathTimer.SetValue(GameDaysPassed.GetValue() + 1.0)
; ;			debug.trace(self + " Heal "+ PerkAvoidDeathTimer.GetValue() + " " + GameDaysPassed.GetValue())
		EndIf
	Else
; ;		debug.trace(self + " Timer not reset " + PerkAvoidDeathTimer.GetValue() + " " + GameDaysPassed.GetValue())
	EndIf
endEvent


Spell Property HealSpell  Auto  

GlobalVariable Property PerkAvoidDeathTimer  Auto  

GlobalVariable Property GameDaysPassed  Auto  

float Property PercentHealth = 100.0 Auto  
