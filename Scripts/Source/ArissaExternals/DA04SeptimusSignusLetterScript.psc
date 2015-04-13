Scriptname DA04SeptimusSignusLetterScript extends ObjectReference  


Quest Property DA04 auto

Event OnRead()
; 	Debug.Trace("DA04: Player reading Septimus's letter.")
	if (DA04.GetStage() < 40)
		(DA04 as DA04QuestScript).SeptimusSentForPlayer = true
		DA04.SetObjectiveDisplayed(35)
	endif
EndEvent

