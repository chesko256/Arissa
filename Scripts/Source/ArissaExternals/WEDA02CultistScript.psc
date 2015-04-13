Scriptname WEDA02CultistScript extends ReferenceAlias  
import form 

quest property WEDA02 auto
book  property DA02book auto


Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if akTarget == game.getPlayer() && WEDA02.getstage() < 1
		WEDA02.setstage(1)
	endif
endEvent

Event onDeath(Actor AkKiller)
	if akKiller == Game.GetPlayer() || WEDA02.getstage() == 1
		WEDA02.setStage(1)
		WEDA02.setObjectiveDisplayed(10,1)
	endif

endEvent

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		WEDA02.setStage(1)
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	if akBaseItem == DA02book
		WEDA02.setObjectiveCompleted(10,1)
		WEDA02.stop()
	endif
endEvent
	