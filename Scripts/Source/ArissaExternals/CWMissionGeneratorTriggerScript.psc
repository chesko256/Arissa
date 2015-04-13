Scriptname CWMissionGeneratorTriggerScript extends ObjectReference  

;This script controls creating the missions... this used to be done by CWFieldCOSCript and in the case of the whiterun attack I think it still is.
;This script is attached to activators that are enable parented in the various camps where you can get missions
;This is because the fieldcos are now Galmar/Rikke, you might walk with them all the way there, in which case their onload event won't trigger, and I need to pass something in that is from the correct hold

CWScript Property CW Auto
Actor Property RikkeRef Auto
Actor Property GalmarRef Auto

Keyword Property CWCampImperial Auto
Keyword Property CWCampSons Auto

Keyword Property CWLinkFieldCOEnable Auto	;keyword on linked ref to generate field co so we can enable disable him as appropriate when Rikke/Galmar is present or not

ObjectReference Property myEnableMarker Auto
{REFERENCE PROPERTY: Pointer to the enable marker in the camp, checks to make sure that's enabled before enabling the genreic fieldco}


Event OnCellAttach()

; 	CWScript.Log("CWMissionGeneratorTriggerScript", self + "OnCellAttach()")
	
	Location myLocation = GetEditorLocation()
	Location myHoldLocation = CW.GetMyCurrentHoldLocation(self)
	ObjectReference myLinkedFieldCO = GetLinkedRef(CWLinkFieldCOEnable)
	
	Actor RikkeOrGalmar
	
	if myLocation.HasKeyword(CWCampImperial)
; 		CWScript.Log("CWMissionGeneratorTriggerScript", self + "OnCellAttach() in location with keyword CWCampImperial trying to starting Imperial missions")
		RikkeOrGalmar = RikkeRef

	ElseIf myLocation.HasKeyword(CWCampSons)
; 		CWScript.Log("CWMissionGeneratorTriggerScript", self + "OnCellAttach() in location with keyword CWCampSons trying to starting Sons missions")
		RikkeOrGalmar = GalmarRef
	
	Else
; 		CWScript.Log("CWMissionGeneratorTriggerScript", self + " WARNING: OnCellAttach() in location with NEITHER CWCampImperial nor CWCampSons!", 2, True, True)
		
	EndIf

	if  RikkeOrGalmar

		if RikkeOrGalmar.GetCurrentLocation() == myLocation || myEnableMarker.IsDisabled() == true
			myLinkedFieldCO.disable()
			
		Elseif myEnableMarker.IsDisabled() == False
			myLinkedFieldCO.enable()
			
		EndIf
		
		CW.SetFieldCOAlias(RikkeOrGalmar)	;for dialogue purposes
		CW.CreateMissions(myHoldLocation, RikkeOrGalmar, CampaignStartMarker = Self)
	

	
	EndIf
	
EndEvent

