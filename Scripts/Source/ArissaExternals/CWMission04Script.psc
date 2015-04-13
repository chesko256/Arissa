Scriptname CWMission04Script extends CWMissionScript  Conditional
{Extends CWMissionScript which extends Quest}

;int Property PrisonerFreed auto hidden Conditional ;OLD VERSION when there was only one prisoner you were sneaking out

Faction  Property CWMission04PrisonerFreedFaction Auto
Outfit Property CWMission04OutfitImperial Auto
Outfit Property CWMission04OutfitSons Auto

ReferenceAlias Property Friend Auto
ReferenceAlias Property Friendly1 Auto
ReferenceAlias Property Friendly2 Auto
ReferenceAlias Property Friendly3 Auto



ReferenceAlias Property Prisoner1 Auto
ReferenceAlias Property Prisoner2 Auto
ReferenceAlias Property Prisoner3 Auto
ReferenceAlias Property Prisoner4 Auto

Faction Property CWJobFortJailorFaction Auto

ReferenceAlias Property PrisonerDoor1 Auto

ReferenceAlias Property AttackMarker Auto

LocationAlias Property AttackPoint Auto

int Property followState auto hidden Conditional

Topic Property CWMission04PrisonerThanksTopic Auto

;used to do this just for Jailor, now will do this for any soldier alias that walks into the jail cell
function AddPrisonKey(Actor ActorToAddKeyTo)

	;MAKE SURE THE JAILOR HAS A KEY
	if ActorToAddKeyTo.IsInFaction(CWJobFortJailorFaction) &&  ActorToAddKeyTo.IsDead() == False
; 		CWScript.Log("CWMission04Script", self +  "AddPrisonKey() adding key to" + ActorToAddKeyTo)
		ActorToAddKeyTo.AddKeyIfNeeded(PrisonerDoor1.GetReference())
		
	Else
; 		CWScript.Log("CWMission04Script", self +  "AddPrisonKey() actor is not in CWJobJailorFaction, or is dead, so NOT adding key to" + ActorToAddKeyTo)
	EndIf

EndFunction



Function ForceAliasIntoFortJobAlias(ReferenceAlias AliasToCheck, ReferenceAlias GatekeeperAlias, ReferenceAlias JailorAlias, ReferenceAlias ExteriorPatrollerAlias)

	Actor ActorRef = AliasToCheck.GetActorReference()

	if CWs.IsPlayerInMyFaction(ActorRef) == false
	
		If ActorRef.IsInFaction(CWs.CWJobFortGatekeeperFaction)
; 			CWScript.Log("CWMission04Script", "ForceAliasIntoFortJobAlias() forcing " + ActorRef + " into Gatekeeper alias.")
			GatekeeperAlias.ForceRefTo(AliasToCheck.GetReference())
			
		ElseIf ActorRef.IsInFaction(CWs.CWJobFortJailorFaction)
; 			CWScript.Log("CWMission04Script", "ForceAliasIntoFortJobAlias() forcing " + ActorRef + " into Jailor alias.")
			JailorAlias.ForceRefTo(AliasToCheck.GetReference())
			
		ElseIf ActorRef.IsInFaction(CWs.CWJobFortPatrolExteriorFaction)
; 			CWScript.Log("CWMission04Script", "ForceAliasIntoFortJobAlias() forcing " + ActorRef + " into ExteriorPatroller alias.")
			ExteriorPatrollerAlias.ForceRefTo(AliasToCheck.GetReference())
			
		Else
; 			CWScript.Log("CWMission04Script", "ForceAliasIntoFortJobAlias() is NOT forcing " + ActorRef + " into any Fort Job aliases.")
			
		Endif	
		
	EndIf
	
EndFunction

function checkAllPrisonersKill()

	Actor Prisoner1Actor = Prisoner1.GetActorReference()
	Actor Prisoner2Actor = Prisoner2.GetActorReference()
	Actor Prisoner3Actor = Prisoner3.GetActorReference()
	Actor Prisoner4Actor = Prisoner4.GetActorReference()
	
	if GetStageDone(20) == false && Prisoner1Actor.IsDead() && Prisoner2Actor.IsDead() && Prisoner3Actor.IsDead() && Prisoner1Actor.IsDead()
