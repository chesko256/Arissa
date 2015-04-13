Scriptname CWSiegeGeneralScript extends ReferenceAlias  

int DistanceToPlayerNeeded = 500
int stageToSetWhenPlayerNear = 10

bool FightingForAwhile
int countSecondsFighting
int secondsToFightForBeforeSettingStage
int stageToSetAfterFightingForAwhile 


state CheckDistanceToPlayer
	Event OnUpdate()

		Quest myOwningQuest = GetOwningQuest()
		ObjectReference SelfRef = GetReference()	
		
		if SelfRef.GetDistance(Game.GetPlayer()) <= DistanceToPlayerNeeded
		; If the player is near the General then set stage 10
; 			CWScript.Log("CWSiegeGeneralScript", self + "OnUpdate() - player within distance to general, setting stage:" + stageToSetWhenPlayerNear)
			;myOwningQuest.setStage(stageToSetWhenPlayerNear)
			
			UnregisterForUpdate()
		EndIf
		
		if myOwningQuest.GetStage() >= stageToSetWhenPlayerNear
		; If the stage is 10 or higher then just stop updating altogether
			UnregisterForUpdate()
		EndIf
	
	EndEvent

EndState


state FightingForAwhile
	Event OnUpdate()

		Quest myOwningQuest = GetOwningQuest()
		ObjectReference SelfRef = GetReference()	
		
		if myOwningQuest.GetStage() >= stageToSetAfterFightingForAwhile
		; If the stage is "stageToSetWhenPlayerNear" or higher then just stop updating altogether
			UnregisterForUpdate()
			FightingForAwhile = False
		EndIf
		
		if myOwningQuest.GetStageDone(stageToSetAfterFightingForAwhile)
			FightingForAwhile = False
			UnregisterForUpdate()
			
		ElseIf FightingForAwhile
			countSecondsFighting += 1
		
			if countSecondsFighting > secondsToFightForBeforeSettingStage 
; 				CWScript.Log("CWSiegeGeneralScript", self + "OnUpdate() - done FightingForAwhile calling setStage:" + stageToSetAfterFightingForAwhile)
				FightingForAwhile = False
				UnregisterForUpdate()
				myOwningQuest.setStage(stageToSetAfterFightingForAwhile)
			
			EndIf
		
		EndIf
		
	EndEvent

EndState


function StartCheckingDistanceToPlayer()
	GoToState("CheckDistanceToPlayer")
	RegisterForUpdate(5)

EndFunction


function FightForAwhile(int SecondsToFightFor, int stageToSetWhenDoneFighting)
	ObjectReference selfRef = GetReference()

	GoToState("FightingForAwhile")
	
	secondsToFightForBeforeSettingStage = SecondsToFightFor
	stageToSetAfterFightingForAwhile = stageToSetWhenDoneFighting

	FightingForAwhile = True
	RegisterForUpdate(5)
	
EndFunction
