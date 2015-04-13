Scriptname CWGarrisonObserverSoldierScript extends ReferenceAlias
{Script attached to SoldierX aliases in CWGarrisonObserver quest}

Event OnDeath(Actor akKiller)
	;assume the player or ally killed the soldier, so we will award him with points if there is currently a "conquer the hold" objective open in the civil war
	
	;make sure the parent quest is done counting all the soldiers before you process their deaths
	
; 	CWScript.Log("CWGarrisonObserverSoldierScript", self + " OnDeath()")
	
	CWGarrisonObserverScript CWGarrisonObserverS = GetOwningQuest() as CWGarrisonObserverScript
	
	int waitTime = 0
	
	while CWGarrisonObserverS.DoneSettingInitialCount == false
		utility.wait(1)
		waitTime += 1
; 		CWScript.Log("CWGarrisonObserverSoldierScript", self + " OnDeath() parent quest's DoneSettingInitialCount != true, waiting until then before processing death. Have been waiting " + waitTime + " seconds.", 1)
	
	EndWhile

	CWGarrisonObserverS.ProcessSoldierDeath(GetActorReference())
		
EndEvent
