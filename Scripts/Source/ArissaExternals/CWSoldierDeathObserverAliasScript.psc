Scriptname CWSoldierDeathObserverAliasScript extends ReferenceAlias  
{Attach this script and set CWs property on any soldier alias whose death should potentially modify the CWObj for a conquer hold objective. Do NOT use this in conjunction with the CWGarrisonObserverScript which is a different system.}

;This script should be attached to any alias (like from a Wilderness Encounter) where a soldiers death should possibly increase the CWObj % for a hold
;DO NOT CONFUSE THIS WITH THE CWGarrisonObserverSoldierScript!!!

;Note: Similar to CWSoldierDeathObserverActorScript

CWScript Property CWs Auto
{Pointer to CWScript on CW quest}

LocationAlias Property MyHoldLocationAlias Auto
{Location Alias that represents the Hold this Soldier belongs to}


Event OnDeath(Actor akKiller)

	Actor selfAsActor = GetActorReference()
	Location myHold = MyHoldLocationAlias.GetLocation()

	;Make sure the actor is loaded when you process his death, just to make sure the player was around when it happened.
	if selfAsActor.Is3DLoaded() == False
		return
	EndIf
	
; 	CWScript.Log("CWSoldierDeathObserverAliasScript", self + " OnDeath() calling: modObjectiveByEnemySoldierDeath(DeadSoldier = " + selfAsActor + ", Hold = " + myHold + ")")

	CWs.modObjectiveByEnemySoldierDeath(DeadSoldier = selfAsActor, Hold = myHold)

EndEvent
