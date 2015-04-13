scriptName dunHillgrundsTombBoss extends actor
;
;
;=======================================================

Activator property summonFX auto
objectReference property Position1 auto
objectReference property Position2 auto
objectReference property Position3 auto
objectReference property Position4 auto
objectReference property Position5 auto
objectReference property SafePosition auto
objectReference property BossController auto

bool property finalTeleport = false auto hidden
float property endTeleportTimer auto hidden

auto state waiting
	event onActivate(objectReference TriggerRef)
		teleportToSafety()
		BossController.activate(self)
; 		debug.Trace(self + " was activated by " + triggerRef)
		goToState("Active")
	endEvent
	
	event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if self.GetAVPercentage("health") > 0.1
			if endTeleportTimer <= utility.GetCurrentGameTime()
				endTeleportTimer = utility.GetCurrentGameTime() + 1.0
				teleportToSafety()
				BossController.activate(self)
				goToState("Active")		
			endif
		endif
	endEvent
endState

;Active state, when hit teleport to safety until the controller tells the boss
	;to teleport
State Active
	event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		teleportToSafety()
	endEvent
	
	event onActivate(objectReference TriggerRef)
; 		debug.Trace(self + " was activated by " + triggerRef)
		doTeleport()
	endEvent
EndState

;Once enough draugr are killed the boss MUST fight you
State mustFight
	event onBeginState()
		if !self.isdead()
			doTeleport()
		endif
	endEvent

	event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if !finalTeleport && endTeleportTimer <= utility.GetCurrentGameTime()
			endTeleportTimer = utility.GetCurrentGameTime() + 8.0
			if self.GetAVPercentage("health") <= 0.25 && !self.isdead()
				finalTeleport = TRUE
				doTeleport()
			Else
				doTeleport()
			endif
		endif
	endEvent
	
	event onActivate(objectReference TriggerRef)
; 		debug.Trace(self + " was activated by " + triggerRef)
		if !self.isdead()
			doTeleport()
		endif
	endEvent
endState

state dead
	;for the eventuality that the player poisons this guy and he dies in the safe room.
	Event onBeginState()
		if (self as objectReference).getDistance(SafePosition) < 1500.0
			finalTeleport = TRUE
			doTeleport()
		endif
	endEvent
endState


event OnDeath(Actor akKiller)
	goToState("dead")
; 	debug.Trace(self + " was killed by " + akKiller)
endEvent

function doTeleport()
; 	debug.Trace(self + " should be teleporting in")
	Self.PlaceAtMe(SummonFX)
	utility.Wait(1)
	int teleportTarget = utility.randomInt(1,5)
	if finalTeleport
		Self.MoveTo(Position1)
	elseif teleportTarget == 1
		Self.MoveTo(Position1)
	elseif teleportTarget == 2
		Self.MoveTo(Position2)
	elseif teleportTarget == 3
		Self.MoveTo(Position3)
	elseif teleportTarget == 4
		Self.MoveTo(Position4)
	elseif teleportTarget == 5
		Self.MoveTo(Position5)
	else
; 		debug.Trace(self + " ERROR: invalid teleport target = " + teleportTarget)
	endif
	Self.PlaceAtMe(SummonFX)
	utility.wait(0.5)
	self.evaluatePackage()
endFunction

function teleportToSafety()
; 	debug.Trace(self + " should be teleporting to safety")
	Self.PlaceAtMe(SummonFX)
	utility.Wait(1)
	int teleportTarget = utility.randomInt(1,5)
	Self.MoveTo(SafePosition)
	Self.PlaceAtMe(SummonFX)
	utility.wait(0.5)
	self.evaluatePackage()
	adjustHealth()
endFunction

function adjustHealth()
	if self.GetAVPercentage("health") < 25
		self.Restoreav("health", 100)
	endif
endFunction


