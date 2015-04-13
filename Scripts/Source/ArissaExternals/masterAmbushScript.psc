ScriptName masterAmbushScript extends Actor
{Script that lives on the actor and takes care of all instances of how an actor can come out of idle state while in ambush mode}

import game
import debug

string property sActorVariable = "Variable01"  auto hidden
{By default, this property is set to Variable01.}

float property fActorVariable = 1.0 auto hidden
{By default this property is set to 1.} 

float property fActorVariableOnReset = 0.0 auto hidden

float property fAggression = 2.0 auto hidden
{
By default this property is set to 2 (very aggressive).
0 - Unaggressive - will not initiate combat
1 - Aggressive - will attack enemies on sight
2 - Very Aggressive - Will attack enemies and neutrals on sight
3 - Frenzied - Will attack anyone else
}

float property fAggressionOnReset = 0.0 auto hidden

keyword property linkKeyword auto
{if this has a linkedRef with this keyword, we will activate it once when hit, activated, or on combat begin}

bool property ambushOnTrigger = false auto
{By default, this is set to false. Set to true if you want encounter to come out of ambush when player enters trigger}

;**********************************************

Event onReset()
	;messagebox ("in reset")
	self.setAV(sActorVariable, fACtorVariableonReset)
	self.setAv("Aggression", fAggressionOnReset)
	self.evaluatePackage()
endEvent

;**********************************************

auto State waiting
	;The actor can exit the furniture in multiple ways.  We need to listen for all of these
	;events and if any are called, then go to All Done state, since we don't need to listen
	;for any other events because any of the events will get the actor out of the furniture.
	
	;Handle Activation
	Event onActivate(ObjectReference triggerRef)
		;trace("in onactivate")
		Actor actorRef = triggerRef as Actor
		if((actorRef == game.getPlayer()) || (ambushOnTrigger == true))
			;player has activated draugr, so leave state
			gotoState("allDone")
		else
			;trigger activated them, so set their aggression to 2, but do not leave state
			self.setAV("Aggression", fAggression)
			self.EvaluatePackage()
		endif
	endEvent
	
	;Handle onHit
	Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;trace("in onhit")
		gotoState("allDone")
	endEvent
	
	;Handle other cases that cause them to come out of furniture
	
	;Using onGetUp as a safety net
	Event onGetUp(ObjectReference myFurniture)
		Cell parentCell = GetParentCell()
		;trace("in getup")
		if (parentCell && parentCell.IsAttached() && (is3DLoaded()))
			gotoState("allDone")
		endif
	endEvent
	
	Event OnCombatStateChanged(Actor actorRef,int aeCombatState)
		;trace("in combatstatechanged")
		if (aeCombatState != 0) ; 0 = not in combat, so non-0 means we entered combat
			gotoState("allDone")
		endIf
	endEvent
	
	;if any of the events above are caught, we leave this state, but first we need to take care
	;of setting up everything we need when we get out of our furniture.
	Event onEndState()
		;trace("in end state")
		;handle things like sarcophagus lids that are the linkedRef of the furniture
		if(getLinkedRef())
			getLinkedRef().activate(self)
		endif
		
		if(getNthLinkedRef(1))
			getNthLinkedRef(1).activate(self)
		endif
		
		if(getNthLinkedRef(2))
			getNthLinkedRef(2).activate(self)
		endif
		
		;set actor variables
		self.setAV(sActorVariable, fACtorVariable)
		self.setAV("Aggression", fAggression)
		self.evaluatePackage()
		
		;check to see if actor has a linkedRef with this keyword, if so, then activate it
		if (GetLinkedRef(linkKeyword) as objectReference)
			(getLinkedRef(linkKeyword) as objectReference).activate(self)
		endif
	endEvent
endState

;**********************************************

State allDone
	;do nothing
endState
	
;**********************************************