Scriptname CWResetGarrisonScript extends Quest  

;This quest gets started with a StoryManager event called from a keyword in CWResetScript attached to CWReset quest.

;These are properties set on the quest in the editor


;## Reference Aliases ##

ReferenceAlias Property Soldier01 auto
ReferenceAlias Property Soldier02 auto
ReferenceAlias Property Soldier03 auto
ReferenceAlias Property Soldier04 auto
ReferenceAlias Property Soldier05 auto
ReferenceAlias Property Soldier06 auto
ReferenceAlias Property Soldier07 auto
ReferenceAlias Property Soldier08 auto
ReferenceAlias Property Soldier09 auto
ReferenceAlias Property Soldier10 auto
ReferenceAlias Property Soldier11 auto
ReferenceAlias Property Soldier12 auto
ReferenceAlias Property Soldier13 auto
ReferenceAlias Property Soldier14 auto
ReferenceAlias Property Soldier15 auto
ReferenceAlias Property Soldier16 auto
ReferenceAlias Property Soldier17 auto
ReferenceAlias Property Soldier18 auto
ReferenceAlias Property Soldier19 auto
ReferenceAlias Property Soldier20 auto
ReferenceAlias Property Soldier21 auto
ReferenceAlias Property Soldier22 auto
ReferenceAlias Property Soldier23 auto
ReferenceAlias Property Soldier24 auto
ReferenceAlias Property Soldier25 auto
ReferenceAlias Property Soldier26 auto
ReferenceAlias Property Soldier27 auto
ReferenceAlias Property Soldier28 auto
ReferenceAlias Property Soldier29 auto
ReferenceAlias Property Soldier30 auto
ReferenceAlias Property Soldier31 auto
ReferenceAlias Property Soldier32 auto
ReferenceAlias Property Soldier33 auto
ReferenceAlias Property Soldier34 auto
ReferenceAlias Property Soldier35 auto
ReferenceAlias Property Soldier36 auto
ReferenceAlias Property Soldier37 auto
ReferenceAlias Property Soldier38 auto
ReferenceAlias Property Soldier39 auto
ReferenceAlias Property Soldier40 auto
ReferenceAlias Property Soldier41 auto
ReferenceAlias Property Soldier42 auto
ReferenceAlias Property Soldier43 auto
ReferenceAlias Property Soldier44 auto
ReferenceAlias Property Soldier45 auto
ReferenceAlias Property Soldier46 auto
ReferenceAlias Property Soldier47 auto
ReferenceAlias Property Soldier48 auto
ReferenceAlias Property Soldier49 auto
ReferenceAlias Property Soldier50 auto
ReferenceAlias Property Soldier51 auto
ReferenceAlias Property Soldier52 auto
ReferenceAlias Property Soldier53 auto
ReferenceAlias Property Soldier54 auto
ReferenceAlias Property Soldier55 auto
ReferenceAlias Property Soldier56 auto
ReferenceAlias Property Soldier57 auto
ReferenceAlias Property Soldier58 auto
ReferenceAlias Property Soldier59 auto
ReferenceAlias Property Soldier60 auto
ReferenceAlias Property Soldier61 auto
ReferenceAlias Property Soldier62 auto
ReferenceAlias Property Soldier63 auto
ReferenceAlias Property Soldier64 auto

;## Quests ##
Quest Property CW Auto  
Quest Property CWCampaign Auto  

;## Location Aliases ##
LocationAlias Property Garrison Auto

;## Locations ##
location Property HaafingarHoldLocation Auto		
location Property ReachHoldLocation Auto			
location Property HjaalmarchHoldLocation Auto		
location Property WhiterunHoldLocation Auto		
location Property FalkreathHoldLocation Auto
location Property PaleHoldLocation Auto			
location Property WinterholdHoldLocation Auto		
location Property EastmarchHoldLocation Auto		
location Property RiftHoldLocation Auto			

