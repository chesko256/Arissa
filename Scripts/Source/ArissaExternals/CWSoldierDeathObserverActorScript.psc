Scriptname CWSoldierDeathObserverActorScript extends Actor  
{Use this script ONLY for Soldiers whose deaths are not already being watched by CWGarrisonObserver system or CWSoldierDeathObserverAliasScript. For example: CWPatrolImperial/Son actors}

;DO NOT CONFUSE THIS WITH THE CWGarrisonObserverSoldierScript!!!

;Note: Similar to CWSoldierDeathObserverAliasScript


CWScript Property CWs Auto
{Pointer to CWScript on CW quest}

Location Property MyHoldLocation = None Auto
{OPTIONAL Reference Property: YOU DO NOT HAVE TO SET THIS IF THE ACTORS EDITOR LOCATION IS IN A LOCATION THAT IS A CHILD OF A HOLD. If you do set this, set it on the reference and it should be the Location that represents the Hold this Soldier belongs to}


Event OnDeath(Actor akKiller)

	;Make sure the actor is loaded when you process his death, just to make sure the player was around when it happened.
	if Is3DLoaded() == False
		return
	EndIf
	

	Location myHold

	if MyHoldLocation != None
		myHold = MyHoldLocation
		
	Else
; 		CWScript.Log("CWSoldierDeathObserverActorScript", self + " OnDeath() calling: GetMyEditorLocationHoldLocation(" + self + ")")
		myHold = CWs.GetMyEditorLocationHoldLocation(self)
		
	EndIf
	

; 	CWScript.Log("CWSoldierDeathObserverActorScript", self + " OnDeath() calling: modObjectiveByEnemySoldierDeath(DeadSoldier = " + self + ", Hold = " + myHold + ")")

	CWs.modObjectiveByEnemySoldierDeath(DeadSoldier = self, Hold = myHold)

EndEvent
