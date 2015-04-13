Scriptname CWReinforcementControllerScript extends Quest 

int Property ReinforcementInterval = 5 Auto
{Waves respawn every X seconds, default = 5}

float Property PoolAttacker auto hidden ;the current reinforcement pool value
float Property PoolDefender auto hidden ;the current reinforcement pool value

float Property StartingPoolAttacker auto Hidden
float Property StartingPoolDefender auto Hidden

bool Property InfiniteRespawnAttacker auto Hidden	;don't subtract from pools, always treat checks for cost to respawn as passing
bool Property InfiniteRespawnDefender auto Hidden	;don't subtract from pools, always treat checks for cost to respawn as passing


int Property ThresholdCounterPoolAttacker = -999 auto Hidden   	;chunk of reinforcements left, when increments, it means it's time to show objective to player -- for example, every 5% change in pool, increment this value and show the pools to the player
int Property ThresholdCounterPoolDefender = -999 auto Hidden	;chunk of reinforcements left, when increments, it means it's time to show objective to player -- for example, every 5% change in pool, increment this value and show the pools to the player

int Property PostTicketAttackerCountThreshold = 5 Auto
{Default = 5. After attacker has run out of tickets, how many living attackers should be left before setting the stage defined in StageToSetIfAttackerWipedOut}

int Property PostTicketDefenderCountThreshold = 5 Auto
{Default = 5. After defender has run out of tickets, how many living attackers should be left before setting the stage defined in StageToSetIfDefenderWipedOut}

int Property StageToSetIfAttackerWipedOut Auto
{What stage to set if attacker is out of tickets and the number of living attackers is <= to PostTicketAttackerCountThreshold}

int Property StageToSetIfDefenderWipedOut Auto
{What stage to set if attacker is out of tickets and the number of living attackers is <= to PostTicketDefenderCountThreshold}

int Property StageToSetIfAttacker25PercentRemainging Auto
{What stage to set if attacker has 25% reinforcements remaining}

int Property StageToSetIfDefender25PercentRemainging Auto
{What stage to set if attacker has 25% reinforcements remaining}

