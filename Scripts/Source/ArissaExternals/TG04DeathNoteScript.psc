Scriptname TG04DeathNoteScript extends ReferenceAlias  Conditional

int Property pReadIt Auto

Quest Property pTG04Quest Auto

Event OnRead()

	if pReadIt == 0
		if pTG04Quest.GetStage() < 60
			pTG04Quest.SetStage(60)
			pTG04Quest.SetObjectiveCompleted(55,1)
			pReadIt = 1
		endif
	endif

endEvent

