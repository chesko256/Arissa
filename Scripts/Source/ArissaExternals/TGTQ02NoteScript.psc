Scriptname TGTQ02NoteScript extends ReferenceAlias  Conditional

TGTQ02QuestScript Property pTGTQ02QS  Auto  Conditional

Event OnRead()

	if pTGTQ02QS.pTGTQ02NoteRead == 0
		pTGTQ02QS.pTGTQ02NoteRead = 1
	endif

endEvent
