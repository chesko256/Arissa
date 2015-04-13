Scriptname DBSanctuarySetupScript extends ObjectReference  
{Toggles Cicero and the Night Mother's markers in the Sanctuary depending on the state of the DB Questline.}

ObjectReference property CiceroMovesInMarker Auto
ObjectReference property CiceroCleansUpMarker Auto
ObjectReference property CiceroMovesOutMarker Auto
ObjectReference property NightMotherMovesInMarker Auto
ObjectReference property NightMotherCleansUpMarker Auto

ObjectReference property EnableCiceroOnNextEntryMarker Auto

Quest property DarkBrotherhoodQST Auto
Quest property DB07QST Auto


Event OnTriggerEnter(ObjectReference AkActivator)
	if (!EnableCiceroOnNextEntryMarker.IsDisabled())
		EnableCiceroOnNextEntryMarker.Disable()
		CiceroMovesInMarker.Enable()
		CiceroCleansUpMarker.Enable()
		NightMotherMovesInMarker.Enable()
		NightMotherCleansUpMarker.Enable()
	EndIf
	if (DB07QST.GetStage() == 10)
		CiceroMovesInMarker.Disable()
		CiceroMovesOutMarker.Enable()
	EndIf
EndEvent