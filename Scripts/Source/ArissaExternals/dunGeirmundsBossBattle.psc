scriptName dunGeirmundsBossBattle extends ReferenceAlias
{ Boss Battle script for Sigdus Gauldurson in Geirmund's Hall. }

;Tracking quest.
Quest property dunGeirmundsQST auto

;Reference to the Blackbow, to prevent Sigdis from unequipping it.
;Commented out because this was creating duplicates in some cases...
;Weapon property GauldurBlackbow Auto

;Secret Exit
ObjectReference property SecretDoor Auto

;Duplicates
Actor property Duplicate1Actor Auto
Actor property Duplicate2Actor Auto
ReferenceAlias property Duplicate1Alias Auto
ReferenceAlias property Duplicate2Alias Auto
ObjectReference property Duplicate1SetupPoint Auto
ObjectReference property Duplicate2SetupPoint Auto
ActorBase property DuplicateActorBase Auto
int property DuplicateLevelMod Auto
EncounterZone property DuplicateEncZone Auto
Location property GeirmundsHallLocation Auto

;Teleport Points
ObjectReference property Position1 Auto
ObjectReference property Position2 Auto
ObjectReference property Position3 Auto
ObjectReference property Position4 Auto

;VFX
Activator property SummonFX Auto
Activator property BanishFX Auto
Spell property Dispel Auto
ReferenceAlias property SummonFXManager Auto
ReferenceAlias property BanishFXManager Auto

;TrapLinker controlling the scene that locks the player in place.
ObjectReference property HoldingLinker Auto

;State Tracking 
float lastDuplicationTime = 0.0
int threshold = 0
int duplicationUses = 0
int duplicationUsesLastThreshold = 0
bool duplicationOngoing = False
bool inUpdateLoop = False
bool blockHitTesting = False


;The battle begins when the player releases Sigdis.
Event OnGetUp(ObjectReference akFurniture)
	;Turn off dunGauldursonQST target to Sigdis
	Self.GetActorRef().SetAV("Variable07", 1)

	;Self.GetActorRef().EquipItem(GauldurBlackbow, True, False)
	if (dunGeirmundsQST.GetStage() < 10)
		Duplicate()
		if (!inUpdateLoop)
			UpdateLoop()
		EndIf
	EndIf
EndEvent

;Duplicate based on a timer.
Function UpdateLoop()
	inUpdateLoop = True
	While(!Self.GetActorRef().IsDead() && dunGeirmundsQST.GetStage() < 10 && Game.GetPlayer().GetCurrentLocation() == GeirmundsHallLocation)
		Debug.Trace("Loop")
		;Duplicate based on a timer...
		if (Utility.GetCurrentRealTime() - lastDuplicationTime >= 25)
			Duplicate()
		;...or if both duplicates are dead and we haven't in 15s...
		ElseIf (Duplicate1Actor.IsDead() && Duplicate2Actor.IsDead() && Utility.GetCurrentRealTime() - lastDuplicationTime >= 15)
			Duplicate()
		EndIf
		Utility.Wait(1)
	EndWhile
	inUpdateLoop = False
EndFunction

;...or when Sigdis falls below one of his health thresholds without many duplications.
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	AssessDuplicates()
EndEvent

Function AssessDuplicates()
	if (Self.GetActorRef().GetAV("Health") > 0 && !blockHitTesting)
		blockHitTesting = True
		If (threshold == 0 && Self.GetActorRef().GetActorValuePercentage("Health") <= 0.75)
			threshold = 1
			duplicationUsesLastThreshold = duplicationUses
			if (DuplicationUses == 1)
				Duplicate()
			EndIf
		ElseIf (threshold == 1 && Self.GetActorRef().GetActorValuePercentage("Health") <= 0.5)
			threshold = 2
			if (DuplicationUses == duplicationUsesLastThreshold)
				Duplicate()
			Else
				duplicationUsesLastThreshold = duplicationUses
				if (DuplicationUses == 2)
					Duplicate()
				EndIf
			EndIf
		ElseIf (threshold == 2 && Self.GetActorRef().GetActorValuePercentage("Health") <= 0.25)
			threshold = 3
			if (DuplicationUses == duplicationUsesLastThreshold)
				Duplicate()
			Else
				duplicationUsesLastThreshold = duplicationUses
				if (DuplicationUses == 3)
					Duplicate()
				EndIf
			EndIf
		EndIf
		blockHitTesting = False
	EndIf
EndFunction

;Death handling.
Event OnDeath(Actor akKiller)
	;Kill any remaining duplicates.
	BanishFXManager.GetReference().Activate(Game.GetPlayer())

	;Turn quest target back on.
	Self.GetActorRef().SetAV("Variable07", 0)

	;Open the exit door.
	SecretDoor.Activate(Self.GetActorRef())

	;Stop the dungeon quest.
	While (!Duplicate1Actor.IsDisabled() || !Duplicate2Actor.IsDisabled())
		Utility.Wait(1)
	EndWhile
	dunGeirmundsQST.SetStage(10)
EndEvent

;The main duplication process.
Function Duplicate()
	if (!duplicationOngoing && dunGeirmundsQST.GetStage() < 10)
		;Lock down the function.
		duplicationOngoing = True
		
		;Dismiss any surviving duplicates.
		BanishFXManager.GetReference().Activate(Game.GetPlayer())
		
		if (!Self.GetActorRef().IsDead())
			;Sigdis disappears.
			Self.GetActorRef().SetAV("Variable06", 1)
			Self.GetActorRef().EvaluatePackage()
			Self.GetActorRef().SetGhost(True)
			Self.GetActorRef().PlaceAtMe(BanishFX)
			Self.GetActorRef().Disable(True)

			;Beat to let the player notice something has happened...
			Utility.Wait(2)
		
			;Create two new duplicates at their setup points.
			Duplicate1Actor = Duplicate1SetupPoint.PlaceActorAtMe(DuplicateActorBase, DuplicateLevelMod, DuplicateEncZone)
			Duplicate1Alias.ForceRefTo(Duplicate1Actor)
			Duplicate1Actor.Disable()
			Duplicate2Actor = Duplicate2SetupPoint.PlaceActorAtMe(DuplicateActorBase, DuplicateLevelMod, DuplicateEncZone)
			Duplicate2Alias.ForceRefTo(Duplicate2Actor)
			Duplicate2Actor.Disable()
			
			;Which position is closest to the player? No one appears there.
			ObjectReference tmp
			if (Position1.GetDistance(Game.GetPlayer()) < Position4.GetDistance(Game.GetPlayer()))
				tmp = Position1
				Position1 = Position4
				Position4 = tmp
			EndIf
			if (Position2.GetDistance(Game.GetPlayer()) < Position4.GetDistance(Game.GetPlayer()))
				tmp = Position2
				Position2 = Position4
				Position4 = tmp
			EndIf
			if (Position3.GetDistance(Game.GetPlayer()) < Position4.GetDistance(Game.GetPlayer()))
				tmp = Position3
				Position3 = Position4
				Position4 = tmp
			EndIf
			
			;Which spot is closest to Sigdis? He shouldn't stay put.
			if (Position1.GetDistance(Self.GetActorRef()) < Position3.GetDistance(Self.GetActorRef()))
				tmp = Position1
				Position1 = Position3
				Position3 = tmp
			EndIf
			if (Position2.GetDistance(Self.GetActorRef()) < Position3.GetDistance(Self.GetActorRef()))
				tmp = Position2
				Position2 = Position3
				Position3 = tmp
			EndIf
			
			;Sigdis chooses at random between the other two.
			int SigdisSpot = Utility.RandomInt(1, 2)
			if (SigdisSpot == 1)
				Self.GetActorRef().MoveTo(Position1)
				Duplicate1Actor.Moveto(Position2)
			Else
				Self.GetActorRef().MoveTo(Position2)
				Duplicate1Actor.Moveto(Position1)
			EndIf
			Duplicate2Actor.Moveto(Position3)
			
			;Kick off an event to activate the duplicates.
			Utility.Wait(0.1)
			SummonFXManager.GetReference().Activate(Game.GetPlayer())
			
			;Enable Sigdis and resume combat.
			Self.GetActorRef().PlaceAtMe(SummonFX)
			Utility.Wait(0.5)
			Self.GetActorRef().SetGhost(False)
			Self.GetActorRef().SetAV("Variable06", 0)
			Self.GetActorRef().Enable(True)
			;Self.GetActorRef().EquipItem(GauldurBlackbow, True, False)
			Self.GetActorRef().EvaluatePackage()
			Self.GetActorRef().StartCombat(Game.GetPlayer())
		EndIf
		
		;Log Time
		lastDuplicationTime = Utility.GetCurrentRealTime()
		DuplicationUses = DuplicationUses + 1
		
		;Release the lock.
		duplicationOngoing = False
	EndIf
EndFunction

