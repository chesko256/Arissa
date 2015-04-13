Scriptname CWResolutionScript extends CWMissionScript  Conditional
{Extends CWMissionScript which extends Quest}

int property questHookSaid auto hidden conditional				;0 = inset, 1 = FieldCO gave the spiel and should now forcegreet goodbye 
int property playerFoundArmy auto hidden conditional				;0 = unset, 1 = player rendezvoused with army (set in Stage 20, set by CWResolution01SoldierFriendlyScript)
int property barricadeDestroyed auto hidden conditional			;0 = unset, 1 = player has broken down the barricade (set in Stage 30, set by CWResolution01BarricadeScript)
int property jarlWillSurrender auto hidden conditional			;0 = unset, 1 = will surrender to player (set in Stage 40, set by CWResolution01JarlBodyJarl & CWResolution01JarlBodyGuardScript)
int property jarlHasSurrendered auto hidden conditional			;0 = unset, 1 = has surrendered to player (set in Stage 50, set by CWResolution01JarlScript)

int Property countBodyGuards Auto Hidden 

int Property HoldInitialPosition = 1 Auto hidden Conditional			;1 = soldiers should guard their defender marker, 0 = they guard the door to the jarls house

ReferenceAlias Property SpawnBarricade Auto

int Property DistanceFromSpawnBarricadeToCauseGuardsToGuardDoor = 1500 Auto


Function incrementCountBodyGuards()	;called in the OnInit() events of body guard aliases
	countBodyGuards += 1

EndFunction

Function decrementCountBodyGuards()	;called in the OnInit() events of body guard aliases
	countBodyGuards -= 1

	if countBodyGuards == 0
		setStage(40)
	
	EndIf
	
EndFunction
