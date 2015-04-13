Scriptname CWMission04SoldierScript extends ReferenceAlias  

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
; 	CWScript.Log("CWMission04Script", self +  "OnCombatStateChanged(" + akTarget + ", " + aeCombatState + ")")

	(GetOwningQuest() as CWMission04Script).combatStarted(GetActorReference(), akTarget, aeCombatState)

EndEvent

Event OnDeath(Actor akKiller)
; 	CWScript.Log("CWMission04Script", self +  "OnDeath() will call checkForVictory()")
	(GetOwningQuest() as CWMission04Script).checkForVictory()
	
EndEvent
