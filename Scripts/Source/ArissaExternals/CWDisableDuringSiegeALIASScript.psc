Scriptname CWDisableDuringSiegeALIASScript extends ReferenceAlias  
{Put on objects that you need to disable and then reenable during sieges that are happening in it's current location.}

;*** THIS IS NEARLY INDENTICAL TO CWDisableDuringSiegeScript -- ANY CHANGES HERE SHOULD BE REFLECTED IN THAT SCRIPT AS WELL!!! ***

CWScript property CW Auto
{Pointer to CWScript attached to CW quest}

GlobalVariable Property AllowDisablingGlobal Auto
{Optional. if this is provided, this global needs to be TRUE for this script to be allowed to disable this object.}


Quest Property ControllingQuest Auto
{If you are looking at disabling only during certain stages, this is the quest whose stages you are looking at. If this is not set, it will ALWAYS disable the object while the siege is running in it's current location.}

int Property ControllingQuestStageToAllowDisable Auto
{Default: = 0. At what stage should we start allowing this object to be disabled?}

int Property ControllingQuestStageToStopAllowingDisable = 9999 Auto
{Default: = 9999. At what stage should we stop allowing this object to be disabled?}

bool Property RequireControllingQuestToBeRunning = false Auto
{Default: False. Does the ControllingQuest need to be running to enable/disable?}

Quest Property SecondaryQuest Auto
{Secondary Quest you want to look at}

bool Property RequireSecondaryQuestToBeRunning = False Auto
{Default: False. Does the SecondaryQuest need to be running to enable/disable?}

Location Property myVirtualLocation  Auto
{If this is set, and the siege is happening in this location, disable the actor as if he was actually in this location}

bool Property RequireSiegeQuestToBeAccepted = true Auto
{Default: true; Requires the player to be actively on the siege quest, not just that it's running... defined by stage 1 having been done.}

Event OnCellLoad()

	Actor selfAsActor = GetActorReference()

	if RequireControllingQuestToBeRunning && ControllingQuest.IsRunning() == False
; 		CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() RequireControllingQuestToBeRunning == true but ControllingQuest[" + ControllingQuest + "] is not running, so do nothing.")
		return
		
	EndIf

	if RequireSecondaryQuestToBeRunning && SecondaryQuest.IsRunning() == False
; 		CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() RequireSecondaryQuestToBeRunning == true but ControllingQuest[" + SecondaryQuest + "] is not running, so do nothing.")
		return
		
	EndIf

	if AllowDisablingGlobal && AllowDisablingGlobal.GetValue() == 0
; 		CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() Global " + AllowDisablingGlobal + " == 0, so do nothing.")
		return

	endif
	
bool shouldDisable
bool shouldEnable

	;check to see if siege is running and running in the location where this ref is currently located
	
	location SiegeLoc = CW.CWSiegeCity.GetLocation()
	
	if CW.CWSiegeS.IsStopped() == False && (GetReference().IsInLocation(SiegeLoc) || myVirtualLocation == SiegeLoc)
; 		CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() CWSiege is running and my location is the siege's location.")
		
		if ControllingQuest
			if ControllingQuest.GetStage() >= ControllingQuestStageToAllowDisable && ControllingQuest.GetStage() < ControllingQuestStageToStopAllowingDisable
; 				CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() will Disable me because Controlling quest[" + ControllingQuest + "] stage is >= " + ControllingQuestStageToAllowDisable + " and < " + ControllingQuestStageToStopAllowingDisable)
				shouldDisable = True
			
			Else
; 				CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() will Enable me because Controlling quest[" + ControllingQuest + "] stage is < " + ControllingQuestStageToAllowDisable + " OR >=" + ControllingQuestStageToStopAllowingDisable)
				shouldEnable = True
			
			EndIf
		Else ;go ahead and disable, we don't care about checking quest stage, just that the siege is running in my location
			shouldDisable = True
		
		EndIf
	
	else ;siege isn't running, or is running somewhere other than my current location
		shouldEnable = True
	
	endif

	;debug.messagebox(selfAsActor + " " + Game.GetPlayersLastRiddenHorse() + " " + selfAsActor.IsInFaction(CW.PlayerFaction) )
	
	if selfAsActor && (selfAsActor == Game.GetPlayersLastRiddenHorse() || selfAsActor.IsInFaction(CW.PlayerFaction) )
; 		CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() sees that I'm either the player's last ridden horse, or I'm in the player faction. So I won't be disabled.")
		ShouldDisable = false
	EndIf
	
		if RequireSiegeQuestToBeAccepted && CW.CWSiegeS.GetStageDone(1) == False
; 		CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() sees that RequireSiegeQuestToBeAccepted, but stage 1 on CWSiege is not done. So I won't be disabled.")
		ShouldDisable = false
	
	EndIf
	
	if ShouldDisable
; 		CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() is Disableing me.")
		GetReference().disable()
	
	elseif shouldEnable
; 		CWScript.Log("CWDisableDuringSiegeALIASScript", self + "OnCellLoad() is Enabling me.")
		GetReference().enable()
	
	EndIf
	
	
	
EndEvent
