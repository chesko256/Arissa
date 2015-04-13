Scriptname CWAttackCityConfrontationTriggerScript extends ReferenceAlias  
{Script on ConfrontationTriggerbox alias in CWAttackCity quest - starts the confrontation scene with the Jarl, housecarl, and bodyguards}

CWScript Property CWs Auto

int Property StageToCallToStartConfrontationScene Auto


Actor Property GalmarRef Auto
Actor Property RalofRef Auto

Faction Property CWImperialFaction Auto

Event OnTriggerEnter(ObjectReference akActionRef)

; 	debug.trace("CWAttackCityConfrontationTriggerScript OnTriggerEnter()")

	actor actorRef = akActionRef as Actor
	actor PlayerRef = Game.GetPlayer()
	
	if GetOwningQuest().GetStageDone(StageToCallToStartConfrontationScene) == False && akActionRef == PlayerRef
		GetOwningQuest().setStage(StageToCallToStartConfrontationScene)
	endif
	
	
	
	;***ASSUMES THIS IS WHITERUN BECAUSE THATS THE ONLY PLACE FOR SIEGES NOW***
	;See - CWAttackCityDragonReachDoor for why we are doing this
	PlayerRef.RemoveFromFaction(CWImperialFaction)
	GalmarRef.RemoveFromFaction(CWImperialFaction)
	RalofRef.RemoveFromFaction(CWImperialFaction)
	
EndEvent

