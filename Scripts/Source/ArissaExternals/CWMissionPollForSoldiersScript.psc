Scriptname CWMissionPollForSoldiersScript extends Quest
{This script is used to poll for soldiers. Attach it to any CWMission where you need to set a stage when all the soldiers in a location are dead. Extends Quest.}


;**** THIS IS NOT THE BEST WAY TO DO THIS ANYMORE....
;I SHOULD GRAB THE NON-DEAD SOLDIERS IN THE ATTACK POINT INTO ALIASES, CALL RESET ON THEM, AND THEN SCRIPT THEIR DEATHS

int Property StageToStartPolling Auto		;stage after which we should be polling
Int Property StageToStopPolling Auto		;stage after which we should no longer be polling (most likely the same as StageToSet)
int Property StageToSetIfAllDead Auto		;stage we set when polling conditions are met 



;## Quests ##
Quest Property CW  Auto  
{Pointer to CW Quest}

;## Reference Aliases##
;Can be None
ReferenceAlias Property AdditionalAliasToCheck1 Auto		;in addition to dead NPCs with LocationRefType CWSoldier, we need to check if this Soldier is dead
ReferenceAlias Property AdditionalAliasToCheck2 Auto		;in addition to dead NPCs with LocationRefType CWSoldier, we need to check if this Soldier is dead
ReferenceAlias Property AdditionalAliasToCheck3 Auto		;in addition to dead NPCs with LocationRefType CWSoldier, we need to check if this Soldier is dead

;## Location Aliases ##
LocationAlias Property LocationAliasToPoll Auto			;Where should we be polling for soldiers



;## Scripts ##
;These will be assigned in the OnInit() block
CWScript Property CWs Auto hidden


Event OnInit()
	
	CWs = CW as CWScript

; 	CWScript.Log("CWMissionPollForSoldiersScript", self + ": OnInit()")
	
	;check for mandatory properties
	If !StageToStartPolling || !StageToStopPolling || !StageToSetIfAllDead || !LocationAliasToPoll
		debug.MessageBox(self + ": OnInit() WARNING: Not all of the mandatory properties have been set in the editor!!!")
; 		CWScript.Log("CWMissionPollForSoldiersScript", self + ": OnInit() WARNING: Not all of the mandatory properties have been set in the editor!!!", 2)
	EndIf
	
EndEvent


auto State NotPolling
	Event OnUpdate()
; 		CWScript.Log("CWMissionPollForSoldiersScript", self + ": State: 'NotPolling' OnUpdate()")
		
		if IsRunning() && IsCorrectStage()
			GotoState("Polling")
; 			CWScript.Log("CWMissionPollForSoldiersScript", self + ": State: 'NotPolling' sees we are in the correct stage to start polling." + StageToStartPolling + " going to State 'Polling'")
			
		Else
; 			CWScript.Log("CWMissionPollForSoldiersScript", self + ": maintaining State: 'NotPolling'")
		EndIf
		
	EndEvent

EndState

State Polling
	Event OnUpdate()
; 		CWScript.Log("CWMissionPollForSoldiersScript", self + ": State: 'Polling' OnUpdate(), polling for soldiers.")
		
		if IsRunning() && IsCorrectStage()
; 			CWScript.Log("CWMissionPollForSoldiersScript", self + ": State: 'Polling' OnUpdate(), GetAliveCountCWSoldiers()=" + GetAliveCountCWSoldiers())
			if GetAliveCountCWSoldiers() == 0
				setStage(StageToSetIfAllDead)
			EndIf
			
		Else
			GotoState("NotPolling")
; 			CWScript.Log("CWMissionPollForSoldiersScript", self + ": State: 'Polling' incorrect stage or quest not running, going to state 'NotPolling'")
			

			
		EndIf
	
	EndEvent

EndState

bool Function IsCorrectStage()
{Returns true if quest is current at a stage that is appropriate to be polling in.}
	
; 	CWScript.Log("CWMissionPollForSoldiersScript", self + ": IsCorrectStage() sees GetStage =" + GetStage() + " StageToStartPolling =" + StageToStartPolling + " StageToStopPolling =" + StageToStopPolling)
	
	if StageToStartPolling == 0 || (GetStage() >= StageToStartPolling && GetStage() < StageToStopPolling)
; 		CWScript.Log("CWMissionPollForSoldiersScript", self + ": IsCorrectStage() returning True.")
		return True
	Else
; 		CWScript.Log("CWMissionPollForSoldiersScript", self + ": IsCorrectStage() returning False.")
		return False
	EndIf

EndFunction


int Function GetAliveCountCWSoldiers()
{Returns an int based on LocationToPollIn.GetRefTypeAliveCount() + 1 per AdditionalAliasToCheckN who is alive.}

	int count = LocationAliasToPoll.GetLocation().GetRefTypeAliveCount(CWs.CWSoldier)
	
; 	CWScript.Log("CWMissionPollForSoldiersScript", self + ": GetAliveCountSoldiers(): Looking in location:" + LocationAliasToPoll.GetLocation()  + " GetRefTypeAliveCount() for type:" + CWs.CWSoldier + " returning count: " + count + ". Now checking for additional aliases being alive...")
	
	if AdditionalAliasToCheck1 != None
		if AdditionalAliasToCheck1.GetActorReference().IsDead() == False
			count += 1
		EndIf
	EndIf

	if AdditionalAliasToCheck2 != None
		if AdditionalAliasToCheck2.GetActorReference().IsDead() == False
			count += 1
		EndIf
	EndIf
	
	if AdditionalAliasToCheck3 != None
		if AdditionalAliasToCheck3.GetActorReference().IsDead() == False
			count += 1
		EndIf
	EndIf
	
; 	CWScript.Log("CWMissionPollForSoldiersScript", self + ": GetAliveCountSoldiers() returning " + count)
	
	return count
	
EndFunction


