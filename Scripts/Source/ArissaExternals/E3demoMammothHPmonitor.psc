Scriptname E3demoMammothHPmonitor extends ReferenceAlias  

EVENT onLoad()

	while !self.getActorReference().is3DLoaded()
		; wait for my ref 3D to load!
		utility.wait(2.0)
	endWhile
	while self.GetActorReference().getActorValuePercentage("Health") > 0.98
		; do nothing until my HP drops below 90%
		utility.wait(1.0)
	endWhile
	
; 	debug.trace("[E3Demo] Mammoth HP below 98%. Run Away!")
		self.getActorReference().setActorValue("Confidence",0)
		self.getActorReference().stopCombat()
		self.getActorReference().evaluatePackage()
		self.getActorReference().stopCombat()
	
endEVENT

EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked) 
	if akAggressor == game.getPlayer() as objectReference
		getOwningQuest().setStage(305)
	endif
endEVENT
