Scriptname DefaultNoFollowDoorScript extends ObjectReference  
{block activation by non-quest NPCs to keep followers out}

Event OnInit()

	BlockActivation()

EndEvent

Event OnActivate(ObjectReference akActionRef)
	; only do this check if activation is blocked
	if IsActivationBlocked() == false
; 		debug.trace(self + "OnActivate " + akActionRef + " - not blocked, normal activation")
		return
	endif


	if (akActionRef == Game.GetPlayer())
; 		debug.trace(self + "OnActivate - player, allow activation")
		Activate(akActionRef, true)
	else
		Actor actorRef = akActionRef as Actor
; 		;debug.trace(self + "OnActivate - " + actorRef)
		if actorRef && (actorRef.isInFaction( AllowDoorFaction01) || actorRef.isInFaction(AllowDoorFaction02) || actorRef.isInFaction(AllowDoorFaction03) || (myQuest && myQuest.GetStageDone(myQuestStage) == 1))
; 			debug.trace(self + "OnActivate - " + actorRef + ": allow activation")
			Activate(akActionRef, true)
		else		
; 			debug.trace(self + "OnActivate - " + actorRef + ": activation BLOCKED")
			If DoOnce == 0
				FollowerBlockedMessage.Show()
				DoOnce = 1
			EndIf
		endif
	endif

EndEvent

; factions that are allowed to use the door
Faction Property AllowDoorFaction01  Auto  

Faction Property AllowDoorFaction02  Auto  

Faction Property AllowDoorFaction03  Auto 

Quest Property myQuest Auto

Int Property myQuestStage Auto 

Message Property FollowerBlockedMessage Auto 

Int Property DoOnce Auto