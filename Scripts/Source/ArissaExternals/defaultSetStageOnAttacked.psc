scriptName defaultSetStageOnAttacked extends actor
{Set stage on specificed quest when this actor is attacked. Optionally restricted to the player.}

quest property myQST auto
{quest to set stage upon}

int property preReqStage = -1 auto
{(Optional)Stage that must be set for this script to run. Default: NONE}

int property minNumberHits = 1 auto
{Minimum number of hits required to trigger the stage set. Allows for some leniancy, if desired.}

;Internally -- Actual number of hits received.
int actualHits = 0

int property StageToSet auto
{Set this stage when the actor dies}

bool property playerOnly auto
{Set this stage only if the actor is attacked by the player.}

auto STATE waiting
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (aggressor == Game.GetPlayer() || !playerOnly)
		if preReqStage == -1 || myQST.getStageDone(preReqStage) == TRUE
			actualHits = actualHits + 1
			if (actualHits >= minNumberHits)
				myQST.setStage(stageToSet)
				gotoState("inactive")
			EndIf
		elseif preReqStage != -1 && myQST.getStageDone(preReqStage) == FALSE
; 			debug.trace(self + " was killed before stage " + preReqStage + " of " + myQST + " was set")
		else
; 			debug.trace(self + " got defaultSetStageOnAttacked script into a bad state!")
		endif
	EndIf
endEVENT
endSTATE

STATE inactive
endSTATE

