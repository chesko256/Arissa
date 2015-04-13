ScriptName dunRiftenJailLoadCheck extends ObjectReference
{If the player has been arrested and thrown into jail, temporarily move the guard at the entrance to allow a stealthy escape.}

ObjectReference property JailEntranceGuardDayImp Auto
ObjectReference property JailEntranceGuardDaySons Auto
ObjectReference property JailEntranceGuardAltMarker Auto

ObjectReference property Jail03GuardDayImp Auto
ObjectReference property Jail03GuardDaySons Auto

ObjectReference property Jail04GuardDayImp Auto
ObjectReference property Jail04GuardDaySons Auto

ObjectReference property JailDoor Auto
ObjectReference property EntranceMarker Auto
ObjectReference property CellMarker Auto
ObjectReference property HasMoved Auto

Event OnLoad()
	;Move Forcegreet Jailor out of the way if the player is in their cell.
	if (Game.GetPlayer().GetDistance(EntranceMarker) > Game.GetPlayer().GetDistance(CellMarker))
		;Player was arrested.
		if (!JailEntranceGuardDayImp.IsDisabled())
			JailEntranceGuardDayImp.MoveTo(JailEntranceGuardAltMarker)
		Else
			JailEntranceGuardDaySons.MoveTo(JailEntranceGuardAltMarker)
		EndIf
	EndIf

	;Force interior jailors into position so the jail isn't empty if a shift change is in progress.
	;As a side bonus, this also keeps the entryway door shut and locked.
	if (!JailEntranceGuardDayImp.IsDisabled())
		(Jail03GuardDayImp as Actor).MoveToPackageLocation()
		(Jail03GuardDayImp as Actor).EvaluatePackage()
		(Jail04GuardDayImp as Actor).MoveToPackageLocation()
		(Jail04GuardDayImp as Actor).EvaluatePackage()
	Else
		(Jail03GuardDaySons as Actor).MoveToPackageLocation()
		(Jail03GuardDaySons as Actor).EvaluatePackage()
		(Jail04GuardDaySons as Actor).MoveToPackageLocation()
		(Jail04GuardDaySons as Actor).EvaluatePackage()
	EndIf
EndEvent

Event OnUnload()
	if (!JailEntranceGuardDayImp.IsDisabled())
		(JailEntranceGuardDayImp as Actor).MoveToPackageLocation()
		(JailEntranceGuardDayImp as Actor).EvaluatePackage()
	Else
		(JailEntranceGuardDaySons as Actor).MoveToPackageLocation()
		(JailEntranceGuardDaySons as Actor).EvaluatePackage()
	EndIf
EndEvent

Event OnReset()
	OnUnload()
	Utility.Wait(1)
	JailDoor.SetOpen(False)
	OnLoad()
EndEvent