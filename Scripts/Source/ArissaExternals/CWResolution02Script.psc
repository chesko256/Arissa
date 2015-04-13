Scriptname CWResolution02Script extends CWResolutionScript Conditional
{Extends CWResolutionScript which extends CWMissionScript which extends Quest}

ReferenceAlias Property SoldierEnemy1 Auto
ReferenceAlias Property SoldierEnemy2 Auto
ReferenceAlias Property SoldierEnemy3 Auto
ReferenceAlias Property SoldierEnemy4 Auto
ReferenceAlias Property SoldierEnemy5 Auto
ReferenceAlias Property SoldierEnemy6 Auto
ReferenceAlias Property SoldierEnemy7 Auto
ReferenceAlias Property SoldierEnemy8 Auto
ReferenceAlias Property SoldierEnemy9 Auto
ReferenceAlias Property SoldierEnemy10 Auto

Event OnUpdate()
	
	if HoldInitialPosition == 1
	
		ObjectReference SpawnBarricadeRef = SpawnBarricade.GetReference()
		
		if SoldierEnemy1.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor \
			|| SoldierEnemy2.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor \
			|| SoldierEnemy3.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor \
			|| SoldierEnemy4.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor \
			|| SoldierEnemy5.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor \
			|| SoldierEnemy6.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor \
			|| SoldierEnemy7.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor \
			|| SoldierEnemy8.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor \
			|| SoldierEnemy9.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor \
			|| SoldierEnemy10.GetReference().GetDistance(SpawnBarricadeRef) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor
		
; 			CWScript.Log("CWResolution02Script", self + "OnUpdate() enemy is near barricade marker, so guards should no longer HoldInitialPosition, but instead defend the door.")
			HoldInitialPosition == 0
		
		EndIf
	EndIf
EndEvent