bool Property ShowAttackerPoolObjective  Auto
{Will we be turning on an objective to show how many attackers are remaining (used for defense sieges}

bool Property ShowDefenderPoolObjective  Auto
{Will we be turning on an objective to show how many attackers are remaining (used for defense sieges}

Quest Property PoolRemainingObjectiveQuest Auto
{Which quest holds the objective for attacker/defender losses}

int Property PoolRemainingAttackerObjective Auto
{Which objective to set in LossesQuest to show Attacker losses}

int Property PoolRemainingDefenderObjective Auto
{Which objective to set in LossesQuest to show Defender losses}


Int costForReinforcement = 1  

bool iterating		;are we in the middle of iterating through the "array" respawning guys?
bool iterateAgain		;should we iterate again through the array immediately? (if someone dies while currently iterating, we should iterate again just to make sure we catch him)

;Spawn Points
ObjectReference Property SpawnAttacker1 auto hidden
ObjectReference Property SpawnAttacker2 auto hidden
ObjectReference Property SpawnAttacker3 auto hidden
ObjectReference Property SpawnAttacker4 auto hidden
ObjectReference Property SpawnAttackerFailSafe auto hidden

ObjectReference Property SpawnDefender1 auto hidden
ObjectReference Property SpawnDefender2 auto hidden
ObjectReference Property SpawnDefender3 auto hidden
ObjectReference Property SpawnDefender4 auto hidden
ObjectReference Property SpawnDefenderFailSafe auto hidden

;Attacker Reinforcements "array"
ReferenceAlias A1 
ReferenceAlias A2 
ReferenceAlias A3 
ReferenceAlias A4 
ReferenceAlias A5 
ReferenceAlias A6 
ReferenceAlias A7 
ReferenceAlias A8 
ReferenceAlias A9 
ReferenceAlias A10 
ReferenceAlias A11 
ReferenceAlias A12 
ReferenceAlias A13 
ReferenceAlias A14 
ReferenceAlias A15 
ReferenceAlias A16 
ReferenceAlias A17 
ReferenceAlias A18 
ReferenceAlias A19 
ReferenceAlias A20 

;Defender Reinforcements "array"
ReferenceAlias D1 
ReferenceAlias D2 
ReferenceAlias D3 
ReferenceAlias D4 
ReferenceAlias D5 
ReferenceAlias D6 
ReferenceAlias D7 
ReferenceAlias D8 
ReferenceAlias D9 
ReferenceAlias D10 
ReferenceAlias D11 
ReferenceAlias D12 
ReferenceAlias D13 
ReferenceAlias D14 
ReferenceAlias D15 
ReferenceAlias D16 
ReferenceAlias D17 
ReferenceAlias D18 
ReferenceAlias D19 
ReferenceAlias D20 

;#ALIAS HOLDING THE ATTACK POINT LOCATION
Location AttackPoint 


;## Quests ##
Quest Property CW auto
Quest Property CWCampaign auto

;## Scripts ##
CWCampaignScript Property CWCampaignS auto Hidden	;set in OnInit()
CWscript Property CWs auto Hidden	;set in OnInit()



Event OnInit()

	CWCampaignS = CWCampaign as CWCampaignScript
	CWs = CW as CWscript
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "OnInit()", 0, true, true)
		
EndEvent


;State StopSpawning -- no longer try to respawn
State StopSpawning
	
	Function registerDeath(ReferenceAlias DeadAlias)		
		;Do nothing
				
; 		CWScript.Log("CWReinforcementControllerScript", self + "registerDeath(" + DeadAlias + ") [in state 'StopSpawning'] so will do nothing.")
	EndFunction
EndState


; STATE RESPAWNING
State Respawning

	Function registerDeath(ReferenceAlias DeadAlias)		;called in OnDeath event of the dying actor/ReferenceAlias
			
		
		if iterating == True
; 			CWScript.Log("CWReinforcementControllerScript", self + "registerDeath(" + DeadAlias + ") [in state 'Respawning'] and  currently iterating through 'array' respawning, so set flag that means iterate again immediately so we pick up this guy if we've already passed his positionin the array.")
			iterateAgain = True
			
		Else	
; 			CWScript.Log("CWReinforcementControllerScript", self + "registerDeath(" + DeadAlias + ") [in state 'Respawning'] and not currently iterating through 'array' respawning, so doing nothing")
		EndIf
		

	EndFunction

EndState
; /STATE RESPAWNING

function StopSpawning()
	GoToState("StopSpawning")
		
; 	CWScript.Log("CWReinforcementControllerScript", self + "stopSpawning() called - went to state 'StopSpawning'")
EndFunction

function registerDeath(ReferenceAlias DeadAlias)			;called in OnDeath event of the dying actor/ReferenceAlias
	GoToState("Respawning")	

	
; 	CWScript.Log("CWReinforcementControllerScript", self + "registerDeath(" + DeadAlias + ") [in state 'none'] gone to state 'Respawning'")
	
	bool done = False

; 	CWScript.Log("CWReinforcementControllerScript", self + "registerDeath(" + DeadAlias + ") [in state 'none'] will now Wait(" + ReinforcementInterval + ") to spawn reinforcements")
	
	utility.Wait(ReinforcementInterval)

; 	CWScript.Log("CWReinforcementControllerScript", self + "registerDeath(" + DeadAlias + ") [in state 'none'] is done waiting and will now try to respawn Aliass")

	
	
	while !done || iterateAgain		;iterateAgain is set in RegisterDeath() function in the "Respawning" state above
		iterating = True			;see RegisterDeath() function in the "Respawning" state above
		iterateAgain = False
		
		tryToRespawnAliass()
		
		done = True
		
		iterating = False			;see RegisterDeath() function in the "Respawning" state above
	endwhile	

	if GetState() != "StopSpawning" ;reminder case sensative
		GoToState("none")	
; 		CWScript.Log("CWReinforcementControllerScript", self + "registerDeath() [in state 'none'] is done respawning and is gone to state 'none'")
	EndIf
	

	
EndFunction

function tryToRespawnAliass()

	shuffleSpawnMarkers()

	;CALL TryToRespawnAlias for each variable in both arrays
	TryToRespawnAlias(A1)
	TryToRespawnAlias(A2)
	TryToRespawnAlias(A3)
	TryToRespawnAlias(A4)
	TryToRespawnAlias(A5)
	TryToRespawnAlias(A6)
	TryToRespawnAlias(A7)
	TryToRespawnAlias(A8)
	TryToRespawnAlias(A9)
	TryToRespawnAlias(A10)
	TryToRespawnAlias(A11)
	TryToRespawnAlias(A12)
	TryToRespawnAlias(A13)
	TryToRespawnAlias(A14)
	TryToRespawnAlias(A15)
	TryToRespawnAlias(A16)
	TryToRespawnAlias(A17)
	TryToRespawnAlias(A18)
	TryToRespawnAlias(A19)
	TryToRespawnAlias(A20)
	
	TryToRespawnAlias(D1)
	TryToRespawnAlias(D2)
	TryToRespawnAlias(D3)
	TryToRespawnAlias(D4)
	TryToRespawnAlias(D5)
	TryToRespawnAlias(D6)
	TryToRespawnAlias(D7)
	TryToRespawnAlias(D8)
	TryToRespawnAlias(D9)
	TryToRespawnAlias(D10)
	TryToRespawnAlias(D11)
	TryToRespawnAlias(D12)
	TryToRespawnAlias(D13)
	TryToRespawnAlias(D14)
	TryToRespawnAlias(D15)
	TryToRespawnAlias(D16)
	TryToRespawnAlias(D17)
	TryToRespawnAlias(D18)
	TryToRespawnAlias(D19)
	TryToRespawnAlias(D20)
	

EndFunction


Function TryToRespawnAlias(ReferenceAlias AliasToRespawn)

	float pool
	bool isAttacker
	
	if !AliasToRespawn || AliasToRespawn.GetActorReference().IsDead() == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToRespawnAlias(" + AliasToRespawn + ") variable is empty or is currently alive, so we are returning without trying to repawn.")

		Return
	EndIf
	
	;Determine which pool to use, store in pool variable
; 	CWScript.Log("CWReinforcementControllerScript", self +"TryToRespawnAlias(" + AliasToRespawn + ") calling IsAliasAttacker()" )
	if IsAliasAttacker(AliasToRespawn)
		isAttacker = true
	EndIf
	
	
	if IsAttacker
; 		CWScript.Log("CWReinforcementControllerScript", self +"TryToRespawnAlias(" + AliasToRespawn + ") is an Attacker. PoolAttacker == " + PoolAttacker )
		pool = PoolAttacker
		
	else ;assuming is Defender
; 		CWScript.Log("CWReinforcementControllerScript", self +"TryToRespawnAlias(" + AliasToRespawn + ") is not an Attacker (assuming is Defender). PoolDefender ==" + PoolDefender )
		pool = PoolDefender
	
	EndIf
	

	;CHECK FOR POOL NOT BEING EMPTY 
	if pool < costForReinforcement
; 		CWScript.Log("CWReinforcementControllerScript", self +"TryToRespawnAlias(" + AliasToRespawn + ")... Pool(" + pool + ")  < costForReinforcement(" + costForReinforcement + ") So we won't respawn, and will check to see if all teammates are dead." )
	
		;CHECK FOR ALL THE VARIABLES BEING DEAD, IF THEY ARE, THEN SET THE STAGE
		if isAttacker
; 			CWScript.Log("CWReinforcementControllerScript", self +"TryToRespawnAlias(" + AliasToRespawn + ") is an Attacker, checking CountAttackersAlive()" )

			if GetStageDone(StageToSetIfAttackerWipedOut) == True
; 				CWScript.Log("CWReinforcementControllerScript", self +"TryToRespawnAlias(" + AliasToRespawn + ") StageToSetIfAttackerWipedOut[" + StageToSetIfAttackerWipedOut  + "] is set, not bothering to check if any are alive." )				
				
			Else
				if CountAttackersAlive() > PostTicketAttackerCountThreshold
; 					CWScript.Log("CWReinforcementControllerScript", self +"CountAttackersAlive() > PostTicketAttackerCountThreshold[" + PostTicketAttackerCountThreshold + "] so doing nothing." )
				Else
; 					CWScript.Log("CWReinforcementControllerScript", self +"CountAttackersAlive() <= PostTicketAttackerCountThreshold[" + PostTicketAttackerCountThreshold + "], so we are setting stage that means all the Attackers are wiped out: " +  StageToSetIfAttackerWipedOut)
					
					if ShowAttackerPoolObjective
						showAttackerPool()
					endif
					
					setStage(StageToSetIfAttackerWipedOut)
					
				EndIf
				
			endif
					

		else	;assuming is Defender
; 			CWScript.Log("CWReinforcementControllerScript", self +"TryToRespawnAlias(" + AliasToRespawn + ") is a Defender, checking CountDefendersAlive()" )

			if GetStageDone(StageToSetIfDefenderWipedOut) == True
; 				CWScript.Log("CWReinforcementControllerScript", self +"TryToRespawnAlias(" + AliasToRespawn + ") StageToSetIfDefenderWipedOut[" + StageToSetIfDefenderWipedOut  + "] is set, not bothering to check if any are alive." )				
				
			Else
				if CountDefendersAlive() > PostTicketDefenderCountThreshold
; 					CWScript.Log("CWReinforcementControllerScript", self +"CountDefendersAlive() > PostTicketDefenderCountThreshold[" + PostTicketDefenderCountThreshold + "] so doing nothing." )
				Else
; 					CWScript.Log("CWReinforcementControllerScript", self +"CountDefendersAlive() <= PostTicketDefenderCountThreshold[" + PostTicketDefenderCountThreshold + "], so we are setting stage that means all the Defenders are wiped out: " +  StageToSetIfDefenderWipedOut)
					
					if ShowDefenderPoolObjective
						showDefenderPool()
					endif
					
					setStage(StageToSetIfDefenderWipedOut)
					
				EndIf
				
			EndIf

		EndIf
		
; 		CWScript.Log("CWReinforcementControllerScript", self + "not respawning " + AliasToRespawn + " which is ref:" + AliasToRespawn.GetReference())
		
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + "respawning" + AliasToRespawn + " which is ref:" + AliasToRespawn.GetReference())

		;SPAWN ALIASES HERE
		if isAttacker
			;SPAWN ME AND SUBTRACT FROM POOLAttacker	
			AliasToRespawn.GetActorReference().Reset(GetAttackerSpawnRef(AliasToRespawn))
			
