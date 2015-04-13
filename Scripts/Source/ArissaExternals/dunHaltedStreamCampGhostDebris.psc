scriptName dunHaltedStreamCampGhostDebris extends referenceAlias conditional
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


float initialDelay = 0.02
int hoverDelay
effectShader property ghostShader auto
sound property WindupSound auto ;Played when winding up or releasing trap
int Property TrapLevel = 2 auto
{Used to determine the difficulty of the trap, currently only tied to damage
	0 = Easy
	1 = Medium
	2 = Hard
	3 = VeryHard}
	
int Property damage auto hidden


auto State Idle
	event onActivate(objectReference akActivator)
; 		debug.trace(self + "has been activated")
		if akActivator == self.getReference()
			fireTrap()
		endif
	endEvent
endState

Function fireTrap()
; 	debug.trace(self + "has fired trap")
	WindupSound.play(self.getReference())		;play windup sound
	ResolveLeveledDamage()
	hoverDelay = 40
	;wait( initialDelay )		;wait for windup
	;ApplyHavokImpulse(0.0, 0.0, 1.0, 15.0)
	;ApplyHavokImpulse(0.0, 0.0, 1.0, 50.0)
	goToState("hover")
endFunction

state hover
	event onBeginState()
		ghostShader.Play(self.getReference(), hoverDelay)
		float xVectorTarget = self.getReference().getPositionX()
		float yVectorTarget = self.getReference().getPositionY()
		float zVectorTarget = self.getReference().getPositionZ() + 64
		float xVector
		float yVector
		float zVector
		float hoverImpulse = self.getReference().getMass()
		float hoverImpulseTarget
		while hoverDelay > 0
			xVector = xVectorTarget - self.getReference().getPositionX()
			yVector = yVectorTarget - self.getReference().getPositionY()
			zVector = zVectorTarget - self.getReference().getPositionZ()
			hoverImpulseTarget = (hoverImpulse/6) * (sqrt(pow(xVector, 2) + pow(yVector, 2) + pow(zVector, 2))/8)
			getReference().ApplyHavokImpulse(xVector, yVector, zVector, hoverImpulseTarget)
			hoverDelay -= 1
			wait( initialDelay )
		endwhile
		goToState("attack")
	endevent

endstate

state attack
	event onBeginState()
		float attackImpulse = 40 * self.getReference().getMass()
		float xVector = getPlayer().getPositionX() - self.getReference().getPositionX()
		float yVector = getPlayer().getPositionY() - self.getReference().getPositionY()
		float zVector = getPlayer().getPositionZ() - self.getReference().getPositionZ() + 96
		getReference().ApplyHavokImpulse(xVector, yVector, zVector, attackImpulse)
		ghostShader.Stop(self.getReference())
		goToState("idle")
	endevent
endstate

;-------------------------------------------

quest myQuest
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
	damageLevel = self.getReference().CalculateEncounterLevel(TrapLevel)
	
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
	DA10GhostTrapHit hitBase = ((self as referenceAlias) as DA10GhostTrapHit)
	hitBase.damage = damage
EndFunction

