Scriptname CWFieldCOImperialWhiterunCapitalScript extends Actor  

Quest Property CW03 Auto

ObjectReference Property CWGarrisonEnableMarkerImperialWhiterun Auto


Event OnCellLoad()
	
; 	CWScript.Log("CWFieldCOImperialWhiterunCapitalScript", "OnCellLoad()")

	if CW03.GetStageDone(100) && CWGarrisonEnableMarkerImperialWhiterun.IsDisabled() == False
; 		CWScript.Log("CWFieldCOImperialWhiterunCapitalScript", "OnCellLoad() enabling because CW03.GetStageDone(100) && CWGarrisonEnableMarkerImperialWhiterun.IsDisabled() == False")
		Enable()
		
	Else
; 		CWScript.Log("CWFieldCOImperialWhiterunCapitalScript", "OnCellLoad() disabling because CW03.GetStageDone(100) == false || CWGarrisonEnableMarkerImperialWhiterun.IsDisabled() == true")
		Disable()
	
	EndIf

EndEvent
