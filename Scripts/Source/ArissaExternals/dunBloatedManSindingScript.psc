ScriptName dunBloatedManSindingScript extends ReferenceAlias
{Scripts to manage and polish Sinding's behavior during DA05 / Bloated Man's Grotto.}

Quest property DA05 Auto
{DA05 quest.}

Quest property dunBloatedMansGrottoQST Auto
{Tracking quest for Bloated Man's Grotto.}

bool property isTryingToSaveSinding = True Auto
{Is the player on the 'Save Sinding' path?}

int property failsafeStage Auto
{If the player was trying to Save Sinding, but attacks him instead, set this stage to bail out and flip to the Kill Sinding path.}

Faction property PlayerFaction Auto
{Player's Faction}

Faction property SindingFaction Auto
{Sinding's Faction}

;Internally -- The player gets three 'accidental hits' on Sinding before we flip him and make him hostile.
int hits = 0

;Internally -- Track when Sinding last performed a 'quick response' attack.
float lastTimeAttacked = 0.0

;Internally -- Track whether Sinding is performing a 'quick response' attack.
bool isReacting = False

bool breakLoop


;Sinding needs more AI processing than usual because DA05's events are critically timing-dependent.
;Force an update of his package every 1s.
Event OnLoad()
	UpdateLoop()
EndEvent

Event OnUnload()
	breakLoop = True
EndEvent

Function UpdateLoop()
	While (!breakLoop && !Self.GetActorRef().IsDead())
		if (dunBloatedMansGrottoQST.GetStage() < 75)
			Self.GetActorRef().RestoreAV("Health", ((Self.GetActorRef().GetBaseAV("Health") / 100.0) * 5))
		EndIf
		Self.GetActorRef().EvaluatePackage()
		Utility.Wait(1)
	EndWhile
	breakLoop = False
EndFunction

;Sinding *could* just ignore the player's attacks. But instead:
;  - The player gets a couple of free 'accidental hits', since choosing to kill Sinding is a major decision for the quest.
;  - If the player attacks Sinding from close range, it felt better for him to briefly fight back in response before taking off again.
Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akAggressor == Game.GetPlayer())

		If (dunBloatedMansGrottoQST.GetStage() < 40) ;player is attacking before the forcegreet. After one hit, bail and go to kill path.
			DA05.SetStage(60)
			dunBloatedMansGrottoQST.SetStage(45)
		Else
			;Three free hits before Sinding switches over to being hostile.
			if (isTryingToSaveSinding && hits < 3)
				hits = hits + 1
			ElseIf (isTryingToSaveSinding)
				isTryingToSaveSinding = False
				dunBloatedMansGrottoQST.SetStage(failsafeStage)
			EndIf
			
			;Sinding can perform reactionary attacks under very tightly-controlled conditions.
			if (!isReacting && !isTryingToSaveSinding  && Game.GetPlayer().GetDistance(Self.GetReference()) < 256 && dunBloatedMansGrottoQST.GetStage() < 70 && Utility.GetCurrentRealTime() - lastTimeAttacked > 15)
				
				;Trigger a quick reaction attack. Variable07 is used to quash some of his combat override pacakges temporarily.
; 				;Debug.Trace("Start Reaction")
				isReacting = True
				SindingFaction.SetEnemy(PlayerFaction)
				Self.GetActorRef().SetActorValue("Variable07", 1)
				Self.GetActorRef().EvaluatePackage()
				Utility.Wait(3)
				Self.GetActorRef().SetActorValue("Variable07", 0)
				SindingFaction.SetAlly(PlayerFaction)
; 				;Debug.Trace("End Reaction")
				;Self.GetActorRef().StopCombat()
					
				;Abort Combats 1 & 2 after a Quick Reaction.
				if (dunBloatedMansGrottoQST.GetStage() == 55)
					dunBloatedMansGrottoQST.SetStage(56)
				ElseIf (dunBloatedMansGrottoQST.GetStage() == 65)
					dunBloatedMansGrottoQST.SetStage(66)
				EndIf
				
				Self.GetActorRef().EvaluatePackage()
				lastTimeAttacked = Utility.GetCurrentRealTime()
				isReacting = False
			EndIf
			Self.GetActorRef().EvaluatePackage()
		EndIf
	EndIf
endEvent


;Failsafe: If the player somehow kills Sinding early or in fewer than three hits, note the change to the Kill Sinding path.
Event OnDeath(Actor killer)
	isTryingToSaveSinding = False
EndEvent