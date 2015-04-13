Scriptname CWGovernmentScript extends Quest  
{Extends Quest}

Faction Property GovImperial auto
Faction Property GovSons Auto
Faction Property GovRuling Auto
Faction Property GovExiled Auto

ReferenceAlias Property RulingMarker Auto
ReferenceAlias Property ExiledImperialMarker Auto
ReferenceAlias Property ExiledSonsMarker Auto

LocationAlias Property RulingHQ Auto

Keyword Property CWOwner Auto

CWResetGarrisonScript property CWResetGarrison1 auto
CWResetGarrisonScript property CWResetGarrison2 auto
CWResetGarrisonScript property CWResetGarrison3 auto
CWResetGarrisonScript property CWResetGarrison4 auto
CWResetGarrisonScript property CWResetGarrison5 auto
CWResetGarrisonScript property CWResetGarrison6 auto
CWResetGarrisonScript property CWResetGarrison7 auto
CWResetGarrisonScript property CWResetGarrison8 auto


Function ProcessAlias(ReferenceAlias AliasToCheck)
{Checks Alias's factions against the current owner of the RulingHQ and installs or exiles them accordingly.}
; 	debug.Trace(self + "ProcessAlias() AliasToCheck (" + AliasToCheck + "):" + AliasToCheck.GetReference() + " ... ")
	
	If AliasToCheck.GetReference() == None
		;Alias is empty, do nothing
; 		debug.Trace(self + "ProcessAlias() AliasToCheck (" + AliasToCheck + ").GetReference() is NONE, skipping. ")
		
		Return
		
	EndIf
	
	Actor ActorToCheck = AliasToCheck.GetActorReference()
	int owningFaction  = RulingHQ.GetLocation().GetKeywordData(CWOwner) as Int
	
	
	if owningFaction == 1 	;Imperials are in control
		if actorToCheck.IsInFaction(GovImperial)
			if actorToCheck.IsInFaction(GovRuling) == False
				installActor(actorToCheck)
			EndIf
		Elseif actorToCheck.IsInFaction(GovSons) ;is in GovSons and not also in GovImperial
			if actorToCheck.IsInFaction(GovRuling) == True
				exileActor(actorToCheck)
			EndIf
		EndIf
		
	Elseif owningFaction == 2 	;Sons are in control
		if actorToCheck.IsInFaction(GovSons)
			if actorToCheck.IsInFaction(GovRuling) == False
				installActor(actorToCheck)
			EndIf
		Elseif actorToCheck.IsInFaction(GovImperial) ;is in GovImperial and not also in GovSons
			if actorToCheck.IsInFaction(GovRuling) == True
				exileActor(actorToCheck)
			EndIf
		EndIf
	
	Else
; 		debug.Trace(self + "ProcessAlias() expects 1 or 2 for CWOwner data on RulingHQ location, instead got: " + owningFaction)
	
	EndIf


EndFunction

Function InstallActor(Actor actorToCheck)
{Removes from exiled faction, adds to ruling faction, and moves to ruling marker.}


	Actor playerActor = Game.GetPlayer()

	actorToCheck.RemoveFromFaction(GovExiled)
	actorToCheck.addToFaction(GovRuling)
	actorToCheck.moveto(RulingMarker.GetReference())
	actorToCheck.Enable()	;Added 4/12/2011, untested. This is for the Winterhold government who starts off disabled.
	

	
	if actorToCheck.GetRelationshipRank(playerActor) < 2
		actorToCheck.SetRelationshipRank(playerActor, 2) 
	EndIf
	
; 	debug.Trace(self + "InstallActor() " + actorToCheck + " Removing from GovExiled, adding to GovRuling, setting relationship rank with player to 2 if less than, and moving to RulingMaker:" + RulingMarker.GetReference())
EndFunction


Function ExileActor(Actor actorToCheck)
{Removes from ruling faction, adds to exiled faction, and moves to exiled marker.}

	ObjectReference ExiledMarkerRef
	Actor playerActor = Game.GetPlayer()
	
	if actorToCheck.IsInFaction(GovImperial)
		ExiledMarkerRef = ExiledImperialMarker.GetReference()
	elseif actorToCheck.IsInFaction(GovSons)
		ExiledMarkerRef = ExiledSonsMarker.GetReference()	
	Else
; 		debug.Trace(self + "WARNING: ExileActor(" + actorToCheck + ") is not in either GovImperial nor GovSons. Can't move him to exiled location.")

	EndIf

	actorToCheck.RemoveFromFaction(GovRuling)
	actorToCheck.addToFaction(GovExiled)
	
	if actorToCheck.IsDead()
; 		debug.Trace(self + "ExileActor() " + actorToCheck + " is dead, so we aren't moving him to the exile marker")

	Else
		actorToCheck.moveto(ExiledMarkerRef)
	EndIf
		
	if actorToCheck.GetRelationshipRank(playerActor) > -1
		actorToCheck.SetRelationshipRank(playerActor, -1) 
	EndIf
	
; 	debug.Trace(self + "ExileActor() " + actorToCheck + " Removing from GovRuling, adding to GovExiled, setting relationship rank with player to -1 if more than, and moving to Exiled Marker:" + ExiledMarkerRef)


EndFunction


Function MoveActorToExileMarker(Actor ActorToMove)
;not quite as thorough as ExileActor() -- called by CWEscapeCityEscapeDoorScript (from EscapeDoor alias in CWEscapeCity quest), ExileActor will eventually  be called anyway so we are just moving him for now
	
	ObjectReference ExiledMarkerRef
	
	if ActorToMove.IsInFaction(GovImperial)
		ExiledMarkerRef = ExiledImperialMarker.GetReference()
	elseif ActorToMove.IsInFaction(GovSons)
		ExiledMarkerRef = ExiledSonsMarker.GetReference()	
	Else
; 		debug.Trace(self + "WARNING: MoveActorToExileMarker(" + ActorToMove + ") is not in either GovImperial nor GovSons. Can't move him to exiled location.")

	EndIf
	
	ActorToMove.moveto(ExiledMarkerRef)


EndFunction

function sendCallBackToResetGarrisonQuests()

; 	debug.Trace(self + "sendCallBackToResetGarrisonQuests()")

	CWResetGarrison1.WaitingForCallBackFromCWGovernment = false
	CWResetGarrison2.WaitingForCallBackFromCWGovernment = false
	CWResetGarrison3.WaitingForCallBackFromCWGovernment = false
	CWResetGarrison4.WaitingForCallBackFromCWGovernment = false
	CWResetGarrison5.WaitingForCallBackFromCWGovernment = false
	CWResetGarrison6.WaitingForCallBackFromCWGovernment = false
	CWResetGarrison7.WaitingForCallBackFromCWGovernment = false
	CWResetGarrison8.WaitingForCallBackFromCWGovernment = false

endFunction