;## Factions ##
faction Property CrimeFactionHaafingar Auto		
faction Property CrimeFactionReach Auto			
faction Property CrimeFactionHjaalmarch Auto		
faction Property CrimeFactionWhiterun Auto			
faction Property CrimeFactionFalkreath Auto		
faction Property CrimeFactionPale Auto				
faction Property CrimeFactionWinterhold Auto		
faction Property CrimeFactionEastmarch Auto		
faction Property CrimeFactionRift Auto	 	

faction Property GuardFactionImperial Auto	 	
faction Property GuardFactionSons Auto	 	

;## Scripts ##
;These will be assigned in the OnInit() block
CWScript Property CWs Auto hidden
CWCampaignScript Property CWCampaignS Auto hidden


;## Variables ##
bool property WaitingForCallBackFromCWGovernment auto hidden	




Event OnInit()
	
	CWs = CW as CWScript
	CWCampaignS = CWCampaign as CWCampaignScript

; 	CWScript.Log("CWResetGarrisonScript", self + " OnInit()")
	
EndEvent

function ToggleEnableMarkers(ReferenceAlias EnableMarkerImperial, ReferenceAlias EnableMarkerSons, ReferenceAlias EnableMarkerImperialExterior = None, ReferenceAlias EnableMarkerSonsExterior = None, ReferenceAlias EnableMarkerMonster = None)
{Toggles the enable markers for either the Imperials or the Sons enabling the owning faction's enable marker, and disabling the other.}

; 	CWScript.Log("CWResetGarrisonScript", self + " ToggleEnableMarkers() started")

	Location GarrisonLoc = Garrison.GetLocation()
	int Owner = Math.ABS(GarrisonLoc.GetKeywordData(CWs.CWOwner) as Int) as Int
	
	ObjectReference ImperialEnableMarker = EnableMarkerImperial.GetReference()
	ObjectReference SonsEnableMarker = EnableMarkerSons.GetReference()
	ObjectReference ImperialEnableExteriorMarker = EnableMarkerImperialExterior.GetReference()
	ObjectReference SonsEnableExteriorMarker = EnableMarkerSonsExterior.GetReference()
	ObjectReference EnableMarkerMonsterMarker = EnableMarkerMonster.GetReference()
		
	
	If  Owner == CWs.iImperials
; 		CWScript.Log("CWResetGarrisonScript", self + " ToggleEnableMarkers() enabling "+ ImperialEnableMarker + ", "  + ImperialEnableExteriorMarker + ", and Disabling " + SonsEnableMarker +  ", " + SonsEnableExteriorMarker)

		if ImperialEnableMarker != None
			ImperialEnableMarker.Enable()
		EndIf
		
		if ImperialEnableExteriorMarker != None
			ImperialEnableExteriorMarker.Enable()
		EndIf
				
		if SonsEnableMarker != None
			SonsEnableMarker.Disable()
		EndIf
				
		if SonsEnableExteriorMarker != None
			SonsEnableExteriorMarker.Disable()
		EndIf
		
	ElseIf Owner == CWs.iSons
; 		CWScript.Log("CWResetGarrisonScript", self + " ToggleEnableMarkers() enabling " + SonsEnableMarker + "," + SonsEnableExteriorMarker + ", and Disabling " + ImperialEnableMarker + ", " + ImperialEnableExteriorMarker)
	
	
		if ImperialEnableMarker != None
			ImperialEnableMarker.Disable()
		EndIf
		
		if ImperialEnableExteriorMarker != None
			ImperialEnableExteriorMarker.Disable()
		EndIf
				
		if SonsEnableMarker != None
			SonsEnableMarker.Enable()
		EndIf
				
		if SonsEnableExteriorMarker != None
			SonsEnableExteriorMarker.Enable()
		EndIf

	
	ElseIf Owner == CWs.iBothFactions
; 		CWScript.Log("CWResetGarrisonScript", self + " ToggleEnableMarkers() Garrison is owned by both factions, so assumes enable markers have been enabled/disabled elsewhere (for example, for Patrols in CWCampaignScript)")

	EndIf

	if EnableMarkerMonsterMarker != None
; 		CWScript.Log("CWResetGarrisonScript", self + " ToggleEnableMarkers() Disabling EnableMarkerMonster(" + EnableMarkerMonsterMarker + ")")

		EnableMarkerMonsterMarker.Disable()
	EndIf
	
; 	CWScript.Log("CWResetGarrisonScript", self + " ToggleEnableMarkers() finished")
	
EndFunction

function ProcessIfCamp(ReferenceAlias EnableMarkerImperials, ReferenceAlias EnableMarkerSons)
{Checks to see if Garrison is a camp location, if it is, make sure that faction is attacking, otherwise disable it}
	
	Location GarrisonLoc = Garrison.GetLocation()	
	
	if GarrisonLoc.HasKeyword(CWs.CWCampImperial) || GarrisonLoc.HasKeyword(CWs.CWCampSons)

		Location ParentHoldLoc = CWs.GetMyParentHoldLocation(GarrisonLoc)
		int Owner = CWs.GetOwner(ParentHoldLoc)
		
		if GarrisonLoc.HasKeyword(CWs.CWCampImperial)
		
			if Owner == CWs.iImperials
; 				CWScript.Log("CWResetGarrisonScript", self + " ProcessIfCamp() Garrison is CWCampImperial but Imperials own the hold, so disabling camp.)")
				EnableMarkerImperials.GetReference().Disable()
				
			Elseif Owner == CWs.iSons
; 				CWScript.Log("CWResetGarrisonScript", self + " ProcessIfCamp() Garrison is CWCampImperial but Sons own the hold, so enabeling camp.)")
				EnableMarkerImperials.GetReference().Enable()
			
			EndIf

		elseif	GarrisonLoc.HasKeyword(CWs.CWCampSons)

			If Owner == CWs.iSons
; 				CWScript.Log("CWResetGarrisonScript", self + " ProcessIfCamp() Garrison is CWCampSons  but Sons own the hold, so disabling camp.)")
				EnableMarkerSons.GetReference().Disable()
				
			Elseif Owner == CWs.iImperials
; 				CWScript.Log("CWResetGarrisonScript", self + " ProcessIfCamp() Garrison is CWCampSons  but Imperials own the hold, so enabling camp.)")
				EnableMarkerSons.GetReference().Enable()
			
			
			EndIf
			
		EndIf
	
	EndIf
EndFunction

bool function ProcessSoldierAlias(ReferenceAlias SoldierAlias)
{Kill if disabled, reset if enabled.}	
	Actor Soldier = SoldierAlias.GetActorReference()
		
	if Soldier != None
		if Soldier.IsDisabled()
; 			CWScript.Log("CWResetGarrisonScript", self + " ProcessSoldierAlias() SoldierAlias(" + SoldierAlias + ") is disabled, killing: " + Soldier)
			Soldier.Kill()
		Else
; 			CWScript.Log("CWResetGarrisonScript", self + " ProcessSoldierAlias() SoldierAlias(" + SoldierAlias + ") is enabled, resetting reference, and setting up crime faction for: " + Soldier)
		
			Soldier.Reset()	;this needs to happen BEFORE we change his crime group so the Reset() doesn't overwrite it
			SetCrimeFactionForSoldierAlias(SoldierAlias)
			
		EndIf
	
		return True
		
	Else
; 		CWScript.Log("CWResetGarrisonScript", self + " ProcessSoldierAlias() SoldierAlias(" + SoldierAlias + ") is empty, doing nothing.")
		return False
	EndIf
	
EndFunction

function ProcessSoldierAliases()
{Calls ProcessSolderAlias on all of the SoldierX aliases, until it finds one that is empty, then it stops.}

	if !ProcessSoldierAliases1()
		Return
	elseif	!ProcessSoldierAliases2()
		Return
	elseif	!ProcessSoldierAliases3()
		Return
	elseif	!ProcessSoldierAliases4()
		Return
	elseif	!ProcessSoldierAliases5()
		Return
	elseif	!ProcessSoldierAliases6()
		Return
	EndIf

EndFunction

bool function ProcessSoldierAliases1()
	if !ProcessSoldierAlias(Soldier01)
		return false
	elseif !ProcessSoldierAlias(Soldier02)
		return false
	elseif !ProcessSoldierAlias(Soldier03)
		return false
	elseif !ProcessSoldierAlias(Soldier04)
		return false
	elseif !ProcessSoldierAlias(Soldier05)
		return false
	elseif !ProcessSoldierAlias(Soldier06)
		return false
	elseif !ProcessSoldierAlias(Soldier07)
		return false
	elseif !ProcessSoldierAlias(Soldier08)
		return false
	elseif !ProcessSoldierAlias(Soldier09)
		return false
	elseif !ProcessSoldierAlias(Soldier10)
		return false
	Else
		return True
	EndIf
EndFunction

bool Function ProcessSoldierAliases2()
	if !ProcessSoldierAlias(Soldier11)
		return false
	elseif !ProcessSoldierAlias(Soldier12)
		return false
	elseif !ProcessSoldierAlias(Soldier13)
		return false
	elseif !ProcessSoldierAlias(Soldier14)
		return false
	elseif !ProcessSoldierAlias(Soldier15)
		return false
	elseif !ProcessSoldierAlias(Soldier16)
		return false
	elseif !ProcessSoldierAlias(Soldier17)
		return false
	elseif !ProcessSoldierAlias(Soldier18)
		return false
	elseif !ProcessSoldierAlias(Soldier19)
		return false
	elseif !ProcessSoldierAlias(Soldier20)
		return false
	Else
		return True	
	EndIf
EndFunction

bool Function ProcessSoldierAliases3()
	if !ProcessSoldierAlias(Soldier21)
		return false
	elseif !ProcessSoldierAlias(Soldier22)
		return false
	elseif !ProcessSoldierAlias(Soldier23)
		return false
	elseif !ProcessSoldierAlias(Soldier24)
		return false
	elseif !ProcessSoldierAlias(Soldier25)
		return false
	elseif !ProcessSoldierAlias(Soldier26)
		return false
	elseif !ProcessSoldierAlias(Soldier27)
		return false
	elseif !ProcessSoldierAlias(Soldier28)
		return false
	elseif !ProcessSoldierAlias(Soldier29)
		return false
	elseif !ProcessSoldierAlias(Soldier30)
		return false
	Else
		return True
	EndIf
EndFunction

bool Function ProcessSoldierAliases4()		
	if !ProcessSoldierAlias(Soldier31)
		return false
	elseif !ProcessSoldierAlias(Soldier32)
		return false
	elseif !ProcessSoldierAlias(Soldier33)
		return false
	elseif !ProcessSoldierAlias(Soldier34)
		return false
	elseif !ProcessSoldierAlias(Soldier35)
		return false
	elseif !ProcessSoldierAlias(Soldier36)
		return false
	elseif !ProcessSoldierAlias(Soldier37)
		return false
	elseif !ProcessSoldierAlias(Soldier38)
		return false
	elseif !ProcessSoldierAlias(Soldier39)
		return false
	elseif !ProcessSoldierAlias(Soldier40)
		return false
	Else
		return True		
	EndIf
EndFunction

bool Function ProcessSoldierAliases5()		
	if !ProcessSoldierAlias(Soldier41)
		return false
	elseif !ProcessSoldierAlias(Soldier42)
		return false
	elseif !ProcessSoldierAlias(Soldier43)
		return false
	elseif !ProcessSoldierAlias(Soldier44)
		return false
	elseif !ProcessSoldierAlias(Soldier45)
		return false
	elseif !ProcessSoldierAlias(Soldier46)
		return false
	elseif !ProcessSoldierAlias(Soldier47)
		return false
	elseif !ProcessSoldierAlias(Soldier48)
		return false
	elseif !ProcessSoldierAlias(Soldier49)
		return false
	elseif !ProcessSoldierAlias(Soldier50)
		return false
	Else
		return true
	EndIf
EndFunction

bool Function ProcessSoldierAliases6()		
	if !ProcessSoldierAlias(Soldier51)
		return false
	elseif !ProcessSoldierAlias(Soldier52)
		return false
	elseif !ProcessSoldierAlias(Soldier53)
		return false
	elseif !ProcessSoldierAlias(Soldier54)
		return false
	elseif !ProcessSoldierAlias(Soldier55)
		return false
	elseif !ProcessSoldierAlias(Soldier56)
		return false
	elseif !ProcessSoldierAlias(Soldier57)
		return false
	elseif !ProcessSoldierAlias(Soldier58)
		return false
	elseif !ProcessSoldierAlias(Soldier59)
		return false
	elseif !ProcessSoldierAlias(Soldier60)
		return false
	elseif !ProcessSoldierAlias(Soldier61)
		return false
	elseif !ProcessSoldierAlias(Soldier62)
		return false
	elseif !ProcessSoldierAlias(Soldier63)
		return false
	elseif !ProcessSoldierAlias(Soldier64)
		return false
	Else
		return True
	endif
EndFunction


Function SetCrimeFactionForSoldierAlias(ReferenceAlias AliasToSet)
{Calls SetCrimeFactionForSoldierActor() passing the actor reference in AliasToSet}

; 	CWScript.Log("CWResetGarrisonScript", self + " SetCrimeFactionForSoldierAlias() Calling SetCrimeFactionForSoldierActor for AliasToSet:" + AliasToSet)

	SetCrimeFactionForSoldierActor(AliasToSet.GetActorReference())

EndFunction	

function SetCrimeFactionForSoldierActor(Actor ActorToSet)
{Sets the appropriate crime group for the actor}

; 	CWScript.Log("CWResetGarrisonScript", self + " SetCrimeFactionForSoldierActor(" + ActorToSet + ") Calling CWs.DetermineAndSetCrimeFactionForSoldierActor()")

	CWs.DetermineAndSetCrimeFactionForSoldierActor(ActorToSet)
	
	
EndFunction




Function SetOwnershipKeywordData()
{Sets the CWOwner keyword data to the absolute value (ie make it positive)}
	
	;Note: this whole negative value means need to reset and positive value means done resetting is a hold over from how I was doing it in the old scripting language... but it's been an assumption for so long now, that I'm keeping it that way for the time being... but when I do a clean up pass on the scripts, I might want to remove that aspect.

	;I'm no longer using negative value, but it doesn't hurt to leave this doing this anyway.
	
	Location GarrisonLoc = Garrison.GetLocation()
	int AbsValue = Math.ABS(GarrisonLoc.GetKeywordData(CWs.CWOwner) as Int) as Int
	
	GarrisonLoc.SetKeywordData(CWs.CWOwner, AbsValue)
		
EndFunction

Function StartCWGovernmentQuestIfCapital()
{If Garrison is a capital, start the CWGovernment quest so it sets up the ruling NPCs properly.}
	float timeSpentWaiting
	Location GarrisonLoc = Garrison.GetLocation()
	
	if GarrisonLoc.HasKeyword(CWs.CWCapital)
; 		CWScript.Log("CWResetGarrisonScript", self + " StartCWGovernmentQuestIfCapital() is starting story event CWGovernmentStart.SendStoryEvent() with a location param of: " + GarrisonLoc)

		
		WaitingForCallBackFromCWGovernment = True
		
		CWs.CWGovernmentStart.SendStoryEvent(GarrisonLoc)
		
		while WaitingForCallBackFromCWGovernment
			;do nothing
			utility.wait(1)
			timeSpentWaiting += 1
; 			CWScript.Log("CWResetGarrisonScript", self + "StartCWGovernmentQuestIfCapital() waiting for WaitingForCallBackFromCWGovernment == true. TimeSpentWaiting:" + TimeSpentWaiting )
		
		endwhile
	
	Else
; 		CWScript.Log("CWResetGarrisonScript", self + " StartCWGovernmentQuestIfCapital() garrison is NOT a capital, so doing nothing: " + GarrisonLoc)
	
	EndIf
	
EndFunction
