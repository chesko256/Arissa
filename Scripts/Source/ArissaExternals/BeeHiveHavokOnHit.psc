Scriptname BeeHiveHavokOnHit extends ObjectReference  
{Stops the beehive from havoking until hit.}


Event OnLoad()
;   Debug.Trace("This object is loaded, playing animations should work now")
  self.SetMotionType(Motion_Keyframed, true)
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;   Debug.Trace("I just got hit by something")
	self.SetMotionType(Motion_Dynamic, true)
endEvent