;			;****TEMP TEST A THEORY ABOUT WHY STUFF IS BROKEN:
;			utility.wait(2)
;			if AliasToRespawn.GetActorReference().IsDead()
; ;				CWScript.Log("CWReinforcementControllerScript", self + " TEMP DEBUG WARNING: Just tried to respawn " + AliasToRespawn + AliasToRespawn.GetReference() + "and he's still dead!!!")
;			Else
; ;				CWScript.Log("CWReinforcementControllerScript", self + " TEMP DEBUG: All is well, just tried to respawn " + AliasToRespawn + AliasToRespawn.GetReference() + "and he's alive.")
;			EndIf
;			;****
			
			SubtractFromAttackerPool()
		
		else	;assuming is Defender
			;SPAWN ME AND SUBTRACT FROM POOLDefender
			AliasToRespawn.GetActorReference().Reset(GetDefenderSpawnRef(AliasToRespawn))

;			;****TEMP TEST A THEORY ABOUT WHY STUFF IS BROKEN:
;			utility.wait(2)
;			if AliasToRespawn.GetActorReference().IsDead()
; ;				CWScript.Log("CWReinforcementControllerScript", self + "TEMP DEBUG WARNING: Just tried to respawn " + AliasToRespawn + "and he's still dead!!!", 2, 1, 1)
;			Else
; ;				CWScript.Log("CWReinforcementControllerScript", self + "TEMP DEBUG: All is well, just tried to respawn " + AliasToRespawn + "and he's alive.", 1, 1, 1)
;			EndIf
;			;****
			
			SubtractFromDefenderPool()
			
		EndIf
		
	EndIf
	
EndFunction


bool function IsAliasAttacker(ReferenceAlias AliasToRespawn)

	bool isAttacker
	bool isDefender

	if AliasToRespawn.GetActorReference().IsInFaction(CWs.CWImperialFaction)
		if CWs.iImperials == CWs.GetAttacker(AttackPoint)
			isAttacker = true
		Elseif CWs.iImperials == CWs.GetDefender(AttackPoint)
			isDefender = true
		Else
; 			CWScript.Log("CWReinforcementControllerScript", self + " ERROR: TryToRespawnAlias(" + AliasToRespawn + ") expected to be either the attacker, or the defender.", 2, True, True)
		EndIf
	
	elseif AliasToRespawn.GetActorReference().IsInFaction(CWs.CWSonsFaction)
		if CWs.iSons == CWs.GetAttacker(AttackPoint)
			isAttacker = true
		Elseif CWs.iSons == CWs.GetDefender(AttackPoint)
			isDefender = true
		Else
; 			CWScript.Log("CWReinforcementControllerScript", self + " ERROR: TryToRespawnAlias(" + AliasToRespawn + ") expected to be either the attacker, or the defender.", 2, True, True)
		EndIf	
		
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + " ERROR: TryToRespawnAlias(" + AliasToRespawn + ") expected to be either the Imperial faction or Sons faction, is neither.", 2, True, True)
	
	EndIf
	
	if isAttacker == True
		return True
	Else
		return False
	EndIf
EndFunction



int Function CountAttackersAlive()
		
; 	CWScript.Log("CWReinforcementControllerScript", self + "CountAttackersAlive() checking 'array' to see if all the actors are dead.")

	int returnVal
	
	returnVal += IsAliasAlive(A1)
	returnVal += IsAliasAlive(A2)
	returnVal += IsAliasAlive(A3)
	returnVal += IsAliasAlive(A4)
	returnVal += IsAliasAlive(A5)
	returnVal += IsAliasAlive(A6)
	returnVal += IsAliasAlive(A7)
	returnVal += IsAliasAlive(A8)
	returnVal += IsAliasAlive(A9)
	returnVal += IsAliasAlive(A10)
	returnVal += IsAliasAlive(A11)
	returnVal += IsAliasAlive(A12)
	returnVal += IsAliasAlive(A13)
	returnVal += IsAliasAlive(A14)
	returnVal += IsAliasAlive(A15)
	returnVal += IsAliasAlive(A16)
	returnVal += IsAliasAlive(A17)
	returnVal += IsAliasAlive(A18)
	returnVal += IsAliasAlive(A19)
	returnVal += IsAliasAlive(A20)
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "CountAttackersAlive() will return:" + returnVal)
	
	return returnVal
	
EndFunction



int Function CountDefendersAlive()
		
; 	CWScript.Log("CWReinforcementControllerScript", self + "CountDefendersAlive() checking 'array' to see if all the actors are dead.")

	int returnVal
	
	returnVal += IsAliasAlive(D1)
	returnVal += IsAliasAlive(D2)
	returnVal += IsAliasAlive(D3)
	returnVal += IsAliasAlive(D4)
	returnVal += IsAliasAlive(D5)
	returnVal += IsAliasAlive(D6)
	returnVal += IsAliasAlive(D7)
	returnVal += IsAliasAlive(D8)
	returnVal += IsAliasAlive(D9)
	returnVal += IsAliasAlive(D10)
	returnVal += IsAliasAlive(D11)
	returnVal += IsAliasAlive(D12)
	returnVal += IsAliasAlive(D13)
	returnVal += IsAliasAlive(D14)
	returnVal += IsAliasAlive(D15)
	returnVal += IsAliasAlive(D16)
	returnVal += IsAliasAlive(D17)
	returnVal += IsAliasAlive(D18)
	returnVal += IsAliasAlive(D19)
	returnVal += IsAliasAlive(D20)
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "CountDefendersAlive() will return:" + returnVal)
	
	return returnVal
	
EndFunction

int Function IsAliasAlive(ReferenceAlias AliasVariableToCheck)
		
	
	if AliasVariableToCheck && AliasVariableToCheck.GetActorReference().IsDead() == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "IsAliasAlive() is returning true (1) for AliasVariableToCheck:"  + AliasVariableToCheck)
		Return 1
		
	ElseIf AliasVariableToCheck && AliasVariableToCheck.GetActorReference().IsDead() == True
; 		CWScript.Log("CWReinforcementControllerScript", self + "IsAliasAlive() is returning false (0) for AliasVariableToCheck:"  + AliasVariableToCheck)
		return 0
		
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + "IsAliasAlive() is returning false (0) for AliasVariableToCheck:"  + AliasVariableToCheck + " because it's empty" )
		return 0
		
	endif
	
EndFunction

Function RegisterAttackPoint(Location SiegeLocationAttackPoint)
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterAttackPoint() setting AttackPoint to: " + SiegeLocationAttackPoint)

	AttackPoint = SiegeLocationAttackPoint
EndFunction


