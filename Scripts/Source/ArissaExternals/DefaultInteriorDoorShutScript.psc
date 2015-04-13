ScriptName DefaultInteriorDoorShutScript extends ObjectReference

bool Property SkipBehaviorDuringQuestStages Auto
{Default: false; if true, do not close and lock while quest stage is between X and Y of QuestToWatch}

Quest Property QuestToWatch Auto
{Default: None; which quest's stages to limit behavior during}

Int Property SkipBehaviorAtStage = 0 Auto
{Default: 0; which stage of QuestToWatch should we start skipping closing and locking behavior?}

int Property ResumeBehaviorAtStage = 0 Auto
{Default: 0; which stage of QuestToWatch should we resume closing and locking behavior?}

Event OnOpen(ObjectReference akActionRef)

	if SkipBehaviorDuringQuestStages == True
		int QuestStage = QuestToWatch.GetStage() 
		if QuestStage >= SkipBehaviorAtStage && QuestStage < ResumeBehaviorAtStage
; 			debug.trace(self + "OnOpen() skipping closing and locking because quest stages prohibit.")
			Return
		EndIf
	EndIf

	If (akActionRef != Game.GetPlayer())
; 		debug.trace(self + "OnOpen() by Non-Player Actor. Waiting 3, then closing and locking.")
		Utility.Wait(3)
		Self.SetOpen(False)
		Self.Lock()
	EndIf

EndEvent
