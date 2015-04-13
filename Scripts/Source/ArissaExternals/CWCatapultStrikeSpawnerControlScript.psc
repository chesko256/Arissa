Scriptname CWCatapultStrikeSpawnerControlScript extends ObjectReference 
{Script on the CWCatapult Activator}

;**************** OBSOLETE DELETE ME*********************************************
;
;CWCatapultScript CWCatapultS
;
;;THIS CAN'T LIVE ON CWCatapultScript BECAUSE THE WAIT WILL HANG THE MAIN CATAPULT SCRIPT WHILE IN THE WAIT... IT NEEDS TO LIVE ON ANOTHER SCRIPT
;function startSpawningCatapultStrikes()
;
;	CWCatapultS = (self as ObjectReference) as CWCatapultScript
;
;	if CWCatapultS.TurnedOn == False
; ;		CWScript.Log("CWCatapultStrikeSpawnControllerScript", self + "WARNING: my TurnedOn variable is false, I should NOT be calling startSpawningCatapultStrikes on myself.", 2, 1, 1)
;		
;	EndIf
;	
;	float countDown = Utility.RandomFloat(CWCatapultS.MinStrikeSpawnerTime, CWCatapultS.MaxStrikeSpawnerTime)
;	
;	while CWCatapultS.UseCWCatapultStrikeSpawners == True
; ;		debug.trace(self + "startSpawningCatapultStrikes() waiting for " + countDown)
;		Utility.wait(countDown)
;		
;		if CWCatapultS.UseCWCatapultStrikeSpawners == True	;in case we turned that off during the wait
;			if CWCatapultS.CWBattlePhase.GetValue() == 1 && GetLinkedRef(CWCatapultS.CW1)
; ;				debug.trace(self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(CWCatapultS.CW1))
;				(GetLinkedRef(CWCatapultS.CW1) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
;			elseif CWCatapultS.CWBattlePhase.GetValue() == 2 && GetLinkedRef(CWCatapultS.CW2)
; ;				debug.trace(self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(CWCatapultS.CW2))
;				(GetLinkedRef(CWCatapultS.CW2) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
;			elseif CWCatapultS.CWBattlePhase.GetValue() == 3 && GetLinkedRef(CWCatapultS.CW3)
; ;				debug.trace(self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(CWCatapultS.CW3))
;				(GetLinkedRef(CWCatapultS.CW3) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
;			elseif CWCatapultS.CWBattlePhase.GetValue() == 4 && GetLinkedRef(CWCatapultS.CW4)
; ;				debug.trace(self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(CWCatapultS.CW4))
;				(GetLinkedRef(CWCatapultS.CW4) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
;			elseif CWCatapultS.CWBattlePhase.GetValue() == 5 && GetLinkedRef(CWCatapultS.CW5)
; ;				debug.trace(self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(CWCatapultS.CW5))
;				(GetLinkedRef(CWCatapultS.CW5) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
;			Else
; ;				debug.trace(self + "startSpawningCatapultStrikes() NOT calling CallCatapultStrike() because CWBattlePhase == x which doesn't match a GetLinkedRef CWx", 1)
;			EndIf
;		
;			countDown = Utility.RandomFloat(CWCatapultS.MinStrikeSpawnerTime, CWCatapultS.MaxStrikeSpawnerTime)
;		
;		EndIf
;	
;	EndWhile
;	
;EndFunction

