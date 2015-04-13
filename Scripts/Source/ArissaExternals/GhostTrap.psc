scriptName GhostTrap extends TrapBase
;
;
;This is the script for the swinging mace trap
;It's like a regular moving trap, but activating it causes a push force to be applied to the trap.
;This breaks the havok constraint, causing it to swing.
;================================================================

import utility
import debug
import game
import math

int doOnce
float initialDelay = 0.02
int hoverDelay
effectShader property ghostShader auto



Function fireTrap()	
	if doOnce == 0
		;doOnce = 1
		WindupSound.play( self as ObjectReference)		;play windup sound
		ResolveLeveledDamage()
		hoverDelay = 40
		;wait( initialDelay )		;wait for windup
		;ApplyHavokImpulse(0.0, 0.0, 1.0, 15.0)
		;ApplyHavokImpulse(0.0, 0.0, 1.0, 50.0)
		goToState("hover")
	endif
endFunction

state hover
	event onBeginState()
		ghostShader.Play(self as objectReference, hoverDelay)
		float xVectorTarget = self.getPositionX()
		float yVectorTarget = self.getPositionY()
		float zVectorTarget = self.getPositionZ() + 64
		float xVector
		float yVector
		float zVector
		float hoverImpulse = self.getMass()
		float hoverImpulseTarget
		while hoverDelay > 0
			xVector = xVectorTarget - self.getPositionX()
			yVector = yVectorTarget - self.getPositionY()
			zVector = zVectorTarget - self.getPositionZ()
			hoverImpulseTarget = (hoverImpulse/6) * (sqrt(pow(xVector, 2) + pow(yVector, 2) + pow(zVector, 2))/8)
			ApplyHavokImpulse(xVector, yVector, zVector, hoverImpulseTarget)
			hoverDelay -= 1
			wait( initialDelay )
		endwhile
		goToState("attack")
	endevent

endstate

state attack
	event onBeginState()
		float attackImpulse = 40 * self.getMass()
		float xVector = getPlayer().getPositionX() - self.getPositionX()
		float yVector = getPlayer().getPositionY() - self.getPositionY()
		float zVector = getPlayer().getPositionZ() - self.getPositionZ() + 96
		ApplyHavokImpulse(xVector, yVector, zVector, attackImpulse)
		ghostShader.Stop(self as objectReference)
		goToState("reset")
	endevent
endstate

;-------------------------------------------

int property TESTLvlEncValue auto
int property LvlThreshold1 = 3 auto
int property LvlDamage1  = 30 auto
int property LvlThreshold2 = 6 auto
int property LvlDamage2 = 40 auto
int property LvlThreshold3 = 9 auto
int property LvlDamage3 = 50 auto
int property LvlThreshold4 = 12 auto
int property LvlDamage4 = 60 auto
int property LvlThreshold5 = 16 auto
int property LvlDamage5 = 70 auto
int property LvlDamage6 = 80 auto

Function ResolveLeveledDamage ()
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
	TrapHitBase hitBase = (self as objectReference) as TrapHitBase
	hitBase.damage = damage
EndFunction
