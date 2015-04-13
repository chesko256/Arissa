Scriptname dunPOIChickenNecromancerScript extends ObjectReference 

dunPOIChickenNecromancerNest property theSacredNest auto

EVENT OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if akTarget == game.getPlayer() && aeCombatState != 0
		; the player has interrupted me!
		if theSacredNest.done == FALSE
			theSacredNest.activate(self)
		endif
	endif
endEVENT
