Scriptname DA02StartCombatScript extends ReferenceAlias  
{Handles making Cultists aggressive if the player starts combat}

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if akTarget == Game.GetPlayer() && aeCombatState > 0
; 		debug.trace("DA02StartCombatScript OnCombatStateChanged(Player, > 0) will call MakeCultistsAggressive()")
		(GetOwningQuest() as DA02Script).MakeCultistsAggressive()
	EndIf

EndEvent

