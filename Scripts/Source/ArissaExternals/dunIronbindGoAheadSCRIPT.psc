scriptname dunIronbindGoAheadSCRIPT extends objectReference
{Move markers up to keep AI on a more intelligent-seeming path}

objectReference property BeemJaGoalMarker auto
objectReference property SalmaGoalMarker auto

keyword property BeemJaLink auto
keyword property SalmaLink auto

quest property dunIronbindQST auto

auto STATE ready
	EVENT onTriggerEnter(ObjectReference actronaut)
		if actronaut == game.getPlayer() && dunIronbindQST.getStage() >= 30
			BeemJaGoalMarker.moveTo(self.getLinkedRef(BeemJaLink))
			SalmaGoalMarker.moveTo(self.getLinkedRef(SalmaLink))
; 			debug.trace("self = "+self)
; 			debug.trace("BeemJaGoalMarker = "+BeemJaGoalMarker)
; 			debug.trace("BeemJaLink = "+self.getLinkedRef(BeemJaLink))
; 			debug.trace("SalmaGoalMarker = "+SalmaGoalMarker)
; 			debug.trace("SalmaLink = "+self.getLinkedRef(SalmaLink))
			
			; access the quest frag script to EVP NPC aliases
			QF_dunIronbindQST_0006CD54 questScript = dunIronbindQST as QF_dunIronbindQST_0006CD54
			objectReference BeemJaREF = questScript.Alias_Beem_Ja.getReference()
			(beemJaREF as actor).evaluatePackage()
			objectReference SalmaREF = questScript.Alias_Salma.getReference()
			(SalmaREF as actor).evaluatePackage()
			
			gotoState("inactive")
		endif
	endEVENT
endSTATE

STATE inactive
	; nothing happens here
endSTATE