; 		CWScript.Log("CWMission04Script", "checkAllPrisonersKill() found all the prisoners are dead.")
		setStage(21)
		
	Else
; 		CWScript.Log("CWMission04Script", "checkAllPrisonersKill() found stage 20 done, or all the prisoners are not dead.")
	
	EndIf
	
	checkForVictory()
	
EndFunction


function checkAllPrisonersFreed()
	Actor Prisoner1Actor = Prisoner1.GetActorReference()
	Actor Prisoner2Actor = Prisoner2.GetActorReference()
	Actor Prisoner3Actor = Prisoner3.GetActorReference()
	Actor Prisoner4Actor = Prisoner4.GetActorReference()
	
	if (Prisoner1Actor.IsDead() == true || Prisoner1Actor.IsInFaction(CWMission04PrisonerFreedFaction)) && \
		(Prisoner2Actor.IsDead() == true || Prisoner2Actor.IsInFaction(CWMission04PrisonerFreedFaction)) && \
		(Prisoner3Actor.IsDead() == true || Prisoner3Actor.IsInFaction(CWMission04PrisonerFreedFaction)) && \
		(Prisoner4Actor.IsDead() == true || Prisoner4Actor.IsInFaction(CWMission04PrisonerFreedFaction)) 
	
; 		CWScript.Log("CWMission04Script", "checkAllPrisonersFreed() found all the prisoners are in the CWMission04PrisonerFreedFaction, or are dead.")
	
		setStage(20)
	
	Else
	
; 		CWScript.Log("CWMission04Script", "checkAllPrisonersFreed() found all the prisoners are NOT in the CWMission04PrisonerFreedFaction and are not dead.")
	
	EndIf
	
	checkForVictory()
	
EndFunction

function moveFriendliesToAttackMarker()
; 	CWScript.Log("CWMission04Script", "moveFriendliesToAttackMarker()")
	
	ObjectReference AttackMarkerRef = AttackMarker.GetReference()
	
	Friend.GetReference().moveto(AttackMarkerRef)
	Friendly1.GetReference().moveto(AttackMarkerRef)
	Friendly2.GetReference().moveto(AttackMarkerRef)
	Friendly3.GetReference().moveto(AttackMarkerRef)


EndFunction


function checkForVictory()
	if GetStageDone(20) && AttackPoint.GetLocation().GetRefTypeAliveCount(CWs.CWSoldier) == 0 
; 		CWScript.Log("CWMission04Script", "checkForVictory() found stage 20 is done, and GetRefTypeAliveCount CWSoldier == 0, so player succeeded")
	
		setStage(50)
	
	EndIf

EndFunction


function PrisonerGearUp(Actor Prisoner)
;CALLED by CWMission04PrisonerGearUp PACKAGE's On End result script

; 	CWScript.Log("CWMission04Script", "PrisonerGearUp( " + Prisoner + ")")
	
;	debug.MessageBox(Prisoner + " is gearing up")
	
	Prisoner.SetFactionRank(CWMission04PrisonerFreedFaction, 1)

	if Prisoner.IsInFaction(CWs.CWImperialFaction)
		Prisoner.SetOutfit(CWMission04OutfitImperial)
		Prisoner.AddItem(CWs.CWSoldierImperialGear)
	Else
		Prisoner.SetOutfit(CWMission04OutfitSons)
		Prisoner.AddItem(CWs.CWSoldierSonsGear)
	EndIf
	
	followState = 1
	
	prisoner.EvaluatePackage()
	
EndFunction

function combatStarted(Actor Soldier, Actor akTarget, int aeCombatState)
; 	CWScript.Log("CWMission04Script", self +  "combatStarted(" + akTarget + ", " + aeCombatState + ")")

	if Soldier.IsInInterior() == false
		if akTarget == Game.GetPlayer() || Prisoner1.GetActorReference() || Prisoner2.GetActorReference() || Prisoner3.GetActorReference() || Prisoner4.GetActorReference()
			setStage(30)

	
		EndIf
	EndIf
	

EndFunction
