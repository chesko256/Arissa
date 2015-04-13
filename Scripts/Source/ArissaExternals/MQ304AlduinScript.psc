Scriptname MQ304AlduinScript extends ReferenceAlias  
{get him to react to clear skies etc.}

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	; for now, just setav variable01 to 2 (which is also what the fog sends if it is disrupted)
	if akAggressor == Game.GetPlayer()
		ReactToHit()
	endif
endEvent

; not sure we need both of these, but for now Alduin can only attack with magic from perch
Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	; for now, just setav variable01 to 2 (which is also what the fog sends if it is disrupted)
	if akCaster == Game.GetPlayer()
		ReactToHit()
	endif
endEvent


function ReactToHit()
; 	debug.trace(self + " Alduin hit - setting variable01 to 2")
	GetActorRef().SetActorValue("variable01", 2)
	GetActorRef().EvaluatePackage()
endFunction