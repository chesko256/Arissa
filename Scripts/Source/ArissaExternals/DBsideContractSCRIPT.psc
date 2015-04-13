scriptName DBsideContractSCRIPT extends Actor
import objectReference
; This is intended to be a single script to control several DB scripts which are similar in nature

quest property DBsideContract auto				; define an editor-set variable for which quest this NPC is in

auto STATE actorAlive										; assume actor is alive by default
	EVENT onDeath(actor actor)
			if DBsideContract.getStage() == 10			; if I die while the contract is active...
				DBsideContract.setStage(20)				; advance stage 
				gotoState("actorDead")
			endif
	endEVENT
endSTATE

STATE actorDead
	; this actor is dead, so don't do a thing.
endSTATE
