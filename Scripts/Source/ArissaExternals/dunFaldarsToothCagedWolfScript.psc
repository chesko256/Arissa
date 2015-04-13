ScriptName dunFaldarsToothCagedWolfScript extends referenceAlias
;
;
;===============================================================

faction property factionToRemove auto

auto state waiting
	event onActivate(objectReference triggerRef)
; 		debug.Trace(self + " was activated by " + triggerRef)
		goToState("cageOpened")
	endEvent

endState

state cageOpened
	event onBeginState()
; 		debug.Trace(self + " has been removed from faction " + factionToRemove)
		self.getActorReference().removeFromFaction(factionToRemove)
	endEvent

endstate