Function RegisterAlias(ReferenceAlias AliasToAdd)
		
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterAlias(" + AliasToAdd +  ") checking faction and attacker or defender status, and then will call the appropriate RegisterAliasAttacker() or RegisterAliasDefender()")



	if AliasToAdd.GetActorReference().IsInFaction(CWs.CWImperialFaction)
		if CWs.iImperials == CWs.GetAttacker(AttackPoint)
			RegisterAliasAttacker(AliasToAdd)
		Elseif CWs.iImperials == CWs.GetDefender(AttackPoint)
			RegisterAliasDefender(AliasToAdd)
		Else
; 			CWScript.Log("CWReinforcementControllerScript", self + " ERROR: FAILING TO ADD ReferenceAlias TO RESPAWN ARRAY! RegisterAlias(" + AliasToAdd + ") expected to be either the attacker, or the defender.", 2, True, True)
		EndIf
	
	elseif AliasToAdd.GetActorReference().IsInFaction(CWs.CWSonsFaction)
		if CWs.iSons == CWs.GetAttacker(AttackPoint)
			RegisterAliasAttacker(AliasToAdd)
		Elseif CWs.iSons == CWs.GetDefender(AttackPoint)
			RegisterAliasDefender(AliasToAdd)
		Else
; 			CWScript.Log("CWReinforcementControllerScript", self + " ERROR: FAILING TO ADD ReferenceAlias TO RESPAWN ARRAY! RegisterAlias(" + AliasToAdd + ") expected to be either the attacker, or the defender.", 2, True, True)
		EndIf	
	
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + " ERROR: RegisterAlias(" + AliasToAdd + ") expected to be either the Imperial faction or Sons faction, is neither.", 2, True, True)	
	
	EndIf

EndFunction

Function RegisterAliasAttacker(ReferenceAlias AliasToAdd)

	

; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() is adding ReferenceAlias " + AliasToAdd)
	
	if !A1
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A1 variable")
		A1 = AliasToAdd
	elseif !A2
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A2 variable")
		A2 = AliasToAdd
	elseif !A3
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A3 variable")
		A3 = AliasToAdd
	elseif !A4
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A4 variable")
		A4 = AliasToAdd
	elseif !A5
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A5 variable")
		A5 = AliasToAdd
	elseif !A6
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A6 variable")
		A6 = AliasToAdd
	elseif !A7
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A7 variable")
		A7 = AliasToAdd
	elseif !A8
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A8 variable")
		A8 = AliasToAdd
	elseif !A9
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A9 variable")
		A9 = AliasToAdd
	elseif !A10
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A10 variable")
		A10 = AliasToAdd
	elseif !A11
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A11 variable")
		A11 = AliasToAdd
	elseif !A12
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A12 variable")
		A12 = AliasToAdd
	elseif !A13
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A13 variable")
		A13 = AliasToAdd		
	elseif !A14
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A14 variable")
		A14 = AliasToAdd
	elseif !A15
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A15 variable")
		A15 = AliasToAdd
	elseif !A16
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A16 variable")
		A16 = AliasToAdd
	elseif !A17
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A17 variable")
		A17 = AliasToAdd
	elseif !A18
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A18 variable")
		A18 = AliasToAdd
	elseif !A19
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A19 variable")
		A19 = AliasToAdd
	elseif !A20
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasAttacker() adding ReferenceAlias to A20 variable")
		A20 = AliasToAdd
	Else
	
; 	CWScript.Log("CWReinforcementControllerScript", self + " ERROR: RegisterAliasAttacker() ran out of 'array' variables; there is no variable to store ReferenceAlias", 2, True, True)
	
	EndIf
EndFunction

Function RegisterAliasDefender(ReferenceAlias AliasToAdd)

	

; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() is adding ReferenceAlias " + AliasToAdd)
	
	if !D1
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D1 variable")
		D1 = AliasToAdd
	elseif !D2
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D2 variable")
		D2 = AliasToAdd
	elseif !D3
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D3 variable")
		D3 = AliasToAdd
	elseif !D4
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D4 variable")
		D4 = AliasToAdd
	elseif !D5
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D5 variable")
		D5 = AliasToAdd
	elseif !D6
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D6 variable")
		D6 = AliasToAdd
	elseif !D7
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D7 variable")
		D7 = AliasToAdd
	elseif !D8
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D8 variable")
		D8 = AliasToAdd
	elseif !D9
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D9 variable")
		D9 = AliasToAdd
	elseif !D10
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D10 variable")
		D10 = AliasToAdd
	elseif !D11
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D11 variable")
		D11 = AliasToAdd
	elseif !D12
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D12 variable")
		D12 = AliasToAdd
	elseif !D13
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D13 variable")
		D13 = AliasToAdd		
	elseif !D14
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D14 variable")
		D14 = AliasToAdd
	elseif !D15
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D15 variable")
		D15 = AliasToAdd
	elseif !D16
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D16 variable")
		D16 = AliasToAdd
	elseif !D17
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D17 variable")
		D17 = AliasToAdd
	elseif !D18
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D18 variable")
		D18 = AliasToAdd
	elseif !D19
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D19 variable")
		D19 = AliasToAdd
	elseif !D20
; 		CWScript.Log("CWReinforcementControllerScript", self + "RegisterAliasDefender() adding ReferenceAlias to D20 variable")
		D20 = AliasToAdd
	Else
	
; 	CWScript.Log("CWReinforcementControllerScript", self + " ERROR: RegisterAliasDefender() ran out of 'array' variables; there is no variable to store ReferenceAlias", 2, True, True)
	
	EndIf

EndFunction

ObjectReference Function TryToGetPrioritySpawnLinkedRef(ReferenceAlias AliasToCheckFor)
	;THIS IS VERY SIMILAR TO TryToGetForcedSpawnLinkedRef

; 	CWScript.Log("CWReinforcementControllerScript", self + "TryToGetPrioritySpawnLinkedRef()" )

	ObjectReference AliasRef = AliasToCheckFor.GetReference()
	
	ObjectReference linkedRefToReturn = None
	
	
	if CWs.CWBattlePhase.Value == 1 && AliasRef.GetLinkedRef(CWs.CW1PrioritySpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW1PrioritySpawn)
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetPrioritySpawnLinkedRef() found CW1PrioritySpawn link: " + linkedRefToReturn + " for: " + AliasRef )
		
	elseif CWs.CWBattlePhase.Value == 2 && AliasRef.GetLinkedRef(CWs.CW2PrioritySpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW2PrioritySpawn)
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetPrioritySpawnLinkedRef() found CW2PrioritySpawn link: " + linkedRefToReturn + " for: " + AliasRef )
		
	elseif CWs.CWBattlePhase.Value == 3 && AliasRef.GetLinkedRef(CWs.CW3PrioritySpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW3PrioritySpawn)		
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetPrioritySpawnLinkedRef() found CW3PrioritySpawn link: " + linkedRefToReturn + " for: " + AliasRef )

	elseif CWs.CWBattlePhase.Value == 4 && AliasRef.GetLinkedRef(CWs.CW4PrioritySpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW4PrioritySpawn)		
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetPrioritySpawnLinkedRef() found CW4PrioritySpawn link: " + linkedRefToReturn + " for: " + AliasRef )

	elseif CWs.CWBattlePhase.Value == 5 && AliasRef.GetLinkedRef(CWs.CW5PrioritySpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW5PrioritySpawn)		
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetPrioritySpawnLinkedRef() found CW5PrioritySpawn link: " + linkedRefToReturn + " for: " + AliasRef )
		
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetPrioritySpawnLinkedRef() didn't find an appropriate Priority Spawn Linked Ref for: " + AliasRef )
	
	EndIf

		return linkedRefToReturn
		
