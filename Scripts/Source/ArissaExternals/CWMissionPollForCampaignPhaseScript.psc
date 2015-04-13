Scriptname CWMissionPollForCampaignPhaseScript extends Quest
{Checks to make sure this missions belongs to the current Campaign and Campaign Phase, otherwise it shuts it down.}

;## Quests ##
Quest Property CW  Auto  
Quest Property CWCampaign  Auto  

;## Scripts ##
;These will be assigned in the OnInit() block
CWScript Property CWs Auto hidden
CWCampaignScript Property CWCampaignS Auto hidden
CWMissionScript Property MyMissionS auto Hidden

Event OnInit()
	
	CWs = CW as CWScript
	CWCampaignS = CWCampaign as CWCampaignScript
	
	myMissionS = (Self as Quest) as CWMissionScript
	
; 	CWScript.Log("CWMissionPollForCampaignPhaseScript", self + ": OnInit()", 0 , true, true)
	
EndEvent

auto State NotPolling
	Event OnUpdate()
; 		CWScript.Log("CWMissionPollForCampaignPhaseScript", self + ": State: 'NotPolling' OnUpdate(), doing nothing.")
	EndEvent

EndState

State Polling
	Event OnUpdate()
; 		CWScript.Log("CWMissionPollForCampaignPhaseScript", self + ": State: 'Polling' OnUpdate().")
		
		if  ((self as Quest) as CWMission00Script) && CWs.TutorialMissionComplete == 0
; 				CWScript.Log("CWMissionPollForCampaignPhaseScript", self + "is a CWMission00 quest and CWScript TutorialMissionComplete == 0, so we are ignoring the test for CampaignPhase because the tutorial missions should stay active for the whole campaign.")
		
		Else	;not a tutorial missions, or player is finished with tutorial:
			if myMissionS.CampaignPhase != CWCampaignS.CWCampaignPhase.value as Int
; 				CWScript.Log("CWMissionPollForCampaignPhaseScript", self + "CampaignPhase(" + myMissionS.CampaignPhase + ") !=  CWCampaignPhase (" + CWCampaignS.CWCampaignPhase.value + ") so we are stopping mission quest.")
				StopPolling()
				KillMissionQuest()
			ElseIf myMissionS.CountCampaigns != CWs.CountCampaigns
; 				CWScript.Log("CWMissionPollForCampaignPhaseScript", self + "Local CountCampaigns(" + myMissionS.CountCampaigns + ") !=  CW.CountCampaigns (" + CWs.CountCampaigns + ") so we are stopping mission quest.")
				StopPolling()
				KillMissionQuest()		
			Else
; 				CWScript.Log("CWMissionPollForCampaignPhaseScript", self + "CampaignPhase(" + myMissionS.CampaignPhase + ") ==  CWCampaignPhase (" + CWCampaignS.CWCampaignPhase.value + "). And local CountCampaigns(" + myMissionS.CountCampaigns + ") ==  CW.CountCampaigns (" + CWs.CountCampaigns + "). Do nothing and continue polling.")
			EndIf
			
		EndIf
		
	EndEvent

EndState


Function StartPolling()
	GoToState("Polling")
EndFunction

Function StopPolling()
	GoToState("NotPolling")
EndFunction

Function KillMissionQuest()
; 	CWScript.Log("CWMissionPollForCampaignPhaseScript", self + ": KillMissionQuest()")
	UnregisterForUpdate()	;should happen in shutdown stage, but there is currently a bug with quest stage fragements not firing before quest shuts down
	Stop()

EndFunction
