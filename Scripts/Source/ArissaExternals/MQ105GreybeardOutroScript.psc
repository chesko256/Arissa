Scriptname MQ105GreybeardOutroScript extends DefaultSetStageOnEnter  
{wait for greybeards and player to be in position}

; what happens when all my targets are in the trigger?
; override on subclass to change behavior
function TriggerMe()
	; do nothing - will be triggered by the player's trigger, which will check this one to see if the Greybeards are in position
	; TRY - tell player's trigger that we're ready
	MQ105PlayerOutroTrigger.GreybeardsReady()
endFunction

; return true if all targets are in trigger
bool function IsTriggerReady()
	return ( GetCurrentTargetCount() >= GetTotalTargetCount() )
endfunction

MQ105PlayerOutroScript Property MQ105PlayerOutroTrigger  Auto  