EndFunction


ObjectReference Function TryToGetForcedSpawnLinkedRef(ReferenceAlias AliasToCheckFor)
	;THIS IS VERY SIMILAR TO TryToGetPrioritySpawnLinkedRef

; 	CWScript.Log("CWReinforcementControllerScript", self + "TryToGetForcedSpawnLinkedRef()" )

	ObjectReference AliasRef = AliasToCheckFor.GetReference()
	
	ObjectReference linkedRefToReturn = None
	
	
	if CWs.CWBattlePhase.Value == 1 && AliasRef.GetLinkedRef(CWs.CW1ForcedSpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW1ForcedSpawn)
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetForcedSpawnLinkedRef() found CW1ForcedSpawn link: " + linkedRefToReturn + " for: " + AliasRef )
		
	elseif CWs.CWBattlePhase.Value == 2 && AliasRef.GetLinkedRef(CWs.CW2ForcedSpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW2ForcedSpawn)
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetForcedSpawnLinkedRef() found CW2ForcedSpawn link: " + linkedRefToReturn + " for: " + AliasRef )
		
	elseif CWs.CWBattlePhase.Value == 3 && AliasRef.GetLinkedRef(CWs.CW3ForcedSpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW3ForcedSpawn)		
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetForcedSpawnLinkedRef() found CW3ForcedSpawn link: " + linkedRefToReturn + " for: " + AliasRef )

	elseif CWs.CWBattlePhase.Value == 4 && AliasRef.GetLinkedRef(CWs.CW4ForcedSpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW4ForcedSpawn)		
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetForcedSpawnLinkedRef() found CW4ForcedSpawn link: " + linkedRefToReturn + " for: " + AliasRef )

	elseif CWs.CWBattlePhase.Value == 5 && AliasRef.GetLinkedRef(CWs.CW5ForcedSpawn)
		linkedRefToReturn = AliasRef.GetLinkedRef(CWs.CW5ForcedSpawn)		
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetForcedSpawnLinkedRef() found CW5ForcedSpawn link: " + linkedRefToReturn + " for: " + AliasRef )
		
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToGetForcedSpawnLinkedRef() didn't find an appropriate Forced Spawn Linked Ref for: " + AliasRef )
	
	EndIf

		return linkedRefToReturn
		
EndFunction





ObjectReference Function GetAttackerSpawnRef(ReferenceAlias AliasToCheckFor)
	;VERY SIMILAR TO GetDefenderSpawnRef... these are different functions because I need to return attacker or defender spawn refs

	actor playerActor = Game.GetPlayer() as actor
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "GetAttackerSpawnRef()  " )
	
	ObjectReference PrioritySpawn =	TryToGetPrioritySpawnLinkedRef(AliasToCheckFor)
	ObjectReference ForcedSpawn =	TryToGetForcedSpawnLinkedRef(AliasToCheckFor)
	
	if ForcedSpawn
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetAttackerSpawnRef() playerActor.HasLOS(ForcedSpawn) == False, returning " + ForcedSpawn)
		return ForcedSpawn
	
	Elseif PrioritySpawn && playerActor.HasLOS(PrioritySpawn) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetAttackerSpawnRef() playerActor.HasLOS(PrioritySpawn) == False, returning " + PrioritySpawn)
		return PrioritySpawn
		
	elseif playerActor.HasLOS(SpawnAttacker1) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetAttackerSpawnRef() playerActor.HasLOS(SpawnAttacker1) == False, returning " + SpawnAttacker1)
		return SpawnAttacker1
		
	elseif playerActor.HasLOS(SpawnAttacker2) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetAttackerSpawnRef() playerActor.HasLOS(SpawnAttacker2) == False, returning " + SpawnAttacker2)
		return SpawnAttacker2	
		
	elseif playerActor.HasLOS(SpawnAttacker3) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetAttackerSpawnRef() playerActor.HasLOS(SpawnAttacker3) == False, returning " + SpawnAttacker3)
		return SpawnAttacker3	
		
	elseif playerActor.HasLOS(SpawnAttacker4) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetAttackerSpawnRef() playerActor.HasLOS(SpawnAttacker4) == False, returning " + SpawnAttacker4)
		return SpawnAttacker4	
		
	else
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetAttackerSpawnRef() playerActor.HasLOS to all the Spawn markers, returning the SpawnAttackerFailsafe:" + SpawnAttackerFailSafe)
		return SpawnAttackerFailSafe	
	
	EndIf

EndFunction

ObjectReference Function GetDefenderSpawnRef(ReferenceAlias AliasToCheckFor)
	;VERY SIMILAR TO GetAttackerSpawnRef... these are different functions because I need to return attacker or defender spawn refs

	actor playerActor = Game.GetPlayer() as Actor
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "GetDefenderSpawnRef()  " )
	
	ObjectReference PrioritySpawn =	TryToGetPrioritySpawnLinkedRef(AliasToCheckFor)
	ObjectReference ForcedSpawn =	TryToGetForcedSpawnLinkedRef(AliasToCheckFor)
	
	if ForcedSpawn
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetDefenderSpawnRef() playerActor.HasLOS(ForcedSpawn) == False, returning " + ForcedSpawn)
		return ForcedSpawn
	
	elseif PrioritySpawn && playerActor.HasLOS(PrioritySpawn) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetDefenderSpawnRef() playerActor.HasLOS(PrioritySpawn) == False, returning " + PrioritySpawn)
		return PrioritySpawn
		
	elseif playerActor.HasLOS(SpawnDefender1) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetDefenderSpawnRef() playerActor.HasLOS(SpawnDefender1) == False, returning " + SpawnDefender1)
		return SpawnDefender1
		
	elseif playerActor.HasLOS(SpawnDefender2) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetDefenderSpawnRef() playerActor.HasLOS(SpawnDefender2) == False, returning " + SpawnDefender2)
		return SpawnDefender2	
		
	elseif playerActor.HasLOS(SpawnDefender3) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetDefenderSpawnRef() playerActor.HasLOS(SpawnDefender3) == False, returning " + SpawnDefender3)
		return SpawnDefender3	
		
	elseif playerActor.HasLOS(SpawnDefender4) == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetDefenderSpawnRef() playerActor.HasLOS(SpawnDefender4) == False, returning " + SpawnDefender4)
		return SpawnDefender4	
		
	else
; 		CWScript.Log("CWReinforcementControllerScript", self + "GetDefenderSpawnRef() playerActor.HasLOS to all the Spawn markers, returning the SpawnDefenderFailsafe:" + SpawnDefenderFailSafe)
		return SpawnDefenderFailSafe	
	
	EndIf

EndFunction


