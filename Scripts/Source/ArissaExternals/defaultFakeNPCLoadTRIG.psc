scriptname defaultFakeNPCLoadTRIG extends objectReference
{Script for disabling an NPC when that NPC hits the trigger.  Can set a stage when this happens}
;=================================================================
quest property myQuest auto
{the quest, if relevant, this trigger is used for}
int property preRequisiteStage = -1 auto
{if any, stage that must be set for this trigger to function}
int property StageToSet auto
{if any, stage to set when the specified NPC is disabled by hitting this trigger}
actorBase property NPCtoDisable auto
{NPC is disabled on trigger. Intention is to fake a load door}
;=================================================================
auto STATE waiting
	EVENT onTriggerEnter(objectReference actronaut)
; 		debug.trace(self + " was triggered by " + actronaut + ", which is a " + actronaut.getBaseObject())
		; see if this is the right actor and make sure it isn't a corpse
		if actronaut.getBaseObject() == NPCtoDisable && (actronaut as actor).isDead() == false
			if myQuest != NONE
				; check conditions
				if (preRequisiteStage != -1 && myQuest.getStageDone(preRequisiteStage) == true) || (preRequisiteStage == -1)
					myQuest.setStage(stageToSet)
					; fade out the actor we care about
					actronaut.disable(true)
					; change states and let the trigger commit suicide
					gotoState("finished")
				endif
			else
				; myQuest must == NONE, so just roll with it as all other data is now irrelevant
				actronaut.disable(true)
				gotoState("finished")
			endif
		endif
	endEVENT
endSTATE
;=================================================================
STATE finished
	EVENT onBeginState()
		self.disable()
		self.delete()
	endEVENT
endSTATE
