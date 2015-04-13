ScriptName SR08BanditScript extends ReferenceAlias

Quest property SR08 auto

Event OnCombatStateChanged(Actor akTarget,int aeCombatState)
	If (aeCombatState != 0) && (SR08.GetStage() < 10) ; 0 means not in combat, so non-0 means we entered combat
		SR08.SetStage(10)
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
       ; increment dead count
       SR08QuestScript myQuestScript
       myQuestScript = GetOwningQuest() as SR08QuestScript
       myQuestScript.IncrementDeadBandits()
EndEvent