Function RegisterSpawnAttackerAliases(ReferenceAlias Marker1Alias, ReferenceAlias Marker2Alias, ReferenceAlias Marker3Alias, ReferenceAlias Marker4Alias, ReferenceAlias FailSafeMarkerAlias)
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnAttackerMarkersAsAliases() adding ReferenceAlias references.")
	
	SpawnAttacker1 = Marker1Alias.GetReference()
	SpawnAttacker2 = Marker2Alias.GetReference()
	SpawnAttacker3 = Marker3Alias.GetReference()
	SpawnAttacker4 = Marker4Alias.GetReference()
	SpawnAttackerFailSafe = FailSafeMarkerAlias.GetReference()
	
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnAttackerMarkersAsAliases() SpawnAttacker1 = " + SpawnAttacker1 )
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnAttackerMarkersAsAliases() SpawnAttacker2 = " + SpawnAttacker2 )
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnAttackerMarkersAsAliases() SpawnAttacker3 = " + SpawnAttacker3 )
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnAttackerMarkersAsAliases() SpawnAttacker4 = " + SpawnAttacker4 )
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnAttackerMarkersAsAliases() SpawnAttackerFailSafe = " + SpawnAttackerFailSafe )
	
EndFunction

Function RegisterSpawnDefenderAliases(ReferenceAlias Marker1Alias, ReferenceAlias Marker2Alias, ReferenceAlias Marker3Alias, ReferenceAlias Marker4Alias, ReferenceAlias FailSafeMarkerAlias)
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnDefenderMarkersAsAliases() adding ReferenceAlias references.")
	
	SpawnDefender1 = Marker1Alias.GetReference()
	SpawnDefender2 = Marker2Alias.GetReference()
	SpawnDefender3 = Marker3Alias.GetReference()
	SpawnDefender4 = Marker4Alias.GetReference()
	SpawnDefenderFailSafe = FailSafeMarkerAlias.GetReference()
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnDefenderMarkersAsAliases() SpawnDefender1 = " + SpawnDefender1 )
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnDefenderMarkersAsAliases() SpawnDefender2 = " + SpawnDefender2 )
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnDefenderMarkersAsAliases() SpawnDefender3 = " + SpawnDefender3 )
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnDefenderMarkersAsAliases() SpawnDefender4 = " + SpawnDefender4 )
; 	CWScript.Log("CWReinforcementControllerScript", self + "RegisterSpawnDefenderMarkersAsAliases() SpawnDefenderFailSafe = " + SpawnDefenderFailSafe )
EndFunction



Function setInfinitePools(bool AttackerHasInfinite = true, bool DefenderHasInfinite = true)
{THIS MUST BE CALLED AFTER CALLING SetPoolAttacker/Defender, or in place of calling those}
;both params are true for backwards compatability when this function set a single variable meaning ALL respawns were infinite

; 	CWScript.Log("CWReinforcementControllerScript", self + "setInfinitePools( AttackerHasInfinite==" + AttackerHasInfinite + ", DefenderHasInfinite==" + DefenderHasInfinite + ")")
	
	if AttackerHasInfinite
		PoolAttacker = 9999
		StartingPoolAttacker = 9999	
		InfiniteRespawnAttacker = AttackerHasInfinite
	
	EndIf
	

	if DefenderHasInfinite
		PoolDefender = 9999
		StartingPoolDefender = 9999
		InfiniteRespawnDefender = DefenderHasInfinite
	endif

EndFunction

Function SetPoolAttacker(int BasePool = 10, float AttackDeltaMult = 1.0, float scaleMult = 1.0, bool InfinitePool = False)
{PoolAttacker = (BasePool + (AttackDelta * AttackDeltaMult) | 0)) * scaleMult }
	
	float pool 
	
	
	if infinitePool == False
	
		;int AttackDelta = CWCampaignS.GetCurrentAttackDelta() 
		;ATTACK DELTA IS NO LONGER BEING USED - IT WAS THE RELATIVE STRENGTH OF THE ATTACKER BASED ON THE SURROUNDING HOLDS HE OWNS ADJACENT TO THE CONTESTED HOLD. THERE IS NO CURRENT CAMPAIGN WITH CONTESTED HOLD ANYMORE
		;To make life easier for me, I'm just setting attack delta to 0 rather than restructuring all the logic
		
		int AttackDelta = 0
			
		if AttackDelta > 0
			
			pool = (BasePool + (AttackDelta * AttackDeltaMult)) * scaleMult
; 			CWScript.Log("CWReinforcementControllerScript", self + "SetPoolAttacker() Pool[" + Pool +  "] = (BasePool[" + BasePool + "] + (AttackDelta[" + AttackDelta + "] * AttackDeltaMult[" + AttackDeltaMult + "])) * scaleMult[" + scaleMult + "]" )
			
		Else
		
			pool = BasePool * scaleMult		
; 			CWScript.Log("CWReinforcementControllerScript", self + "SetPoolAttacker() Pool[" + Pool +  "] = BasePool[" + BasePool + "] * scaleMult[" + scaleMult + "]" )
			
		EndIf
		
		PoolAttacker = pool as int
		StartingPoolAttacker = pool as int
	
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + "SetPoolAttacker() is making Attackers have an Infinite Pool.")
		setInfinitePools(AttackerHasInfinite = true, DefenderHasInfinite = False)	;doesn't set it to false, just doesn't set it to true
	
	EndIf
	
	CWs.CWPercentPoolRemainingAttacker.setValue(100)
	PoolRemainingObjectiveQuest.UpdateCurrentInstanceGlobal(CWs.CWPercentPoolRemainingAttacker)
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "SetPoolAttacker() PoolAttacker = " + PoolAttacker )
	
EndFunction


Function SetPoolDefender(int BasePool = 10, float AttackDeltaMult = 1.0, float scaleMult = 1.0, bool InfinitePool = False)
{PoolDefender = (BasePool + (|-AttackDelta| * AttackDeltaMult) | 0)) * scaleMult }
	
	float pool 
	
	
	if infinitePool == False
	
		;int AttackDelta = CWCampaignS.GetCurrentAttackDelta() 
		;ATTACK DELTA IS NO LONGER BEING USED - IT WAS THE RELATIVE STRENGTH OF THE ATTACKER BASE ON THE SURROUNDING HOLDS HE OWNS ADJACENT TO THE CONTESTED HOLD. THERE IS NO CURRENT CAMPAIGN WITH CONTESTED HOLD ANYMORE
		;To make life easier for me, I'm just setting attack delta to 0 rather than restructuring all the logic

		int AttackDelta = 0
		
		if AttackDelta < 0

			pool = (BasePool + (Math.ABS(AttackDelta) * AttackDeltaMult)) * scaleMult
; 			CWScript.Log("CWReinforcementControllerScript", self + "SetPoolDefender() Pool[" + Pool +  "] = (BasePool[" + BasePool + "] + (Math.ABS(AttackDelta[" + AttackDelta + "]) * AttackDeltaMult[" + AttackDeltaMult + "])) * scaleMult[" + scaleMult + "]" )

			
		Else

			pool = BasePool * scaleMult		
