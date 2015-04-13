Scriptname CWFortSiegeSoldierScript extends ReferenceAlias  

Event OnCombatStateChanged(Actor akTarget, int aeState)
	if aeState != 0 ; 0 = not in combat, so if it isn't 0, they entered combat
		CWFortSiegeScript CWFortSiegeS = GetOwningQuest() as CWFortSiegeScript
		
		if akTarget == Game.GetPlayer() && CWFortSiegeS.GetStageDone(CWFortSiegeS.QuestStageToCompleteOrFailMeetArmyObjective) == False
; 			CWScript.Log("CWFortSiegeSoldierScript", self + "OnCombatStateChanged(Player) updating objectives by setting quest stage: " + CWFortSiegeS.QuestStageToCompleteOrFailMeetArmyObjective)
			CWFortSiegeS.SetStage(CWFortSiegeS.QuestStageToCompleteOrFailMeetArmyObjective)
		EndIf

		if akTarget == Game.GetPlayer() && CWFortSiegeS.GetStageDone(CWFortSiegeS.QuestStageForPhase2) == False
; 			CWScript.Log("CWFortSiegeSoldierScript", self + "OnCombatStateChanged(Player) starting phase 2 by setting quest stage: " + CWFortSiegeS.QuestStageForPhase2)
			CWFortSiegeS.SetStage(CWFortSiegeS.QuestStageForPhase2)
		EndIf
	EndIf
EndEvent

