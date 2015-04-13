Scriptname CWSiegeQuickStartScript extends Quest  

CWScript Property CWs Auto

Quest Property CWSiege Auto
Quest Property CWFortSiege Auto
{POINTS TO CWFortSiegeCapital}

Quest Property CWFinale Auto

Quest Property C00GiantAttack Auto

ReferenceAlias Property CWFinaleLeaderAlias Auto


{pointer to Leader alias in CWFinale}

function QuickStartSiege(int Hold, int Attacker, int PlayerAllegiance, int CWDebugOn = 1, bool IsMinorHold = false, bool QuickStartFinale = false)

; 	CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Hold=" + Hold + ", Attacker =" + Attacker + ", PlayerAllegiance =" + PlayerAllegiance + ", CWDebugOn =" + CWDebugOn)
	
	Location HoldLocation = CWs.getLocationForHold(Hold)
	ObjectReference FieldCO

	while CWs.Init == 0
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Waiting for CWs.Init != 0")	
		Utility.Wait(1)
	EndWhile
	
; 	CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() setting debug vars")	

	CWs.debugOn.SetValue(CWDebugOn)

; 	CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() calling Stop on CW00a/b")		
	CWs.CW00A.Stop()
	CWs.CW00B.Stop()
	CWs.CW01A.Stop()
	CWs.CW01B.Stop()

; 	CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() MakeHadvarAndRalofPotentialAllies()")
	CWs.CWAlliesS.MakeHadvarAndRalofPotentialAllies()
	
; 	CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() starting Civil War by calling CWs.SetStage(PlayerAllegiance); PlayerAllegiance=" + PlayerAllegiance)	
	CWs.setStage(PlayerAllegiance)

; 	CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() checking hold ownership")
	if HoldLocation.GetKeywordData(CWs.CWOwner) == Attacker
	
		int defender = CWs.GetOppositeFactionInt(Attacker)
		
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() hold is owned by Attacker, will setKeywordData on CWOwner keyword on HoldLocation to be owned by the defender so that set owner functions will work.")
		HoldLocation.SetKeywordData(CWs.CWOwner, defender)
		
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() hold is owned by Attacker, will call setOwner to give capital to the other side")
		CWs.SetOwner(CWs.GetCapitalLocationForHold(HoldLocation), defender)

; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() hold is owned by Attacker, wcall setOwner on attackers camp to make sure it's turned on for the quick start")		
		
		
		CWs.SetOwner(CWs.GetCampLocationForHold(HoldLocation, attacker), attacker)
		
	Else
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() hold is owned by Defender, so no additional setupRequired")
		
	EndIf

	if Hold == 4
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Hold is whiterun, enabling the field co - setting stage 100 in CW03 and then stopping the quest")
		CWs.CW03.SetStage(100)
		CWs.CW03.Stop()
	
	EndIf
	
	
	if Attacker == PlayerAllegiance
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Player is Attacking, getting Camp Field CO")
		FieldCO = CWs.GetReferenceCampFieldCOForHold(HoldLocation, PlayerAllegiance)

	Else
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Player is Defending, getting HQ Field CO")
		FieldCO = CWs.GetReferenceHQFieldCOForHold(HoldLocation, PlayerAllegiance)
		
	EndIf
	
; 	CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() starting siege by calling CWs.CreateMissions()")
	CWs.CreateMissions(CWs.GetLocationForHold(hold), FieldCO, ForceFinalSiege = true, CampaignStartMarker = FieldCO)
	
	while (IsMinorHold == false && CWSiege.IsRunning() == False) || (IsMinorHold == True && CWFortSiege.IsRunning() == False)	;NOTE when I duplicate CWFortSiege into two quests, I may need to change this.
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Waiting for CWSiege.IsRunning() == true")	
		utility.Wait(1)
	EndWhile
	
; 	CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Moving player to FieldCO:" + FieldCO)	
	
	Game.GetPlayer().MoveTo(FieldCO)

	;copied this from the result script of CO dialogue since that can't be said anymore but by Galmar
	if CWs.GetStageDone(50) == false
		CWs.setStage(50)
		CWs.CW03.SetStage(210)
		CWs.CWSiegeS.SetStage(1)
	Endif
	
	if QuickStartFinale

; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() QuickStartFinale == True, waiting for Siege stage 1 to complete, CWFortSiege stage 10 to complete, and CWFinale to be running, then will intiate finale and move player inside")	
		
			
		while CWSiege.GetStageDone(1) == 0 || CWFortSiege.GetStageDone(10) == 0 || CWFinale.IsRunning() == false
			utility.wait(1)
; 			CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Waiting for CWSiege Stage 1, CWFortSiege Stage 10, AND CWFinale.IsRunning()", 1)
		
		EndWhile
		
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() calling CWFinale SetStage(10) to start the finale objectives")
		
		CWFinale.SetStage(10)
		
		while CWFinale.GetStageDone(10) == 0
			utility.wait(1)
; 			CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Waiting for CWFinale Stage 10", 1)
		
		EndWhile
		
; 		CWScript.Log("CWSiegeQuickStartScript",  "QuickStartSiege() Moving player to  Leader alias")
		Game.GetPlayer().Moveto(CWFinaleLeaderAlias.GetReference())
		
		
		
	endif
	
EndFunction

ObjectReference Property AelaTheHuntressREF  Auto  

objectreference Property FarkasRef  Auto  

objectreference Property AthisRef  Auto  

objectreference Property RiaRef  Auto  

ReferenceAlias Property CWSiegeMainGateExterior  Auto  

Quest Property MQ103  Auto  

ObjectReference Property C00GiantREF  Auto  

ObjectReference Property RunilREF  Auto  
