Scriptname CWThreatTriggerScript extends ObjectReference  
{Used to set up variables for combat barks}

;When an actor enters, it increments a count and turns on an appropriate global for context sensitive combat barks
;When an actor leaves (or dies), it decrements a count and turns off an appropriate global if the count of that type of actor is zero.
;	 NOTE: if there are similar trigger boxes, when the count of any of them is reduced from 1 to 0, everyone will stop talking about that type of unit, in that type of trigger box, until other actor enters that type of trigger box.


CWScript Property CWs Auto
{BASE OBJECT - pointer to CWScript on CW quest}

bool property bridge Auto
{REFERENCE - trigger is surrounding an object of this type}
bool property fence Auto
{REFERENCE - trigger is surrounding an object of this type}
bool property house Auto
{REFERENCE - trigger is surrounding an object of this type}
bool property rock Auto
{REFERENCE - trigger is surrounding an object of this type}
bool property stables Auto
{REFERENCE - trigger is surrounding an object of this type}
bool property tower Auto
{REFERENCE - trigger is surrounding an object of this type}
bool property tree Auto
{REFERENCE - trigger is surrounding an object of this type}
bool property wall Auto
{REFERENCE - trigger is surrounding an object of this type}
bool property window Auto
{REFERENCE - trigger is surrounding an object of this type}


Event OnLoad()

; CWScript.Log("CWThreatTriggerScript", self + "OnLoad()")
;debug.messagebox(self + "OnLoad()")

EndEvent

Event OnUnload()
; CWScript.Log("CWThreatTriggerScript", self + "OnUnload()")
;debug.messagebox(self + "OnUnload()")

EndEvent



Event OnTriggerEnter(ObjectReference akActionRef)
	Actor actorRef = akActionRef as Actor

	if ActorRef
; 		CWScript.Log("CWThreatTriggerScript", self + "OnTriggerEnter(" + actorRef + ")")
		
		CWs.CWThreatCombatBarksS.ProcessTriggerActor(actorRef, CWs.CWBattlePhase.GetValue(), bridge, fence, house, rock, stables, tower, tree, wall, window)
		
	EndIf

	
EndEvent

; Do not call this event from OnTriggerEnter or OnTriggerLeave
Event OnTriggerLeave(ObjectReference akActionRef)

;Debug.StartStackProfiling() 

	Actor actorRef = akActionRef as Actor
	
	if ActorRef
; 		CWScript.Log("CWThreatTriggerScript", self + "OnTriggerLeave():" + akActionRef)	

		CWs.CWThreatCombatBarksS.ProcessTriggerActorLeaving(actorRef)
		
	EndIf
	
;debug.StopStackProfiling()
	
EndEvent
