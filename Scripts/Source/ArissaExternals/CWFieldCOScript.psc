Scriptname CWFieldCOScript extends Actor  
{Script on the CWFieldCOImperial/Sons base objects, Extends Object Reference}

;THIS SCRIPT HAS LOGIC IN IT FOR WHEN EACH CAMP HAD ITS OWN FIELD CO AND THERE WERE RANDOM MISSIONS, BUT BECAUSE I DON'T HAVE TIME TO OVERHAUL THE WHOLE SYSTEM
;I'm hacking it for use with Rikke and Galmar giving out specific missions (rules in the story manager limit the missions per camp)
;note: this all will seem ridiculously complicated for what we are actually presenting to the player now. But it's simpler and safer to hack this than overhail everything.

CWScript Property CWs Auto	;CW quest's CWScript

bool Property startWhiterunSiege = False Auto
{REFERENCE PROPERTY: This should be set to true on the Imperial Field CO in Whiterun, and true on the Sons Field CO in the Whiterun camp. Will cause the Whiterun siege to start of Stage 3 has been set in CW}


bool CrimeFactionSet

int CW03StageForWhiterunSiege = 100

Actor RikkeRef 
Actor GalmarRef 


Event OnLoad()
	;On load we pass some events into the story manager so we have some quests ready for the player to get from the fieldco
	
; 	CWScript.Log("CWFieldCOScript", self + "OnLoad()")

	RikkeRef = CWs.Rikke.GetActorReference()
	GalmarRef = CWs.Galmar.GetActorReference()
	
	If Self == RikkeRef || Self == GalmarRef
		CrimeFactionSet = True
	EndIf
	
	if CrimeFactionSet == False && GetEditorLocation().HasKeyword(CWs.CWCapital)   ;THIS IS SO WE CAN SET THE GENERIC FIELD COS IN THE CAPTIAL TOWNS AND CITIES
; 		CWScript.Log("CWFieldCOScript", self + "OnLoad() Editor Location has CWCapital keyword, so I'm setting my crime faction to be the hold's crime faction.")
	
		CWs.setCrimeFactionOnActorForEditorLocationsHold(self)
	
	EndIf
	
	if CWs.IsPlayerInMyFaction(self)
		
		if CWs.WarIsActive == 1 && (Self == RikkeRef || Self == GalmarRef) 
; 	;		CWScript.Log("CWFieldCOScript", self + "OnLoad() IsPlayerInMyFaction == true & calling CWScript SetFieldCOAlias()")
	;		CWs.SetFieldCOAlias(self)	;for dialogue purposes
	;		CWs.CreateMissions(CWs.GetMyCurrentHoldLocation(self), self)

		elseif CWs.WarIsActive == 0 && startWhiterunSiege && CWs.CW03.GetStageDone(CW03StageForWhiterunSiege) && CWs.WhiterunSiegeStarted == False ;I BELIEVE THIS SHOULD ONLY BE THE GENERIC FIELD CO IN WHITERUN CITY
; 			CWScript.Log("CWFieldCOScript", self + "OnLoad() IsPlayerInMyFaction == true && WarIsActive == false, CWs.CW03.GetStageDone(" + CW03StageForWhiterunSiege + ") == true,  so starting the siege at Whiterun by calling CWScript SetFieldCOAlias() and CreateMissions()")
			CWs.SetFieldCOAlias(self)	;for dialogue purposes
			CWs.WhiterunSiegeStarted = True
			CWs.CreateMissions(CWs.GetMyCurrentHoldLocation(self), self, ForceFinalSiege = true)
		
		Else
; 			CWScript.Log("CWFieldCOScript", self + "OnLoad() WarIsActive == false, not generating missions.")
			
		EndIf
	
	Else
; 		CWScript.Log("CWFieldCOScript", self + "OnLoad() IsPlayerInMyFaction == false, not generating missions.")
		
	EndIf
	
EndEvent

