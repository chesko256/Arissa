Scriptname CWResolution01Script extends CWResolutionScript conditional
{Extends CWMissionScript which extends CWResolutionScript which extends Quest}

Event OnUpdate()
	if HoldInitialPosition == 1 && Game.GetPlayer().GetDistance(SpawnBarricade.GetReference()) < DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor
; 		CWScript.Log("CWResolution01Script", self + "OnUpdate() player is near barricade marker, so guards should no longer HoldInitialPosition, but instead defend the door.")
		HoldInitialPosition == 0
	EndIf
EndEvent
