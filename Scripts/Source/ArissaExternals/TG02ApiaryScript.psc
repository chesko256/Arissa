scriptName TG02ApiaryScript extends ObjectReference

int property pTG02Boom auto
message property pTG02HiveMessage01 auto
Quest property pTG02Quest auto

Event OnDestructionStageChanged (int aiOldStage, int aiCurrentStage)

	if aiCurrentStage == 5
		pTG02HiveMessage01.Show()
		TG02QuestScript pTG02Script = pTG02Quest as TG02QuestScript
		pTG02Script.HiveGone()
		DamageObject(9999)
	endif

endEvent

