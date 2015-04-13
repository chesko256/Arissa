Scriptname _Arissa_SuppressDialogueTimerScript extends Quest  

GlobalVariable property _Arissa_Setting_SuppressDialogue auto

float SUPPRESSION_DURATION = 12.0

Event OnUpdateGameTime()
	_Arissa_Setting_SuppressDialogue.SetValueInt(1)
EndEvent

function SuppressDialogue()
	_Arissa_Setting_SuppressDialogue.SetValueInt(2)
	RegisterForSingleUpdateGameTime(SUPPRESSION_DURATION)
endFunction

function UnsuppressDialogue()
	_Arissa_Setting_SuppressDialogue.SetValueInt(1)
	UnregisterForUpdateGameTime()
endFunction