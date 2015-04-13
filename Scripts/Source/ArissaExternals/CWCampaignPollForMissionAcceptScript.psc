Scriptname CWCampaignPollForMissionAcceptScript extends Quest 


;## Quests ##
Quest Property CW  Auto  
Quest Property CWCampaign  Auto  

;## Scripts ##
;These will be assigned in the OnInit() block
CWScript Property CWs Auto hidden
CWCampaignScript Property CWCampaignS Auto hidden


Event OnInit()
	
; 	CWScript.Log("CWCampaignPollForMissionAcceptScript" , " OnInit()", 0, True, True)
	
	CWs = CW as CWScript
	CWCampaignS = CWCampaign as CWCampaignScript
	
	registerForUpdate(5)
EndEvent

auto State NotPolling
	Event OnUpdate()
; 		CWScript.Log("CWCampaignPollForMissionAcceptScript" , " State: 'NotPolling' OnUpdate(), doing nothing." )
	EndEvent

EndState

State Polling
	Event OnUpdate()
; 		CWScript.Log("CWCampaignPollForMissionAcceptScript" , " State: 'Polling' OnUpdate(), polling for quest acceptance or GameDaysPassed > NextPhaseDay." )
		
		if CWCampaignS.AcceptedMission > 0
; 			CWScript.Log("CWCampaignPollForMissionAcceptScript" , " State: 'Polling' See's AcceptedMission > 0, going to State 'NotPolling'" )
			StopPolling()
		
		Elseif CWs.GameDaysPassed.value > CWCampaignS.NextPhaseDay
; 			CWScript.Log("CWCampaignPollForMissionAcceptScript" , "  State: 'Polling' sees that GameDaysPassed(" + CWs.GameDaysPassed.value + ") > NextPhaseDay(" + CWCampaignS.NextPhaseDay + "), stopping polling, and calling AdvanceCampaignPhase()" )
			StopPolling()
			CWCampaignS.AdvanceCampaignPhase()	;this will among other things set AcceptedMission to 0
			
		Else
; 			CWScript.Log("CWCampaignPollForMissionAcceptScript" , " State: 'Polling' sees that GameDaysPassed(" + CWs.GameDaysPassed.value + ") < NextPhaseDay(" + CWCampaignS.NextPhaseDay + "), will keep polling." )

		EndIf
		
	EndEvent

EndState


Function StartPolling()
	GoToState("Polling")
EndFunction

Function StopPolling()
	GoToState("NotPolling")
EndFunction

