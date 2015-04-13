Scriptname CWMission06Script extends CWMissionScript  Conditional
{Extends CWMissionScript which extends Quest}

Scene Property CWMission06Scene  Auto  

int Property KillLoyalists  Auto hidden Conditional
{1 = player suggested they kill the loyalists}

ReferenceAlias Property TurncoatLeader Auto

Keyword Property LocTypeHabitation Auto

int property TurncoatAliveCount auto Conditional hidden ;set in stage 0

int Property LoyalistAliveCount auto Conditional hidden ;set in stage 0 by calling getLoyalistAliveCount() Function


ActorBase Property CWMission06LoyalistLeaderImperial auto
ActorBase Property CWMission06DissaffectSoldierImperial1 auto
ActorBase Property CWMission06DissaffectSoldierImperial2 auto
ActorBase Property CWMission06DissaffectSoldierImperial3 auto

ActorBase Property CWMission06LoyalistLeaderSons auto
ActorBase Property CWMission06DissaffectSoldierSons1 auto
ActorBase Property CWMission06DissaffectSoldierSons2 auto
ActorBase Property CWMission06DissaffectSoldierSons3 auto



Event OnUpdate()

; ;	debug.trace("TurncoatLeader.GetReference():" + TurncoatLeader.GetReference())
; ;	debug.trace("TurncoatLeader.GetReference().GetParentCell():"+ TurncoatLeader.GetReference().GetParentCell())
; ;	debug.trace("TurncoatLeader.GetReference().GetParentCell().IsInterior():"+ TurncoatLeader.GetReference().GetParentCell().IsInterior())
	

	;if we are at the correct stage, the TurncoatLeader is outside, and the player is in the same location, then start the scene.
	if GetStage() == 20
		if TurncoatLeader.GetReference().IsInInterior() == false && Game.GetPlayer().IsInInterior() == False
			if TurncoatLeader.GetReference().GetCurrentLocation().IsSameLocation(Game.GetPlayer().GetCurrentLocation(), LocTypeHabitation)
				CWMission06Scene.start()
			
			endif
		
		EndIf
	EndIf

EndEvent


Function SetInitialLoyalistAliveCount( \
	ReferenceAlias LoyalistLeader, \
	ReferenceAlias Loyalist1, \
	ReferenceAlias Loyalist2, \
	ReferenceAlias Loyalist3, \
	ReferenceAlias Loyalist4, \
	ReferenceAlias Loyalist5, \
	ReferenceAlias Loyalist6, \
	ReferenceAlias Loyalist7, \
	ReferenceAlias Loyalist8, \
	ReferenceAlias Loyalist9, \
	ReferenceAlias Loyalist10, \
	ReferenceAlias Loyalist11, \
	ReferenceAlias Loyalist12 )
{Call once when quest starts to establish the LoyalistAliveCount property value}

;*** IF THE NUMBER OF LOYALIST ALIASES CHANGES, WE NEED TO CHANGE THIS FUNCTION ***

	LoyalistAliveCount = 0
	
	if Loyalist1.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist2.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist3.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist4.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist5.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist6.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist7.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist8.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist9.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist10.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist11.GetReference()
		LoyalistAliveCount += 1
	EndIf
	if Loyalist12.GetReference()
		LoyalistAliveCount += 1
	EndIf
	
	
EndFunction

Function DecrementLoyalistAliveCount()
	LoyalistAliveCount -= 1
	
	if loyalistAliveCount == 0
		setStage(100)
	EndIf
	
EndFunction

function DecrementTurncoatAliveCount()
	TurnCoatAliveCount -= 1
	
	if TurncoatAliveCount == 0
		setStage(205)
	EndIf
	
EndFunction

function processPreRevoltFactions(ReferenceAlias AliasToProcess)

	Actor ActorRef = AliasToProcess.GetActorReference()
	
	ActorRef.RemoveFromFaction(CWs.CWImperialFactionNPC)
	ActorRef.RemoveFromFaction(CWs.CWSonsFactionNPC)
	ActorRef.RemoveFromFaction(CWs.CWImperialFaction)
	ActorRef.RemoveFromFaction(CWs.CWSonsFaction)
	ActorRef.RemoveFromFaction(CWs.IsGuardFaction)
	ActorRef.addToFaction(CWs.CWDisaffectedSoldierFaction)


EndFunction

function processPostRevoltFactions(ReferenceAlias AliasToProcess)

	Actor ActorRef = AliasToProcess.GetActorReference()
	
	if CWs.PlayerAllegiance == CWs.iImperials
		ActorRef.addToFaction(CWs.CWImperialFactionNPC)
		ActorRef.addToFaction(CWs.CWImperialFaction)
		ActorRef.addToFaction(CWs.CrimeFactionImperial)
		ActorRef.SetCrimeFaction(CWs.CrimeFactionImperial)
		
	Else
	
		ActorRef.addToFaction(CWs.CWSonsFactionNPC)
		ActorRef.addToFaction(CWs.CWSonsFaction)
		ActorRef.addToFaction(CWs.CrimeFactionSons)
		ActorRef.SetCrimeFaction(CWs.CrimeFactionSons)
	
	EndIf
	
	ActorRef.RemoveFromFaction(CWs.CWDisaffectedSoldierFaction)
	ActorRef.addToFaction(CWs.IsGuardFaction)

EndFunction

function giveNewOutfit(Actor ActorRef)

	if CWs.PlayerAllegiance == CWs.iImperials
		ActorRef.setOutfit(CWs.CWSoldierImperialSoldierOutfit)
			
	Else
		ActorRef.setOutfit(CWs.CWSoldierSonsSoldierOutfit)
		
	EndIf

EndFunction

