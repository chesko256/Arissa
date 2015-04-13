Scriptname MQ305Script extends Quest  Conditional

import Game

event OnUpdate()
	; wait for player to arrive near shout battle
	if GetStageDone(20) == 1 && GetStageDone(30) == 0
		if GetPlayer().GetDistance(ShoutBattleMarker) < 1000
			setstage(30)
		endif
	endif
	if !GetStageDone(30)
		RegisterForSingleUpdate(1)
	endif
endEvent

; threadsafe incrementing
function IncrementHeroShoutCount()
endFunction

; update mist clear count and reset HeroShoutCount
function ClearHeroShoutCount()
endfunction

; threadsafe incrementing
function IncrementShoutCount()
	MistClearCount = MistClearCount + 1
; 	debug.trace(self + " IncrementShoutCount to " + MistClearCount )
endFunction


function ClearShoutCount()
; 	debug.trace(self + " ClearShoutCount")
	MistClearCount = 0
	; test activating parent ref
	; do more later -- 2 and 3 are farther away from battle area, do those last
	FogActivateParent.Activate(ShoutBattleMarker)
	if GetStageDone(80)
		FogActivateParent2.Activate(ShoutBattleMarker)
	endif
	; try waiting to do this later
;	if GetStageDone(100)
;		FogActivateParent3.Activate(ShoutBattleMarker)
;	endif
endfunction


ObjectReference Property ShoutBattleMarker  Auto  
{marker for distance check}

int Property MistClearCount  Auto  Conditional
{counts how often all 3 heroes shout with player
to clear mist}

bool Property MistCleared Auto Conditional
{set to true when mist should be completely cleared}

Scene Property IntroScene  Auto  

ObjectReference Property FogActivateParent  Auto  
{parent activator for fog (to clear/reset during battle with Alduin)}

ObjectReference Property FogActivateParent2  Auto  

ObjectReference Property FogActivateParent3  Auto  

int Property LoopingDialogueCount  Auto  Conditional
