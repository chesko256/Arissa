Scriptname MQ103QuestScript extends Quest  Conditional
{NOW IS CW02a/b - Was main quest script - used on both MQ103A and MQ103B, assuming I'm careful to keep the stages matched up...}

Location Property KorvanjundLocation  Auto  

Quest Property CW03 Auto

;event OnUpdate()
; ;;	debug.trace(self + "updating...")
;	;; when player leaves headquarters city
;	if getStageDone(30) == 1 && getStageDone(40) == 0
; ;;		debug.trace("MQ103 - waiting for player to leave city")
;		if Game.GetPlayer().IsInLocation(HQCityLocation) == 0
; ;			debug.trace("MQ103 - setstage 40")
;			setstage(40)
;		endif
;	endif
;
;endEvent


GlobalVariable Property ExteriorDefenderTotal Auto  
{How many exterior defenders were placed?}

GlobalVariable Property ExteriorDefenderDeadCount Auto  
{How many exterior defenders are dead?}

function IncrementDefenderDeadCount(Actor deadDefender)
; 	debug.trace(self + " IncrementDefenderDeadCount, called by " + deadDefender)
; 	debug.trace("BEFORE: ExteriorDefenderDeadCount=" + ExteriorDefenderDeadCount.value)
	ModObjectiveGlobal(1, ExteriorDefenderDeadCount)
	if ExteriorDefenderDeadCount.value >=  ExteriorDefenderTotal.value
		SetStage(60)
	endif
; 	debug.trace("AFTER: ExteriorDefenderDeadCount=" + ExteriorDefenderDeadCount.value)
endFunction

GlobalVariable Property DraugrTotal Auto  
{How many draugr were placed?}

GlobalVariable Property DraugrDeadCount Auto  
{How many draugr  are dead?}

function IncrementDraugrDeadCount(Actor deadDefender)
; 	debug.trace(self + " IncrementDraugrDeadCount, called by " + deadDefender)
; 	debug.trace("BEFORE: DraugrDeadCount=" + DraugrDeadCount.value)
	ModObjectiveGlobal(1, DraugrDeadCount)
	if DraugrDeadCount.value >= DraugrTotal.value
		SetStage(160)
	endif
; 	debug.trace("AFTER: DraugrDeadCount=" + DraugrDeadCount.value)
endFunction


;********** Korvanjund properties ***********
scene Property ExteriorAttack  Auto  
scene Property InteriorAttack  Auto  
scene Property InteriorAttack02  Auto  
ObjectReference Property LockedDoor01  Auto  

ReferenceAlias Property Leader Auto  
ReferenceAlias Property Friendly01 Auto
ReferenceAlias Property Friendly02 Auto

ObjectReference Property LeaderGateMoveTo  Auto  
ObjectReference Property Friendly01GateMoveTo  Auto  
ObjectReference Property Friendly02GateMoveTo  Auto  


Location Property HQCityLocation  Auto  
{city location, for knowing when player is on the way to Korvanjund}

ObjectReference Property KorvanjundMapMarker  Auto  

scene Property MQ103aInteriorAttack03  Auto  

int Property draugrCount  Auto  Conditional

int Property draugrObjAmount  Auto  Conditional

scene Property MQ103aBookRoom  Auto  

ObjectReference Property RespawnPoint  Auto  

ObjectReference Property RespawnMoveTo10  Auto  

ObjectReference Property RespawnMoveTo20  Auto  

ObjectReference Property RespawnMoveTo30  Auto  

ObjectReference Property RespawnMoveTo40  Auto  

ObjectReference Property RespawnMoveTo50  Auto  

Weapon Property Warhammer  Auto  

Scene Property ExteriorIntro  Auto  
{intro scene for leader arriving at meeting point}

Quest Property CW01SolitudeMapTableScene Auto

faction Property dunPrisonerFaction  Auto  

Faction Property CWBuddies  Auto  

CWScript Property CWs  Auto  

Quest Property MQ102A  Auto  

Quest Property MQ102B  Auto  
