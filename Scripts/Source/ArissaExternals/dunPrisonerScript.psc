ScriptName dunPrisonerScript extends objectReference

import game
import debug

ObjectReference property Prisoner auto
Faction Property PrisonerFaction auto

auto State waiting
	Event onOpen(ObjectReference triggerRef)
		Actor PrisonerRef = Prisoner as Actor
			PrisonerRef.setAV("Aggression", 2)
			PrisonerRef.RemoveFromAllFactions()
			PrisonerRef.AddToFaction(PrisonerFaction)
			PrisonerRef.EvaluatePackage()
			gotoState("allDone")
	endEvent
endState
	 
State allDone
	;do nothing
endState
	