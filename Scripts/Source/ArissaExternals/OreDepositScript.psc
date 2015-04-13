scriptName OreDepositScript extends objectReference
;Generic script to put on ore in mines allowing the player to attack the ore to harvest it
;
;==================================================

int property HPtotal = 100 auto
{How many hit this takes before giving up the ore}

int HPCurrent	;Current Hitpoints
miscObject property OreObject auto
int property MinYeald = 1 auto
int property MaxYeald = 3 auto
weapon property pickAx auto

auto State Unharvested
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do not allow for projectiles to damage
		if !akProjectile
			HPCurrent -= 20
; 			debug.Trace(self + " was hit by " + akaggressor + " " + akSource)
			if akSource == pickAx
				HPCurrent -= 20
			endif
			if HPCurrent <= 0
				Harvest(akAggressor)
			endif
		endif
	endEvent
endState

state Harvested
	
endState

function Harvest(objectReference TriggerRef)
	goToState("Harvested")
	int yeald = utility.randomInt(minYeald, maxYeald)
	TriggerRef.addItem(OreObject, yeald)
	;change art state	
endFunction

event onInit()
	HPCurrent = HPTotal
endEvent
