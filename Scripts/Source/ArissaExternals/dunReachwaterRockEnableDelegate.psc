Scriptname dunReachwaterRockEnableDelegate extends ObjectReference  

Quest property dunGauldursonQST Auto
ReferenceAlias property GhostToEnable Auto
bool activated = False

Event OnLoad()
	if (dunGauldursonQST.GetStage() < 105)
		Utility.Wait(1)
		(GhostToEnable as dunReachwaterRockGhostScript).Reload()
	EndIf
EndEvent

Event OnActivate(ObjectReference obj)
	if (!activated)
		(GhostToEnable as dunReachwaterRockGhostScript).EnableGhost()
		Activated = True
	ElseIf (obj != Game.GetPlayer())
		(GhostToEnable as dunReachwaterRockGhostScript).DestroyGhost()
	Else
		(GhostToEnable as dunReachwaterRockGhostScript).DisableGhost()
	EndIf
EndEvent