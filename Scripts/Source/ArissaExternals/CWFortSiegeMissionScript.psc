Scriptname CWFortSiegeMissionScript extends CWMissionScript  
{Extends CWMissionScript which extends quest.}

Keyword Property CWFortSiegeSpecialStart Auto		;this is the keyword used to start the CWFortSiege quest not for a normal fort battle. For example, the final battle in Solitude and Windhelm's fighting inside the city uses this system.
Keyword Property CWFortSiegeMinorCapitalStart auto


int Property SpecialNonFortSiege Auto hidden Conditional
int Property SpecialCapitalResolutionFortSiege Auto hidden Conditional


Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
 
; 	CWScript.Log("CWFortSiegeMissionScript", "OnStoryScript() Calling Parent's (CWMissionScript) OnStoryScript() event so we make sure we run that as well.")

	Parent.OnStoryScript(akKeyword, akLocation, akRef1, akRef2, aiValue1, aiValue2)
 
	if akKeyword == CWFortSiegeSpecialStart
; 		CWScript.Log("CWFortSiegeMissionScript", "OnStoryScript() sees akKeyword == CWFortSiegeSpecialStart which means this is a special non-fort siege. Setting SpecialNonFortSiege to 1.")
		SpecialNonFortSiege = 1
		
	Elseif akKeyword == CWFortSiegeMinorCapitalStart
; 		CWScript.Log("CWFortSiegeMissionScript", "OnStoryScript() sees akKeyword == CWFortSiegeMinorCapitalStart which means this is a special non-fort siege. Setting SpecialCapitalResolutionFortSiege to 1.")
		SpecialCapitalResolutionFortSiege = 1
	
	EndIf
	
	SetStage(0)
	
 EndEvent
 
 