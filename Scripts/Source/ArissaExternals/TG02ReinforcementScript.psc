Scriptname TG02ReinforcementScript extends ObjectReference
{script that handles reinforcements for TG02}

import debug
import utility

Actor property Merc1 auto
Actor property Merc2 auto
Actor property Merc3 auto
Actor property Merc4 auto
Actor property Merc5 auto

Actor property Reinforcement1 auto
Actor property Reinforcement2 auto
Actor property Reinforcement3 auto
Actor property Reinforcement4 auto
Actor property Reinforcement5 auto

int doOnce01
int doOnce02
int doOnce03
int doOnce04
int doOnce05


;************************************

Auto State Waiting
	Event OnTriggerEnter(ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer())
			if(Merc1.isDead() && doOnce01 == 0)
				doOnce01 = 1
				Reinforcement1.enable()
			endif
			
			if(Merc2.isDead() && doOnce02 == 0)
				doOnce02 = 1
				Reinforcement2.enable()
			endif
			
			if(Merc3.isDead() && doOnce03 == 0)
				doOnce03 = 1
				Reinforcement3.enable()
			endif
			
			if(Merc4.isDead() && doOnce04 == 0)
				doOnce04 = 1
				Reinforcement4.enable()
			endif
			
			if(Merc5.isDead() && doOnce05 == 0)
				doOnce05 = 1
				Reinforcement5.enable()
			endif
		endif
	endEvent
endState

;************************************

State done
	;do nothing
endState

;************************************
