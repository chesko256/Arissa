Scriptname CWMission07Script extends CWMissionScript  Conditional
{Extends CWMissionScript which extends Quest}

Faction Property CWMission07BlackMailedFaction auto

LocationAlias Property CaravanLocation Auto

LocationRefType Property CWMission07SoldierEnemy	Auto

Armor Property CWMission07EvidenceMarkarth Auto
Book Property CWMission07EvidenceRiften Auto

int property Persuaded auto hidden conditional

function checkForVictory()
	if CaravanLocation.GetLocation().GetRefTypeAliveCount(CWMission07SoldierEnemy) == 0 
; 		CWScript.Log("CWMission07Script", "checkForVictory() found GetRefTypeAliveCount CWMission07SoldierEnemy == 0, so player succeeded")
	
		setStage(90)
	
	EndIf

EndFunction
