Scriptname MQ201EmbassyFrontDoorScript extends ObjectReference  
{block activation by non-quest NPCs to keep followers out}

event OnLoad()
	; relock if prior to quest unlocking
	if MQ201.GetStageDone(102) == 0
		Lock(true)
	endif
endEvent

Event OnActivate(ObjectReference akActionRef)
	; only do this check if activation is blocked
	if IsActivationBlocked() == false
; 		debug.trace(self + "OnActivate " + akActionRef + " - not blocked, normal activation")
		return
	endif

	bool bAllowActivation = false

	if (akActionRef == Game.GetPlayer())
; 		debug.trace(self + "OnActivate - player, allow activation")
		bAllowActivation = true
	else
		Actor actorRef = akActionRef as Actor
; 		debug.trace(self + "OnActivate - " + actorRef)
		if actorRef && (actorRef.isInFaction( MQ201PartyGuestFaction) || actorRef.isInFaction(ThalmorFaction) || actorRef.isInFaction(MQMalbornFaction) )
; 			debug.trace(self + "OnActivate - " + actorRef + ": allow activation")
			bAllowActivation = true
		else
; 			debug.trace(self + "OnActivate - " + actorRef + ": activation BLOCKED")
		endif
	endif

	if bAllowActivation
; 		debug.trace(self + "OnActivate - " + akActionRef + " Activate()")
		Activate(akActionRef, true)
	endif
EndEvent

; factions that are allowed to use the door
Faction Property MQ201PartyGuestFaction  Auto  

Faction Property ThalmorFaction  Auto  

Faction Property MQMalbornFaction  Auto  

Quest Property MQ201 Auto
