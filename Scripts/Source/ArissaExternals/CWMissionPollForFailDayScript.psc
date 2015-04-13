Scriptname CWMissionPollForFailDayScript extends Quest

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
	
; 	CWScript.Log("CWMissionPollForFailDayScript", self + ": OnInit()")
	
EndEvent

auto State NotPolling
	Event OnUpdate()
; 		CWScript.Log("CWMissionPollForFailDayScript", self + ": State: 'NotPolling' OnUpdate(), doing nothing.")
	EndEvent

EndState

State Polling
	Event OnUpdate()
; 		CWScript.Log("CWMissionPollForFailDayScript", self + ": State: 'Polling' OnUpdate().")

		if myMissionS.failDay == 0 	;this should happen in stage 10 of CWMissionX quest, but just in case
			myMissionS.SetMissionFailDay()
		
		Elseif myMissionS.failDay < CWs.GameDaysPassed.value
; 			CWScript.Log("CWMissionPollForFailDayScript", self + ":  FailDay(" + myMissionS.failDay + ") < GameDaysPassed (" + CWs.GameDaysPassed.value + ") so we are failing mission quest.")
			StopPolling()
			FailMissionQuest()
		
		Else
; 			CWScript.Log("CWMissionPollForFailDayScript", self + ":  FailDay(" + myMissionS.failDay + ") >= GameDaysPassed (" + CWs.GameDaysPassed.value + "). Do nothing and continue polling.")
	
		EndIf
		
	EndEvent

EndState


Function StartPolling()		;usually called in CWMission quest's stage 10
	GoToState("Polling")
EndFunction

Function StopPolling()
	GoToState("NotPolling")
EndFunction

Function FailMissionQuest()

	if GetStage() < 205
		SetStage(205)	;fails Quest
	EndIf

EndFunction

