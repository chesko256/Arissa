Scriptname CWSoldierCombatStateScript extends ReferenceAlias  

int Property StageToSetIfInCombatWithPlayer Auto 
{Set this stage in owning quest if I get into combat with player. Ignored if GetStageDone() ==  true}

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	
	Quest OwningQuest = GetOwningQuest()

	if aeCombatState == 1 && akTarget == Game.GetPlayer() && OwningQuest.GetStageDone(StageToSetIfInCombatWithPlayer) == False
; 		CWScript.Log("CWSoldierCombatStateScript", self+ " OnCombatStateChanged() in combat with player, setting stage to " + StageToSetIfInCombatWithPlayer)
		
		OwningQuest.SetStage(StageToSetIfInCombatWithPlayer)
		
	EndIf

EndEvent

