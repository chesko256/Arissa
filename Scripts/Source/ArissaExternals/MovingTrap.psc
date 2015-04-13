scriptName MovingTrap extends TrapBase
;
;
;This is the base class for a moving trap. 
;When a moving trap collides with an actor, it should damage that actor.
;This sets up the mechanics, but behavior will have to be set up on the inherited object.
;================================================================

import debug
import utility

;================================================================

bool property isLoaded = True auto hidden
bool property isFiring = False auto hidden

int property LvlThreshold1 auto
int property LvlDamage1 auto
int property LvlThreshold2 auto
int property LvlDamage2 auto
int property LvlThreshold3 auto
int property LvlDamage3 auto
int property LvlThreshold4 auto
int property LvlDamage4 auto
int property LvlThreshold5 auto
int property LvlDamage5 auto
int property LvlDamage6 auto

;int Function ResolveLeveledDamage (int damage)
Function ResolveLeveledDamage()
	int damageLevel
	int damage
	damageLevel = CalculateEncounterLevel(TrapLevel)
	
	damage = LvlDamage1
	
	if (damageLevel > LvlThreshold1 && damageLevel <= LvlThreshold2)
		damage = LvlDamage2
		;Trace("damage threshold =")
		;Trace("2")
	endif
	if (damageLevel > LvlThreshold2 && damageLevel <= LvlThreshold3)
		damage = LvlDamage3
		;Trace("damage threshold =")
		;Trace("3")
	endif
	if (damageLevel > LvlThreshold3 && damageLevel <= LvlThreshold4)
		damage = LvlDamage4
		;Trace("damage threshold =")
		;Trace("4")
	endif
	if (damageLevel > LvlThreshold4 && damageLevel <= LvlThreshold5)
		damage = LvlDamage5
		;Trace("damage threshold =")
		;Trace("5")
	endif
	if (damageLevel > LvlThreshold5)
		damage = LvlDamage6
		;Trace("damage threshold =")
		;Trace("6")
	endif
	
	;Trace("damage =")
	;Trace(damage)
	
	;return damage
	hitBase = (self as objectReference) as TrapHitBase
	if hitbase
		hitBase.damage = damage
	endif
EndFunction

event onCellAttach()
	isLoaded = TRUE
	if isFiring == True
		fireTrap()
	endif
EndEvent

event onCellDetach()
; 	debug.Trace(self + " has recieved onUnload event")
	isLoaded = FALSE
endEvent



