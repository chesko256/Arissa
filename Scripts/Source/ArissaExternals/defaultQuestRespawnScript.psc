Scriptname defaultQuestRespawnScript extends Quest  
{simple script to respawn aliases}

import Utility
import debug

; Respawn markers
ObjectReference Property RespawnMarker1 Auto  

ObjectReference Property RespawnMarker2 Auto  

ObjectReference Property RespawnMarker3 Auto  

ObjectReference Property RespawnMarkerFailsafe  Auto  
{this is where I will respawn if player has LOS
on other respawn points}


int Property startStage = 0  Auto  
{Quest stage that needs to be set for respawning
to start}

int Property doneStage = 0  Auto  
{Respawning will stop if this stage is set}


int Property respawnTimeMin = 5 Auto
{min time between death and respawn}

int Property respawnTimeMax = 10 Auto
{max time between death and respawn}

int Property respawnPool = 0 Auto
{how many NPCs can be respawned?
0 = infinite
}

int respawnCount = 0
;how many NPCs have been respawned?


; this will always respawn (ignores all the checks and waits)
; (this is what TryToRespawn calls when ready to respawn)
function Respawn(ReferenceAlias aliasToRespawn)
		; respawn me and force me into my alias
		; totally unnecessary but nice randomization of which point to choose
		int startingRoll = RandomInt(1, 3)
; 		traceConditional(self + " rolling for respawn spot... " + startingRoll, debugFlag.value)
		ObjectReference marker
		if startingRoll == 1
			marker = GetRespawnMarker(RespawnMarker1, RespawnMarker2, RespawnMarker3)
		elseif startingRoll == 2
			marker = GetRespawnMarker(RespawnMarker2, RespawnMarker3, RespawnMarker1)
		else
			marker = GetRespawnMarker(RespawnMarker3, RespawnMarker1, RespawnMarker2)
		endif
; 		traceConditional(self + " respawning at " + marker, debugFlag.value)

		; only respawn if current alias is actually dead
		if aliasToRespawn.GetActorRef().IsDead()
			aliasToRespawn.ForceRefTo(marker.PlaceAtMe( aliasToRespawn.GetActorRef().GetActorBase() ) )
; 			traceConditional(self + " Respawn done", debugFlag.value)
		else
; 			traceConditional(self + " Didn't respawn - current actor isn't dead!", debugFlag.value)
		endif
endFunction

; call this when you want to try to respawn
function TryToRespawn(ReferenceAlias aliasToRespawn)
; 	traceConditional(self + " Respawn called by " + aliasToRespawn, debugFlag.value)
	if ( startStage == 0 || (startStage > 0 && GetStageDone(startStage)) ) && ( doneStage == 0 || ( doneStage > 0 && !GetStageDone(doneStage) ) ) && ( respawnPool == 0 || (respawnPool > 0 && respawnCount < respawnPool ) )
		respawnCount = respawnCount + 1
		; wait for respawn time
; 		traceConditional(self + " Waiting to respawn...", debugFlag.value)
		Wait( RandomInt(respawnTimeMin, respawnTimeMax) )
; 		traceConditional(self + " Finding a respawn spot", debugFlag.value)
		if (aliasToRespawn as defaultAliasRespawnScript).bRespawningOn
			Respawn(aliasToRespawn)
		else
; 			traceConditional(self + " Didn't respawn " + aliasToRespawn + " - current actor no longer set to respawn", debugFlag.value)
		endif
	endif
endFunction

ObjectReference function GetRespawnMarker(ObjectReference marker1, ObjectReference marker2, ObjectReference marker3)
	; find a spot the player can't see
	actor playerActor = Game.GetPlayer() as actor
	
	if marker1 && playerActor.HasLOS(marker1) == False
		return marker1
	elseif marker2 && playerActor.HasLOS(marker2) == False
		return marker2
	elseif marker3 && playerActor.HasLOS(marker3) == False
		return marker3
	else
		return RespawnMarkerFailsafe
	endif

endFunction

GlobalVariable Property debugFlag  Auto  
{optional - set a global to turn on debug trace
messages}
