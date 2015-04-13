ScriptName defaultActivateSelf extends objectReference
{Default script that simply activates itself when player enters trigger}

import game
import debug

bool property doOnce = TRUE auto
{Fire only once?  Default: TRUE}
bool property disableWhenDone = FALSE auto
{Disable after activating? Default: FALSE}
bool property playerOnly = TRUE auto
{Only Player Triggers?  Default: TRUE}
bool property playerAndAlliesOnly = False Auto
{Only player or Allies/Followers/Summons trigger? Overrides playerOnly if that's true as well.  Default: TRUE}
int property minLevel auto
{Optional: If set, player must be >= minLevel to activate this}

Faction property PlayerFaction Auto
Faction property CurrentFollowerFaction Auto
Package property Follow Auto
Package property FollowerPackageTemplate Auto


;************************************

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		; check whether we care if the player is activating
		if(actorRef == game.getPlayer() || (playerAndAlliesOnly && IsPlayerAlly(triggerRef)) || (playerOnly == False && playerAndAlliesOnly == False))
			; also check level (if we even care about that)
			if(minLevel == 0 || game.getPlayer().getLevel() >= minLevel)
				if doOnce == TRUE
					gotoState("allDone")
				endif
				if disableWhenDone
					Self.Disable()
				EndIf
				; per the description of this script, pass self as the activating ref
				activate(self)
			endif
		endif
	endEvent
endState

bool Function IsPlayerAlly(ObjectReference triggerObj)
	Actor triggerAct = (triggerObj as Actor)
	
	;Short-circuit this if this isn't an Actor at all, or if it's hostile to the player.
	if (triggerAct == None || triggerAct.GetFactionReaction(GetPlayer()) == 1)
		return False
	EndIf
	
	;Is this a summon or one of the various types of player followers?
	return ((triggerAct.IsCommandedActor()) || \
			(triggerAct.GetRelationshipRank(GetPlayer()) > 0) || \
			(triggerAct.IsInFaction(CurrentFollowerFaction)) || \
			(triggerAct.IsPlayerTeammate()) || \
			(triggerAct.GetCurrentPackage().GetTemplate() == Follow) || \
			(triggerAct.GetCurrentPackage().GetTemplate() == FollowerPackageTemplate))
EndFunction

;************************************

State allDone
	;do nothing
endState

;************************************