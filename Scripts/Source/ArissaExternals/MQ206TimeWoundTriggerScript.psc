Scriptname MQ206TimeWoundTriggerScript extends DefaultSetStageOnEnter  Conditional
{script to check when player is near Time Wound}

; what happens when all my targets are in the trigger?
; override on subclass to change behavior
function TriggerMe()
	; do nothing - quest is triggered by player reading Elder Scroll
endFunction

; return true if all targets are in trigger
bool function IsTriggerReady()
	return ( GetCurrentTargetCount() >= GetTotalTargetCount() )
endfunction


; try overriding parent functions

function modTargetCount(int modValue)
	; we know that player is the only target, so jump to that conclusion...
	; if increasing the count, player is entering
	if modValue > 0
		; if player has Elder Scroll, fire up the time wound
		if Game.GetPlayer().GetItemCount(DA04ElderScroll) > 0
; 			debug.trace(self + " player approaches with Elder Scroll - set fToggleBlend to 1")
			TimeWound.SetAnimationVariableFloat("fToggleBlend", 1)
		endif
	else
	; otherwise, exiting
		; calm down the time wound
		if Game.GetPlayer().GetItemCount(DA04ElderScroll) > 0
; 			debug.trace(self + " player exits with Elder Scroll - set fToggleBlend to 0")
			TimeWound.SetAnimationVariableFloat("fToggleBlend", 0)
		endif
	endif

	; now call parent
	parent.modTargetCount(modValue)
endFunction

ObjectReference Property TimeWound  Auto  

Book Property DA04ElderScroll  Auto  
