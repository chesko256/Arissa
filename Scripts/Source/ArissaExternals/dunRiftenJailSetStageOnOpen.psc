scriptname dunRiftenJailSetStageOnOpen extends objectReference
{ Stops the guard forcegreet if you somehow manage to open the door in a way the dialogue doesn't handle.}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

Key property dunRiftenJailKey Auto

ObjectReference property FGGuard02 Auto
ObjectReference property FGGuard04 Auto

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
			if (self.GetOpenState() == 1 || self.GetOpenState() == 2) ; Open or opening
				if prereqStageOPT == -1 || MyQuest.getStageDone(prereqStageOPT) == 1
					;Run detection twice to wake up the system.
					Actor player = Game.GetPlayer()
					bool getDetected = player.IsDetectedBy(FGGuard02 as Actor) || player.IsDetectedBy(FGGuard04 as Actor)
					getDetected =player.IsDetectedBy(FGGuard02 as Actor) || player.IsDetectedBy(FGGuard04 as Actor)
					if (Game.GetPlayer().GetItemCount(dunRiftenJailKey) > 0 || !getDetected)
						myQuest.setStage(stage)
						gotoState("hasBeenTriggered")
					EndIf
				endIf
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE