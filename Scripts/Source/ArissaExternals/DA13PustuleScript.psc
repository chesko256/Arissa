Scriptname DA13PustuleScript extends ObjectReference  

hazard property DA13PustuleGasCloud auto
bool popped
EVENT onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if popped == FALSE
		popped = TRUE
		playAnimation("TransitionAnim")
		objectReference myCloud = placeatMe(DA13PustuleGasCloud)
		myCloud.playAnimation("playAnim02")
		myCloud.setPosition(myCloud.x, myCloud.y,myCloud.z+128)
	endif
endEVENT


