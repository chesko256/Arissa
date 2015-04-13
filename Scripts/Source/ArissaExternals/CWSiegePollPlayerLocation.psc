Scriptname CWSiegePollPlayerLocation extends Quest  


;*** NOTE THIS USED TO BE USED TO FAIL SIEGES IF THE PLAYER LEFT
;WE ARE NOW SAYING THE SIEGE IS ALWAYS SUCCESSFUL BUT THE PLAYER GETS SCOLDED AND DOESN'T RANK UP IF HE RAN AWAY



int Property DistanceAtWhichPlayerDistanceFail = 20000 Auto
{Default = 20000. How far does player need to be from ref set by "RegisterBattleCenterMarkerAndLocation()" to trigger the fail state?}

int Property StageToSetIfPlayerIsAttackingDistanceFail = 50 Auto
{Default = 50. What stage should we set if the player left the battle?}

int Property StageToSetIfPlayerIsDefendingDistanceFail = 200 Auto		
{Default = 200. What stage should we set if the player left the battle?}

int Property StageThatMeansPlayerIsConsideredNotToHaveRunAwayFromAttack = 50 Auto
{Default = 50. What stage should we stop caring if the player left the battle if it's an attack?}

int Property StageThatMeansPlayerIsConsideredNotToHaveRunAwayFromDefense = 200 Auto
{Default = 200. What stage should we stop caring if the player left the battle if it's a defense?}

int Property StageThatMeansPlayerHasEnteredFinalCityBattle = 60 Auto
{Default = 60. What stage should we start caring about the player showing up at final battle for Solitude or Windhelm?}

CWScript Property CWs Auto
{Pointer to CWScript on CW quest}

Keyword Property CWSiegePlayerRanAway Auto

Location Property WindhelmLocation Auto
Location Property SolitudeLocation Auto
Location Property WhiterunLocation Auto

Location Property LocationOfBattle Auto Hidden
ObjectReference Property BattleCenterMarker Auto Hidden

bool PlayerIsAttacking
bool Property PlayerHasBeenToLocationOfBattle Auto Hidden ; i don't remember why this is a property, but for safety sake, leaving it as is
bool PlayerIsTooFarAway
bool Property PlayerHasRunAway Auto Hidden
bool PlayerHasLeftAfterBeingSuccessful

float PlayerDistanceFromBattleCenterMarker

Actor PlayerRef

State Busy
	Event OnUpdate()

;Commented out because this is a 1 second update, we want to make sure it doesn't stack up
; ;		CWScript.Log("CWSiegeScript", self + " OnUpdate() BUSY state")
	EndEvent
EndState

State Done
	Event OnUpdate()

;Commented out because this is a 1 second update, we want to make sure it doesn't stack up
; ;		CWScript.Log("CWSiegeScript", self + " OnUpdate() DONE state")
	EndEvent

EndState

function RegisterBattleCenterMarkerAndLocation(ObjectReference BattleCenterMarkerRef, Location CityLocation)

	BattleCenterMarker = BattleCenterMarkerRef
	LocationOfBattle = CityLocation
	PlayerIsAttacking = CWs.IsPlayerAttacking(CityLocation)
	PlayerRef = Game.GetPlayer()
	
; 	CWScript.Log("CWSiegeScript", self + " RegisterBattleCenterMarkerAndLocation() LocationOfBattle: " + LocationOfBattle + ", BattleCenterMarker:" + BattleCenterMarker + ", PlayerIsAttacking: " + PlayerIsAttacking)
	
	GoToState("")
	
EndFunction


Event OnUpdate()
	GoToState("Busy")

; 	CWScript.Log("CWSiegeScript", self + " OnUpdate()")

	;VERIFY PROPERTIES ARE SET
	if LocationOfBattle == None || BattleCenterMarker == None
; 		CWScript.Log("CWSiegeScript", self + " WARNING: LocationOfBattle or BattleCenterMarker == None, this will break the civil war siege.", 2, 1, 1)
	EndIf
	
	;CHECK IF PLAYER HAS BEEN TO LOCATION
	Bool PlayerInLocationOfBattle = PlayerRef.IsInLocation(LocationOfBattle)
	if PlayerHasBeenToLocationOfBattle == False && PlayerInLocationOfBattle
; 		CWScript.Log("CWSiegeScript", self + " setting PlayerHasBeenToLocation = True, because player is in: " + LocationOfBattle)
		PlayerHasBeenToLocationOfBattle = True
	EndIf

	;CHECK IF PLAYER IS TOO FAR AWAY
	
	PlayerDistanceFromBattleCenterMarker = PlayerRef.GetDistance(BattleCenterMarker)
; 	CWScript.Log("CWSiegeScript", self + "PlayerInLocationOfBattle: " + PlayerInLocationOfBattle + ", PlayerDistanceFromBattleCenterMarker: " + PlayerDistanceFromBattleCenterMarker)
	
	if PlayerHasBeenToLocationOfBattle == False || PlayerInLocationOfBattle
; 		CWScript.Log("CWSiegeScript", self + " IGNORING PlayerDistanceFromBattleCenterMarker(" + PlayerDistanceFromBattleCenterMarker + ") because PlayerHasBeenToLocationOfBattle == False OR PlayerInLocationOfBattle == True")
	Else	
		if PlayerIsTooFarAway == false && PlayerDistanceFromBattleCenterMarker >= DistanceAtWhichPlayerDistanceFail
; 			CWScript.Log("CWSiegeScript", self + " setting PlayerIsTooFarAway = True, PlayerDistanceFromBattleCenterMarker:" + PlayerDistanceFromBattleCenterMarker)
			PlayerIsTooFarAway = True
		EndIf
		
	EndIf
	
	
	if PlayerHasBeenToLocationOfBattle == False || PlayerIsTooFarAway == False
; 		CWScript.Log("CWSiegeScript", self + " BAILING OUT (RETURN) because PlayerHasBeenToLocationOfBattle == False || PlayerIsTooFarAway == False")
	
		GoToState("")
		RETURN		
	
	
	;IF PLAYER HAS BEEN TO LOCATION AND IS TOO FAR AWAY
	Elseif PlayerHasBeenToLocationOfBattle && PlayerIsTooFarAway
; 		CWScript.Log("CWSiegeScript", self + " CHECKING FOR QUEST UPDATE because PlayerHasBeenToLocationOfBattle && PlayerIsTooFarAway")

		;IF BATTLE IS AT WHITERUN
		if LocationOfBattle == WhiterunLocation
			
			;IF WHITERUN AND ATTACKING
			If PlayerIsAttacking
				
				;IF STAGE ISN'T SET THAT MEANS PLAYER PARTICIPATED ENOUGH:
				If GetStageDone(StageThatMeansPlayerIsConsideredNotToHaveRunAwayFromAttack) == False
; 					CWScript.Log("CWSiegeScript", self + " SETTING PlayerHasRunAway = True, because Location is Whiterun, player is attacking, and GetStageDone( " + StageThatMeansPlayerIsConsideredNotToHaveRunAwayFromAttack +  ") == False")
					PlayerHasRunAway = True
				
				Else ;STAGE IS SET THAT MEANS PLAYER PARTICIPATED ENOUGH:
; 					CWScript.Log("CWSiegeScript", self + " SETTING PlayerHasLeftAfterBeingSuccessful = true, because Location is Whiterun, player is attacking, and GetStageDone( " + StageThatMeansPlayerIsConsideredNotToHaveRunAwayFromAttack +  ") == TRUE")
					PlayerHasLeftAfterBeingSuccessful = true

				EndIf
			
			;IF WHITERUN AND DEFENDING
			elseif PlayerIsAttacking == False
			
				;IF STAGE ISN'T SET THAT MEANS PLAYER PARTICIPATED ENOUGH:
				if GetStageDone(StageThatMeansPlayerIsConsideredNotToHaveRunAwayFromDefense) == False
; 					CWScript.Log("CWSiegeScript", self + " SETTING PlayerHasRunAway = True, because Location is Whiterun, player is defending, and GetStageDone( " + StageThatMeansPlayerIsConsideredNotToHaveRunAwayFromDefense +  ") == False")
					PlayerHasRunAway = True
				
				Else ;STAGE IS SET THAT MEANS PLAYER PARTICIPATED ENOUGH:
; 					CWScript.Log("CWSiegeScript", self + " SETTING PlayerHasLeftAfterBeingSuccessful = true, because Location is Whiterun, player is defending, and GetStageDone( " + StageThatMeansPlayerIsConsideredNotToHaveRunAwayFromDefense +  ") == TRUE")
					PlayerHasLeftAfterBeingSuccessful = True

				EndIf

			
			EndIf
		
		;IF BATTLE IS AT SOLITIDE OR WINDHELM
		elseif LocationOfBattle == SolitudeLocation || LocationOfBattle == WindhelmLocation
			if GetStageDone(StageThatMeansPlayerHasEnteredFinalCityBattle) == True
; 				CWScript.Log("CWSiegeScript", self + " SETTING PlayerHasLeftAfterBeingSuccessful = True, because Location is Solitude/Windhelm and GetStageDone( " + StageThatMeansPlayerHasEnteredFinalCityBattle +  ") == True")
				PlayerHasLeftAfterBeingSuccessful = True
			
			Else
; 				CWScript.Log("CWSiegeScript", self + " CLEARING PlayerHasBeenToLocationOfBattle & PlayerIsTooFarAway and  BAILING OUT (RETURN) going to default script state, because Location is Solitude/Windhelm and GetStageDone( " + StageThatMeansPlayerHasEnteredFinalCityBattle +  ") == False")
				PlayerHasBeenToLocationOfBattle = False
				PlayerIsTooFarAway = False
				GoToState("")
				RETURN
				
			EndIf
		
		EndIf
		
	EndIf

;*** PROCESSING PLAYER RUNNING AWAY	
	if PlayerHasRunAway
		GoToState("DONE")
		
		LocationOfBattle.SetKeywordData(CWSiegePlayerRanAway, 1)
		
		if PlayerIsAttacking
; 			CWScript.Log("CWSiegeScript", self + " SetStage("  + StageToSetIfPlayerIsAttackingDistanceFail + ") because PlayerHasRunAway")
			SetStage(StageToSetIfPlayerIsAttackingDistanceFail)
		Else
; 			CWScript.Log("CWSiegeScript", self + " SetStage("  + StageToSetIfPlayerIsDefendingDistanceFail + ") because PlayerHasRunAway")
			SetStage(StageToSetIfPlayerIsDefendingDistanceFail)
		
		EndIf

	elseif PlayerHasLeftAfterBeingSuccessful
		GoToState("DONE")
; 		CWScript.Log("CWSiegeScript", self + " calling Stop() because PlayerHasLeftAfterBeingSuccessful.")
		stop()
		
	EndIf
	
EndEvent




;Event OnUpdate()
; ;	CWScript.Log("CWSiegeScript", self + " OnUpdate()")
;	
;	ObjectReference PlayerRef = Game.GetPlayer()
;
;	bool PlayerIsAttacking = CWs.isPlayerAttacking(LocationOfBattle)
;	
;	if LocationOfBattle == None || BattleCenterMarker == None
; ;		CWScript.Log("CWSiegeScript", self + " WARNING: LocationOfBattle or BattleCenterMarker == None, this will break the civil war siege.", 2, 1, 1)
;	
;	Else
;	
;		if PlayerHasBeenToLocationOfBattle == True
;			
;			if PlayerRef.IsInLocation(LocationOfBattle) == False
;
;				if WindhelmLocation == LocationOfBattle && PlayerRef.IsInLocation(WindhelmLocation) && GetStageDone(60) == FALSE
;					;Do nothing because the player is in windhelm and not in the city yet
; ;					CWScript.Log("CWSiegeScript", self + "OnUpdate() - player  is attacking Windhelm, but not in the city yet, so don't poll for distance")
;
;				elseif SolitudeLocation == LocationOfBattle && PlayerRef.IsInLocation(SolitudeLocation) && GetStageDone(60) == FALSE
;					;Do nothing because the player is in solitude and not in the city yet
; ;					CWScript.Log("CWSiegeScript", self + "OnUpdate() - player  is attacking Solitude, but not in the city yet, so don't poll for distance")
;
;				else
; ;					CWScript.Log("CWSiegeScript", self + "OnUpdate() - player  is either in Solitude with CWSiege 60 done, Windhelm with 60 done, or Whiterun, so poll distance")
;
;					if PlayerRef.GetDistance(BattleCenterMarker) >= DistanceAtWhichPlayerDistanceFail
; ;						CWScript.Log("CWSiegeScript", self + "OnUpdate() - player is too far center marker, setting siege quest stage based on if player is attacking or defending. BattleCenterMarker:" + BattleCenterMarker + ", distance to player:" + PlayerRef.GetDistance(BattleCenterMarker) + ", DistanceAtWhichPlayerDistanceFail:" + DistanceAtWhichPlayerDistanceFail)
;						
;						if PlayerIsAttacking && GetStageDone(StageThatMeansPlayerIsConsideredNotToHaveRunAwayFromAttack) == FALSE && GetStageDone(StageToSetIfPlayerIsAttackingDistanceFail) == False
;							
; ;							CWScript.Log("CWSiegeScript", self + "OnUpdate() - player  is too far center marker and is attacking so setting stage: " + StageToSetIfPlayerIsAttackingDistanceFail)
;							SetStage(StageToSetIfPlayerIsAttackingDistanceFail)
;
; ;							CWScript.Log("CWSiegeScript", self + "OnUpdate() - player  is too far center marker, setting CWSiegePlayerRanAway to 1 for location: " + LocationOfBattle)
;							LocationOfBattle.SetKeywordData(CWSiegePlayerRanAway, 1)
;						
;							
;						ElseIf PlayerIsAttacking == False && GetStageDone(StageToSetIfPlayerIsDefendingDistanceFail) == FALSE
;							
; ;							CWScript.Log("CWSiegeScript", self + "OnUpdate() - player  is too far center marker and is NOT attacking so setting stage: " + StageToSetIfPlayerIsDefendingDistanceFail)					
;							SetStage(StageToSetIfPlayerIsDefendingDistanceFail)
;							
; ;							CWScript.Log("CWSiegeScript", self + "OnUpdate() - player  is too far center marker, setting CWSiegePlayerRanAway to 1 for location: " + LocationOfBattle)
;							LocationOfBattle.SetKeywordData(CWSiegePlayerRanAway, 1)
;						
;						ElseIf GetStagedone(StageToSetIfPlayerIsAttackingDistanceFail) || GetStageDone(StageToSetIfPlayerIsDefendingDistanceFail)
;
; ;							CWScript.Log("CWSiegeScript", self + "OnUpdate() - player left area, stopping quest")				
;
;							Stop()
;
;						EndIf
;						
;						
;					Else
;					
; ;						CWScript.Log("CWSiegeScript", self + "OnUpdate() - player is close enough to center marker, continuing with siege quest as normal.")
;					EndIf
;
;				EndIf
;
;			
;			Else
; ;				CWScript.Log("CWSiegeScript", self + "OnUpdate() - not checking distance to center marker because player is in " + LocationOfBattle)
;			
;			EndIf
;		
;		Else
; ;			CWScript.Log("CWSiegeScript", self + "OnUpdate() - not checking distance to center marker because PlayerHasBeenToLocationOfBattle == false, checking to see if the player is in the location.")
;		
;			if PlayerRef.IsInLocation(LocationOfBattle) == True
; ;				CWScript.Log("CWSiegeScript", self + "OnUpdate() - setting PlayerHasBeenToLocationOfBattle to true because player IsInLocation:" + LocationOfBattle)
;				PlayerHasBeenToLocationOfBattle = True
;			Else
; ;				CWScript.Log("CWSiegeScript", self + "OnUpdate() - not setting PlayerHasBeenToLocationOfBattle to true because player isn't in location:" + LocationOfBattle)
;			EndIf
;
;		EndIf
;		
;	EndIf
;			
;EndEvent