; 			CWScript.Log("CWReinforcementControllerScript", self + "SetPoolDefender() Pool[" + Pool +  "] = BasePool[" + BasePool + "] * scaleMult[" + scaleMult + "]" )

		EndIf
		
		PoolDefender = pool as int
		StartingPoolDefender = pool as int
	
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + "SetPoolDefender() is making Defenders have an Infinite Pool.")
		setInfinitePools(AttackerHasInfinite = False, DefenderHasInfinite = True)	;doesn't set it to false, just doesn't set it to true
	
	EndIf
	
	CWs.CWPercentPoolRemainingDefender.setValue(100)
	PoolRemainingObjectiveQuest.UpdateCurrentInstanceGlobal(CWs.CWPercentPoolRemainingDefender)

	
; 	CWScript.Log("CWReinforcementControllerScript", self + "SetPoolDefender() PoolDefender = " + PoolDefender )
	
EndFunction

function shuffleSpawnMarkers()
{Promotes each spawn alias into the next position so that the first choice of respawn point is "randomized"}
	
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "shuffleSpawnAliases() shuffling Spawn Marker Aliases.")

	ObjectReference tempSpawn4
	tempSpawn4 = SpawnAttacker4
	SpawnAttacker4 = SpawnAttacker3
	SpawnAttacker3 = SpawnAttacker2
	SpawnAttacker2 = SpawnAttacker1
	SpawnAttacker1 = TempSpawn4
	
	tempSpawn4 = SpawnDefender4
	SpawnDefender4 = SpawnDefender3
	SpawnDefender3 = SpawnDefender2
	SpawnDefender2 = SpawnDefender1
	SpawnDefender1 = TempSpawn4

EndFunction


function SubtractFromAttackerPool(int NumSoldiersToSubtractBy = 1)
{This function subtracts the value of a soldier from the bool}		;Note: this is occasionally called externally when we need to modify the pool for some other reason than respawning a soldier

	if InfiniteRespawnAttacker == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "SubtractFromAttackerPool() calling ModifyPool().")
		ModifyPool(true, -(NumSoldiersToSubtractBy))
	
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + "SubtractFromAttackerPool() InfiniteRespawnAttacker == true, so NOT modifying the pool")
		
	EndIf
	
	
EndFunction

function SubtractFromDefenderPool(int NumSoldiersToSubtractBy = 1)
{This function subtracts the value of a soldier from the bool}		;Note: this is occasionally called externally when we need to modify the pool for some other reason than respawning a soldier
	
	if InfiniteRespawnDefender == False
; 		CWScript.Log("CWReinforcementControllerScript", self + "SubtractFromDefenderPool() calling ModifyPool().")
		ModifyPool(false, -(NumSoldiersToSubtractBy))
		
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + "SubtractFromDefenderPool() InfiniteRespawnDefender == true, so NOT modifying the pool")
		
	EndIf
	
EndFunction

function AddBackToAttackerPool(int NumSoldiersToAddBackBy = 1)
{This function subtracts the value of a soldier from the bool}		;Note: this is occasionally called externally to add back to the pool

; 	CWScript.Log("CWReinforcementControllerScript", self + "AddBackToAttackerPool() calling ModifyPool().")
	ModifyPool(true, NumSoldiersToAddBackBy)
	
EndFunction

function AddBackToDefenderPool(int NumSoldiersToAddBackBy = 1)
{This function subtracts the value of a soldier from the bool}		;Note: this is occasionally called externally to add back to the pool
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "AddBackToDefenderPool() calling ModifyPool().")
	ModifyPool(False, NumSoldiersToAddBackBy)
	
EndFunction

function ModifyPool(bool ModAttackerPool, int NumSoldiersToModifyBy)
{ModAttacker should be true if we are modifying attacker pool, false if modifying defender pool. NumSoldiersToModifyBy should be positve if adding to pool, or negative if subtracting from pool}
	int valueToModifyBy = CostForReinforcement * NumSoldiersToModifyBy
	
	float percentRemaningAttacker = PoolAttacker / StartingPoolAttacker
	float percentRemaningDefender = PoolDefender / StartingPoolDefender
	
	
	if ModAttackerPool
; 		CWScript.Log("CWReinforcementControllerScript", self + "ModifyPool() modifying attacker pool by: " + valueToModifyBy)
		PoolAttacker += valueToModifyBy
		CWs.CWReinforcementPoolAttacker.SetValue(PoolAttacker)
		if getStageDone(StageToSetIfAttacker25PercentRemainging) == false && percentRemaningAttacker <= 0.25
			setStage(StageToSetIfAttacker25PercentRemainging)
		EndIf
		
	Else ;we are modifying defender pool
; 		CWScript.Log("CWReinforcementControllerScript", self + "ModifyPool() modifying defender pool by: " + valueToModifyBy)
		PoolDefender += valueToModifyBy
		CWs.CWReinforcementPoolDefender.SetValue(PoolDefender)
		if getStageDone(StageToSetIfDefender25PercentRemainging) == false && percentRemaningDefender <= 0.25
			setStage(StageToSetIfDefender25PercentRemainging)
		EndIf
	EndIf

	ShowPoolsToPlayer()
	
EndFunction




function killOffscreenDefender()
;This function kills an offscreen soldier in the defender alias "array".
;This is called by CWFortSiege Interior Defender Aliases on Death to give a reward to attacker for killing an interior defender, because interior defenders don't respawn normally
;See CWFortSiegeInteriorDefenderScript
; 	CWScript.Log("CWReinforcementControllerScript", self + "killOffscreenDefender()")
	
	bool success
	
	if tryToKillOffscreenDefender(D1)
		success = true
	elseif tryToKillOffscreenDefender(D2)
		success = true
	elseif tryToKillOffscreenDefender(D3)
		success = true
	elseif tryToKillOffscreenDefender(D4)
		success = true
	elseif tryToKillOffscreenDefender(D5)
		success = true
	elseif tryToKillOffscreenDefender(D6)
		success = true
	elseif tryToKillOffscreenDefender(D7)
		success = true
	elseif tryToKillOffscreenDefender(D8)
		success = true
	elseif tryToKillOffscreenDefender(D9)
		success = true
	elseif tryToKillOffscreenDefender(D10)
		success = true
	elseif tryToKillOffscreenDefender(D11)
		success = true
	elseif tryToKillOffscreenDefender(D12)
		success = true
	elseif tryToKillOffscreenDefender(D13)
		success = true
	elseif tryToKillOffscreenDefender(D14)
		success = true
	elseif tryToKillOffscreenDefender(D15)
		success = true
	elseif tryToKillOffscreenDefender(D16)
		success = true
	elseif tryToKillOffscreenDefender(D17)
		success = true
	elseif tryToKillOffscreenDefender(D18)
		success = true
	elseif tryToKillOffscreenDefender(D19)
		success = true
	elseif tryToKillOffscreenDefender(D20)
		success = true
	EndIf

	if success
; 		CWScript.Log("CWReinforcementControllerScript", self + "killOffscreenDefender() found an offscreen defender and killed him.")
	Else
; 		CWScript.Log("CWReinforcementControllerScript", self + "killOffscreenDefender() could not find an offscreen defender so didn't kill anyone.", 1)	
	EndIf

