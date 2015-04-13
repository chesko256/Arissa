Scriptname ArenaEntranceTriggerScript extends ReferenceAlias  


Event OnTriggerEnter(ObjectReference akActivator)
;     Debug.Trace("ARENA: Wager trigger hit -- preset? " + (GetOwningQuest() as ArenaScript).CombatPreSet)
	if (Game.GetPlayer() == akActivator)
		ArenaScript aScript = GetOwningQuest() as ArenaScript
		if (aScript.CombatPreSet)
            aScript.CombatPreSet = False
            Quest currFight = None
            if (aScript.WagerOngoing)
            	currFight = aScript.NextWagerFight
            else
            	currFight = aScript.CurrentFight
            endif
			(currFight as ArenaCombatQuest).PlayerEnteredArena()
		endif
	endif
EndEvent
