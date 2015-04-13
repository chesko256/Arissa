Scriptname MQ201MalbornQuestScript extends Quest  

event OnUpdateGameTime()
	; send caravan back to normal schedule
	SetStage(110)
	UnregisterForUpdateGameTime()
endEvent