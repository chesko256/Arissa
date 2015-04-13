Scriptname MQSovngardeShoutTrigger extends MQShoutTrigger  

import Utility
import debug

int tempupdateCount

Event OnLoad()
	; watch for quest state change - "unfog" if load after fog is cleared
	if MQ305.GetStageDone(100) && allowEnableFlag
		allowEnableFlag = false
		setFogState(false)
	endif
endEvent

; this is to replace the update loop - quest activates the parent of all these refs which should pass it along to fog triggers
Event OnActivate(ObjectReference akActionRef)
; 	debug.trace(self + " ON ACTIVATE" + akActionRef)
	tempupdateCount = tempupdateCount+1
	; enable if Alduin shouts the mist back
	MQ305Script pMQ305Script = MQ305 as MQ305Script
	if MQ305.GetStageDone(30) && MQ305.GetStageDone(100) == false
		if !IsFogOn() && pMQ305Script.MistClearCount == 0
			trace(self+" enabling from Alduin's shout")
			; enable immediately
			Wait(RandomFloat(0, 3))
;			allowEnableFlag = true  ; turn it back on so it will respond to being struck
			setFogState(true)
			trace(self+" enabling from Alduin's shout DONE")
		endif
	endif
	
	if MQ305.GetStageDone(100)
		allowEnableFlag = false
		trace(self+" disabling from stage 100")

		Wait(RandomFloat(0, 1))
		setFogState(false)
		Wait(2) ; give time for fadeout animation
		disable()
		trace(self+" disabling from stage 100 DONE")
	endif

endEvent


; This function is called when struck by a valid projectile
;Function fireTriggerEvent(Projectile akProjectile)
Function fireTriggerEvent(Spell akSpell)
; 	debug.trace( self + "MQSovngardeShoutTrigger: fireTriggerEvent " + akSpell)
	; update quest when triggered
	if MQ305.GetStageDone(30) && MQ305.GetStageDone(100) == 0
		; update for intro scene
		(MQ305 as MQ305Script).IncrementShoutCount()
		; do not automatically reset this fog from now on
		allowEnableFlag = false 
	endif
	; tell linked dragon to fly away
	DevourSoulChangeState(2)
	parent.fireTriggerEvent(akSpell)
endFunction

; this function is called when something triggers/hits the trigger box
Function resolveTriggerLogic(ObjectReference TriggerRef = None, Spell SpellRef = None)
;Function resolveTriggerLogic(ObjectReference TriggerRef = None, Projectile ProjectileRef = None)
	; if player enters trigger box, setAV on linked actor to get him to attack
; 	debug.trace( self + "MQSovngardeShoutTrigger: resolveTriggerLogic ObjectRef=" + TriggerRef + ",  SpellRef=" + spellRef)
	Actor actorRef = TriggerRef as Actor
	if actorRef && actorRef == Game.GetPlayer()
		; tell linked dragon to devour soul
		DevourSoulChangeState(1)
	endif
	; call parent version of this function
	parent.resolveTriggerLogic(TriggerRef, SpellRef)
endFunction


; function to centralize state changes and pass them on to linked dragon
function DevourSoulChangeState(int newState)
; 		debug.trace(self + " DevourSoulChangeState to  " + newState)
		TryToChangeState(DragonKeyword, newState)
		TryToChangeState(LostSoulKeyword, newState)
endFunction

function TryToChangeState(Keyword pKeyword, int newState)
		Actor pActor = GetLinkedRef(pKeyword) as Actor
; 		debug.trace(self + " TryToChangeState: keyword=" + pKeyword + ", actor= " + pActor)
		if pActor && pActor.GetActorValue("variable01") < newState
; 			debug.trace(self + " TryToChangeState: changing to state " + newState)
			pActor.SetActorValue("variable01", newState)
			pActor.EvaluatePackage()
		endif
endFunction

Quest Property MQ305  Auto  

Keyword Property DragonKeyword  Auto  

Keyword Property LostSoulKeyword  Auto  
