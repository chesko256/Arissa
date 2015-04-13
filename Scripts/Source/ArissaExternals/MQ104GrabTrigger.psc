Scriptname MQ104GrabTrigger extends DefaultSetStageOnEnter conditional
{used to check positioning of grab targets}

; what happens when all my targets are in the trigger?
; override on subclass to change behavior
function TriggerMe()
	; do nothing
endFunction

; return true if all targets are in trigger
bool function IsTriggerReady()
	return bAllTargetsInTrigger
endfunction