EndFunction

bool function tryToKillOffscreenDefender(ReferenceAlias AliasToTryToKill)
	Actor AliasActor = AliasToTryToKill.GetActorReference()

	if AliasActor
		if AliasActor.IsDead() == false && AliasActor.IsInInterior() == False
			if Game.GetPlayer().IsInInterior() == True
				if AliasActor.GetParentCell() != Game.GetPlayer().GetParentCell()
; 					CWScript.Log("CWReinforcementControllerScript", self + "tryToKillOffscreenDefender() killing " + AliasActor + " in alias " + AliasToTryToKill)
					AliasActor.kill()
					Return True
				EndIf
			EndIf
		EndIf
	EndIf

; 	CWScript.Log("CWReinforcementControllerScript", self + "tryToKillOffscreenDefender() NOT killing " + AliasActor + " in alias " + AliasToTryToKill + "because he's not not dead, not in an exterior, the player isn't in an interior, or they are in the same interior.")	
	return False
	
EndFunction


int function getPoolExpressedAsSoldierCount(float Pool)
{returns Pool/Cost per soldier}

	int soldiers = math.floor(Pool / CostForReinforcement) as Int
	
	if soldiers < 0
		soldiers = 0
	EndIf

; 	CWScript.Log("CWReinforcementControllerScript", self + "getPoolExpressedAsSoldierCount() returning: " + soldiers)	
	
	return soldiers
	
EndFunction

function ShowPoolsToPlayer()
; 	CWScript.Log("CWReinforcementControllerScript", self + "ShowPoolsToPlayer() PoolAttacker=" + PoolAttacker +", PoolDefender=" + PoolDefender)	
	TryToShowAttackerPools()
	TryToShowDefenderPools()

EndFunction

int function GetThresholdCounter(float startingPool, float CurrentPool, float PercentThreshold = 5.0)
{Returns an int that when it "ticks" means it's time to show the pool to the player (for example every 5% of reinforcements)}

; 	CWScript.Log("CWReinforcementControllerScript", self + "GetThresholdCounter() startingPool: " + startingPool + ", CurrentPool: " + CurrentPool + ", PercentThreshold:" + PercentThreshold)	

	;convert pools to soldier counts incase we later change the cost per soldier
	startingPool = getPoolExpressedAsSoldierCount(startingPool)
	CurrentPool = getPoolExpressedAsSoldierCount(currentPool)
	
	;chunk the percentage into an integer we can compare to the last time
	float thresholdCounter = currentPool / startingPool * 100 / PercentThreshold
	
; 	CWScript.Log("CWReinforcementControllerScript", self + "GetThresholdCounter() returning: " + thresholdCounter as int)	
	
	return thresholdCounter as int
	
EndFunction

function TryToShowAttackerPools()

	int currentThresholdCounter
	
	if ShowAttackerPoolObjective
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToShowAttackerPools() will check to see if enough tickets were lost to display the number again.")	
		
		currentThresholdCounter = GetThresholdCounter(StartingPoolAttacker, PoolAttacker, 5)
		
		if ThresholdCounterPoolAttacker == -999  ;initialized value
			ThresholdCounterPoolAttacker = currentThresholdCounter
			ShowAttackerPool()
		EndIf
		
		if  currentThresholdCounter < ThresholdCounterPoolAttacker
			;then we've reached the next 5% threshold
			ThresholdCounterPoolAttacker -= 1
			ShowAttackerPool()
		Else
			;then we didn't reach the next 5% threshold so don't show the pool to the player
; 			CWScript.Log("CWReinforcementControllerScript", self + "TryToShowAttackerPools() found it's not yet time to display the number again. CurrentThresholdCounter: " + currentThresholdCounter + " is not > than ThresholdCounterPoolAttacker:" + ThresholdCounterPoolAttacker)	
			
		EndIf
	
	Else
		;we aren't supposed to show
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToShowAttackerPools() isn't supposed to show Attacker Pool.")	
	EndIf
	
EndFunction

function TryToShowDefenderPools()

	int currentThresholdCounter
	
	if ShowDefenderPoolObjective
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToShowDefenderPools() will check to see if enough tickets were lost to display the number again.")	
		
		currentThresholdCounter = GetThresholdCounter(StartingPoolDefender, PoolDefender, 7)
		
		if ThresholdCounterPoolDefender == -999  ;initialized value
			ThresholdCounterPoolDefender = currentThresholdCounter
			ShowDefenderPool()
		EndIf
		
		if  currentThresholdCounter < ThresholdCounterPoolDefender
			;then we've reached the next 5% threshold
			ThresholdCounterPoolDefender -= 1
			ShowDefenderPool()
		Else
			;then we didn't reach the next 5% threshold so don't show the pool to the player
; 			CWScript.Log("CWReinforcementControllerScript", self + "TryToShowDefenderPools() found it's not yet time to display the number again. CurrentThresholdCounter: " + currentThresholdCounter + " is not > than ThresholdCounterPoolDefender:" + ThresholdCounterPoolDefender)	
			
		EndIf
	
	Else
		;we aren't supposed to show
; 		CWScript.Log("CWReinforcementControllerScript", self + "TryToShowDefenderPools() isn't supposed to show Defender Pool.")	
	EndIf
	
EndFunction

function showAttackerPool()

	float percentRemaning = PoolAttacker / StartingPoolAttacker

; 	CWScript.Log("CWReinforcementControllerScript", self + "showAttackerPool() Attackers % Remaining =" + percentRemaning)	
	
	CWs.CWPercentPoolRemainingAttacker.setValue((percentRemaning * 100) as Int)
	PoolRemainingObjectiveQuest.UpdateCurrentInstanceGlobal(CWs.CWPercentPoolRemainingAttacker)

	
	if CWs.CWPercentPoolRemainingAttacker.GetValue() > 0
		PoolRemainingObjectiveQuest.SetObjectiveDisplayed(PoolRemainingAttackerObjective, true, true)
	Else
		PoolRemainingObjectiveQuest.SetObjectiveDisplayed(PoolRemainingAttackerObjective)
		PoolRemainingObjectiveQuest.SetObjectiveCompleted(PoolRemainingAttackerObjective)
	endif
	
	
EndFunction

function showDefenderPool()

	float percentRemaning = PoolDefender / StartingPoolDefender

; 	CWScript.Log("CWReinforcementControllerScript", self + "showDefenderPool() Defenders % Remaining =" + percentRemaning)	
	
	CWs.CWPercentPoolRemainingDefender.setValue((percentRemaning * 100) as Int)
	PoolRemainingObjectiveQuest.UpdateCurrentInstanceGlobal(CWs.CWPercentPoolRemainingDefender)

	
	if CWs.CWPercentPoolRemainingDefender.GetValue() > 0
		PoolRemainingObjectiveQuest.SetObjectiveDisplayed(PoolRemainingDefenderObjective, true, true)
	Else
		PoolRemainingObjectiveQuest.SetObjectiveDisplayed(PoolRemainingDefenderObjective)
		PoolRemainingObjectiveQuest.SetObjectiveCompleted(PoolRemainingDefenderObjective)
	endif
	
EndFunction
