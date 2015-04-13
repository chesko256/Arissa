ScriptName MS01EltrysNoteScript extends ObjectReference

Quest Property MS01MiscObjectives Auto

auto State waiting
	Event OnRead()
		MS01MiscObjectives.SetStage(20)
		GoToState("allDone")
	EndEvent

endState

State allDone
	;do nothing
endState