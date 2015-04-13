Scriptname CWWhiterunPlayerSkipSCRIPT extends ObjectReference  
{Updates how far ahead of the soldiers the player has progressed}

import game
import debug

;quest property getMyQuest auto
;CWSiegeWhiterunAttackQstSCRIPT myQuestScript


;int property skippedSection auto
;{How far the player has run ahead of the soldiers:
;1 = Skipped Archers
;2 = Skipped Gate
;3 = Skipped Drawbridge}

;auto STATE waitingForPlayer
;	EVENT onTriggerEnter(ObjectReference triggerRef)
;		if triggerRef == getPlayer() as actor
;			myQuestScript = getMyQuest as CWSiegeWhiterunAttackQSTSCRIPT
;			myQuestScript.GetSkippedSection(skippedSection)
;			GoToState("Triggered")
;		endif
;	endEVENT
;endSTATE

;STATE Triggered
	;empty state
;endSTATE
