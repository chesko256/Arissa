Scriptname MQ106Script extends Quest  Conditional

ObjectReference Property RoomMarker  Auto  
{used to trigger scene with Delphine when player enters rented room}

Location Property KynesgroveLocation  Auto  

Location Property RiverwoodLocation  Auto  


ObjectReference Property DragonResurrectMarker   Auto  

import Game
Event OnUpdate()

	; wait for dragon death sequence to finish
	if GetStageDone(155) == 1 && GetStageDone(160) == 0
		if Alias_Dragon.GetActorRef().IsInFaction(MQKillDragonFaction)
			setstage(160)
		else
			RegisterForSingleUpdate(1)
		endif
	endif

endEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
	; only registering for player to see Alduin, so we know what happened
	setstage(70)
endEvent

int Property RoomCost = 10 Auto  Conditional
{Cost of renting the room}

MiscObject Property Gold  Auto  

bool Property playerInRoom auto Conditional


ReferenceAlias Property Alias_Delphine  Auto  
ReferenceAlias Property Alias_Dragon  Auto  

Faction Property MQKillDragonFaction Auto

Location Property KynesgroveBurialMoundLocation  Auto  

bool Property dragonHitByShout auto Conditional


MQ00QuestScript Property MQ00  Auto  
