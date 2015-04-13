Scriptname DefaultNoEnemiesFollowDoorScript extends ObjectReference  
{Block activation by anyone other than the Player and their Followers to prevent interferance with scenes.}

; factions that are allowed to use the door
Faction Property AllowDoorFaction01  Auto  
Faction Property AllowDoorFaction02  Auto  
Faction Property AllowDoorFaction03  Auto 

Faction Property PlayerFollowerFaction Auto
Faction Property CurrentFollowerFaction Auto

Event OnInit()
	BlockActivation()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	; only do this check if activation is blocked
	if IsActivationBlocked() == false
; 		;debug.trace(self + "OnActivate " + akActionRef + " - not blocked, normal activation")
		return
	endif

	if (akActionRef == Game.GetPlayer())
; 		;debug.trace(self + "OnActivate - player, allow activation")
		Activate(akActionRef, true)
	else
		Actor actorRef = akActionRef as Actor
; 		;debug.trace(self + "OnActivate - " + actorRef)
		if (actorRef && (actorRef.isInFaction(AllowDoorFaction01) || actorRef.isInFaction(AllowDoorFaction02) || actorRef.isInFaction(AllowDoorFaction03) || actorRef.isInFaction(PlayerFollowerFaction) || actorRef.isInFaction(CurrentFollowerFaction)))
; 			;debug.trace(self + "OnActivate - " + actorRef + ": allow activation")
			Activate(akActionRef, true)
		else		
; 			;debug.trace(self + "OnActivate - " + actorRef + ": activation BLOCKED")
		endif
	endif
EndEvent