Scriptname MG07DunLabyrinthianThrallScript extends actor  

quest property dunLabyrinthian auto
int property myStage auto
race property skeletonRace auto
objectReference property myCastDummy auto

EVENT onActivate(objectReference actronaut)
	BreakChannel(actronaut)
endEVENT

EVENT OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	;debug.trace(self + " OnHit in hasBeenTriggered")
	BreakChannel(akAggressor)
endEVENT
	
FUNCTION BreakChannel(objectReference WhoToBlame)
	if dunLabyrinthian.getStageDone(myStage) == FALSE
		; stop my "casting" and remove my prayer marker
		getLinkedRef().disable()
		myCastDummy.InterruptCast()	
		; always go after the player.  They're magical after all.
		if !isDead()
			startCombat(WhoToBlame as actor)
		endif
		dunLabyrinthian.setStage(myStage)
	endif
endFUNCTION
