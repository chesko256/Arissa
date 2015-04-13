ScriptName dunHagsEndHagravenBattleTrigger extends objectReference
{Trigger script for the progressive Hagraven boss battle in Hag's End.}

;The Hagraven boss in Hag's End.
ObjectReference property Hagraven Auto

;If True, this trigger aborts the current combat phase. If False, this trigger sets up the next combat phase.
;Since the dungeon is linear, the player will always hit these in order.
bool property isBypassTrigger Auto

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer())
			gotoState("allDone")
			if (isBypassTrigger)
; 				;Debug.Trace("Hit Bypass Trigger.")
				(Hagraven as dunHagsEndHagravenBattleManager).BypassCombat()
			Else
; 				;Debug.Trace("Hit Setup Trigger.")
				(Hagraven as dunHagsEndHagravenBattleManager).SetupCombat()
			EndIf
		endif
	endEvent
endState

State allDone
	Event OnReset()
		GoToState("Waiting")
	EndEvent
endState
