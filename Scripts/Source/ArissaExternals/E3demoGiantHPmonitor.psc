Scriptname E3demoGiantHPmonitor extends ReferenceAlias  

EVENT onLoad()

	while !self.getActorReference().is3DLoaded()
		; wait for my ref 3D to load!
		utility.wait(2.0)
	endWhile
	while self.GetActorReference().getActorValuePercentage("Health") > 0.7
		; do nothing until my HP drops below 70%
		utility.wait(2.0)
	endWhile
	
; 	debug.trace("[E3Demo] Giant 02 HP below 70%. Setting stage 320")
	getOwningQuest().setStage(320)
	
endEVENT

EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked) 
	if akAggressor == game.getPlayer() as objectReference
		getOwningQuest().setStage(305)
	endif
endEVENT
