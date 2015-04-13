scriptName FreeformKolskeggrADeathScript extends ReferenceAlias

;Event OnCombatStateChanged(Actor akTarget,int aeCombatState)
;	If (aeCombatState != 0) && (GetOwningQuest().GetStageDone(10) == 0) ; 0 = not in combat, so non-zero means we entered combat
;		if (akTarget == Game.GetPlayer())
;			GetOwningQuest().SetStage(10)
;		EndIf
;	EndIf
;EndEvent

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as FreeformKolskeggrAQuestScript).ForswornDead()
EndEvent