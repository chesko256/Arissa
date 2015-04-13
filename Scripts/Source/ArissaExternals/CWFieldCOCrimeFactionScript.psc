Scriptname CWFieldCOCrimeFactionScript extends Actor  

bool CrimeFactionSet

CWScript Property CWs Auto

Event OnInit()

	int waitingFor

	While CWs.Init == 0
		utility.wait(1)
		WaitingFor += 1

; 		debug.trace(self + "CWFieldCOCrimeFactionScript OnInit() waiting for CWScript on CW OnInit to finish. Waiting for: " + waitingFor )

	endWhile

	if CrimeFactionSet == False && GetEditorLocation().HasKeyword(CWs.CWCapital)   ;THIS IS SO WE CAN SET THE GENERIC FIELD COS IN THE CAPTIAL TOWNS AND CITIES
; 		CWScript.Log("CWFieldCOScript", self + "OnLoad() Editor Location has CWCapital keyword, so I'm setting my crime faction to be the hold's crime faction.")
		CWs.setCrimeFactionOnActorForEditorLocationsHold(self)
		AddToFaction(CWs.IsGuardFaction)
	
	EndIf
	
EndEvent

	