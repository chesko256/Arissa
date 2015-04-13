scriptName DA10GhostTrap extends referenceAlias conditional
;
;This is a script put on the ghost objects for DA10
;		it recieves orders from the controller script on the haunting controller Quest
;		it talks to the hit script to say when it can damage
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
referenceAlias property witchHunter auto
bool property hauntingOver auto hidden
sound property QSTDA10ItemLevitate auto
sound property QSTDA10ItemShoot auto
objectReference property objSelf auto hidden

;===================================================================
;;STATES BLOCK
;===================================================================

auto State Idle
	event onBeginState()
		ghostShader.Stop(self.getReference())
	endEvent
	
	event onActivate(objectReference akActivator)
; 		debug.trace(self + "has been activated")
		if akActivator == self.getReference() && !hauntingOver 
			fireTrap()
		endif
	endEvent
endState

Function fireTrap()
; 	debug.trace(self + "has fired trap")
	if WindupSound	
		WindupSound.play(self.getReference())		;play windup sound
	endif
	ResolveLeveledDamage()
	hoverDelay = 40
	;wait( initialDelay )		;wait for windup
	;ApplyHavokImpulse(0.0, 0.0, 1.0, 15.0)
	;ApplyHavokImpulse(0.0, 0.0, 1.0, 50.0)
	goToState("hover")
endFunction

state hover
	event onBeginState()
		objSelf = self.getReference()
		if QSTDA10ItemLevitate
			QSTDA10ItemLevitate.play(objSelf)
		endif
		ghostShader.Play(self.getReference(), hoverDelay)
		float xVectorTarget = self.getReference().getPositionX()
		float yVectorTarget = self.getReference().getPositionY()
		float zVectorTarget = self.getReference().getPositionZ() + 64
		float xVector
		float yVector
		float zVector
		float hoverImpulse = self.getReference().getMass()
		float hoverImpulseTarget
		while hoverDelay > 0 && !hauntingOver
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
		if !hauntingOver
			objectReference myTarget = pickAttackTarget()
			float attackImpulse = 40 * self.getReference().getMass()
			float xVector = myTarget.getPositionX() - self.getReference().getPositionX()
			float yVector = myTarget.getPositionY() - self.getReference().getPositionY()
			float zVector = myTarget.getPositionZ() - self.getReference().getPositionZ() + 96
			if QSTDA10ItemShoot
				QSTDA10ItemShoot.play(objSelf)
			endif
			getReference().ApplyHavokImpulse(xVector, yVector, zVector, attackImpulse)
		endif
		goToState("idle")
	endevent
endstate

objectReference function pickAttackTarget()
	int Target = randomInt(0,1)
	if Target == 0
		return game.GetPlayer()
	ElseIf Target == 1
		return witchHunter.getReference()
	Else
; 		debug.Trace(self + " ERROR: Target picker has an invalid random int")
	endif
endFunction

;===================================================================
;;LEVELED DAMAGE BLOCK
;===================================================================

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

