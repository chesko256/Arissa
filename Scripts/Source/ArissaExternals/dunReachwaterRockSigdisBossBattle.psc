scriptName dunReachwaterRockSigdisBossBattle extends ReferenceAlias
{ Boss Battle script for Sigdus Gauldurson in Geirmund's Hall. }

;Reference to the Blackbow, to prevent Sigdis from unequipping it.
Weapon property GauldurBlackbow Auto

;Duplicates
Actor property Duplicate1Actor Auto
Actor property Duplicate2Actor Auto
Actor property Duplicate3Actor Auto
ReferenceAlias property Duplicate1Alias Auto
ReferenceAlias property Duplicate2Alias Auto
ReferenceAlias property Duplicate3Alias Auto
ObjectReference property Duplicate1SetupPoint Auto
ObjectReference property Duplicate2SetupPoint Auto
ObjectReference property Duplicate3SetupPoint Auto
ActorBase property DuplicateActorBase Auto
int property DuplicateLevelMod Auto
EncounterZone property DuplicateEncZone Auto
Keyword property LinkCustom02 Auto

;Teleport Points
ObjectReference property Position1 Auto
ObjectReference property Position2 Auto
ObjectReference property Position3 Auto
ObjectReference property Position4 Auto
ObjectReference property Position5 Auto
ObjectReference property Position6 Auto

;VFX
Activator property SummonFX Auto
Activator property BanishFX Auto
Spell property Dispel Auto
ReferenceAlias property SummonFXManager Auto
ReferenceAlias property BanishFXManager Auto

Spell property GhostAbilityNew Auto
Spell property GhostAbilitySigdis Auto
EffectShader property GhostEffect Auto

;State Tracking 
float lastDuplicationTime = 0.0
int threshold = 0
int duplicationUses = 0
int duplicationUsesLastThreshold = 0
bool duplicationOngoing = False
bool inUpdateLoop = False
bool battleActive = False
bool blockHitTesting = False

Quest property dunGauldursonQST Auto


;The battle begins when the player releases Sigdis.
Function BeginSigdisBattle()
	Self.GetActorRef().EquipItem(GauldurBlackbow, True, False)
	battleActive = True
	Duplicate()
	RegisterForSingleUpdate(1)
EndFunction

Event OnUpdate()
	UpdateLoop()
EndEvent

;Death handling.
Function EndSigdisBattle()
		Self.GetActorRef().SetGhost(True)
		Self.GetActorRef().PlaceAtMe(BanishFX)			
		Self.GetActorRef().Disable(False)
		Self.GetActorRef().Resurrect()
		Self.GetActorRef().SetAV("Health", 10)
		Self.GetActorRef().MoveTo(Self.GetActorRef().GetLinkedRef(LinkCustom02))
		Utility.Wait(1)
		
		;Dismiss any surviving duplicates.
		BanishFXManager.GetReference().Activate(Game.GetPlayer())
		(Duplicate1Actor As dunGeirmundsBossDuplicates).DismissDuplicate()
		(Duplicate2Actor As dunGeirmundsBossDuplicates).DismissDuplicate()
		(Duplicate3Actor As dunGeirmundsBossDuplicates).DismissDuplicate()
		
		Self.GetActorRef().PlaceAtMe(SummonFX)
		Utility.Wait(1)

		Self.GetActorRef().Enable(True)
		Self.GetActorRef().SetAlpha(0.33)
		Self.GetActorRef().GetActorBase().SetEssential(True)
		Self.GetActorRef().SetNoBleedoutRecovery(True)
		Self.GetActorRef().DamageAV("Health", 10000)		
		
		battleActive = False
		dunGauldursonQST.SetStage(129)
EndFunction

;Duplicate based on a timer.
Function UpdateLoop()
	inUpdateLoop = True
	While(battleActive)
		;Duplicate based on a timer...
		if (Utility.GetCurrentRealTime() - lastDuplicationTime >= 35)
			Duplicate()
		;...or if both duplicates are dead and we haven't in 20s...
		ElseIf (Duplicate1Actor.IsDead() && Duplicate2Actor.IsDead() && Utility.GetCurrentRealTime() - lastDuplicationTime >= 20)
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

Event OnDying(Actor killer)
	EndSigdisBattle()
EndEvent


;The main duplication process.
Function Duplicate()
	if (!duplicationOngoing)
		;Lock down the function.
		duplicationOngoing = True
		
		;Dismiss any surviving duplicates.
		BanishFXManager.GetReference().Activate(Game.GetPlayer())
		
		if (battleActive)
			;Sigdis disappears.
			Self.GetActorRef().SetAV("Variable06", 1)
			Self.GetActorRef().EvaluatePackage()
			Self.GetActorRef().SetGhost(True)
			Self.GetActorRef().PlaceAtMe(BanishFX)
			Utility.Wait(0.5)
			Self.GetActorRef().Disable(False)

			;Beat to let the player notice something has happened...
			Utility.Wait(2)
		
			;Create two new duplicates at their setup points.
			Duplicate1Actor = Duplicate1SetupPoint.PlaceActorAtMe(DuplicateActorBase, DuplicateLevelMod, DuplicateEncZone)
			Duplicate1Alias.ForceRefTo(Duplicate1Actor)
			Duplicate1Actor.Disable()
			Duplicate2Actor = Duplicate2SetupPoint.PlaceActorAtMe(DuplicateActorBase, DuplicateLevelMod, DuplicateEncZone)
			Duplicate2Alias.ForceRefTo(Duplicate2Actor)
			Duplicate2Actor.Disable()
			Duplicate3Actor = Duplicate3SetupPoint.PlaceActorAtMe(DuplicateActorBase, DuplicateLevelMod, DuplicateEncZone)
			Duplicate3Alias.ForceRefTo(Duplicate3Actor)
			Duplicate3Actor.Disable()
			
			;Which position is closest to the player? No one appears there.
			ObjectReference tmp
			if (Position1.GetDistance(Game.GetPlayer()) < Position6.GetDistance(Game.GetPlayer()))
				tmp = Position1
				Position1 = Position6
				Position6 = tmp
			EndIf
			if (Position2.GetDistance(Game.GetPlayer()) < Position6.GetDistance(Game.GetPlayer()))
				tmp = Position2
				Position2 = Position6
				Position6 = tmp
			EndIf
			if (Position3.GetDistance(Game.GetPlayer()) < Position6.GetDistance(Game.GetPlayer()))
				tmp = Position3
				Position3 = Position6
				Position6 = tmp
			EndIf
			if (Position4.GetDistance(Game.GetPlayer()) < Position6.GetDistance(Game.GetPlayer()))
				tmp = Position4
				Position4 = Position6
				Position6 = tmp
			EndIf
			if (Position5.GetDistance(Game.GetPlayer()) < Position6.GetDistance(Game.GetPlayer()))
				tmp = Position5
				Position5 = Position6
				Position6 = tmp
			EndIf
			
			;Which spot is closest to Sigdis? He shouldn't stay put.
			if (Position1.GetDistance(Self.GetActorRef()) < Position5.GetDistance(Self.GetActorRef()))
				tmp = Position1
				Position1 = Position5
				Position5 = tmp
			EndIf
			if (Position2.GetDistance(Self.GetActorRef()) < Position5.GetDistance(Self.GetActorRef()))
				tmp = Position2
				Position2 = Position5
				Position5 = tmp
			EndIf
			if (Position3.GetDistance(Self.GetActorRef()) < Position5.GetDistance(Self.GetActorRef()))
				tmp = Position3
				Position3 = Position5
				Position5 = tmp
			EndIf
			if (Position4.GetDistance(Self.GetActorRef()) < Position5.GetDistance(Self.GetActorRef()))
				tmp = Position4
				Position4 = Position5
				Position5 = tmp
			EndIf
			
			;Sigdis chooses at random between the other four.
			int SigdisSpot = Utility.RandomInt(1, 4)
			if (SigdisSpot == 1)
				Self.GetActorRef().MoveTo(Position1)
				Duplicate1Actor.Moveto(Position2)
				Duplicate2Actor.Moveto(Position3)
				Duplicate3Actor.Moveto(Position4)
			ElseIf (SigdisSpot == 2)
				Self.GetActorRef().MoveTo(Position2)
				Duplicate1Actor.Moveto(Position3)
				Duplicate2Actor.Moveto(Position4)
				Duplicate3Actor.Moveto(Position5)
			ElseIf (SigdisSpot == 3)
				Self.GetActorRef().MoveTo(Position3)
				Duplicate1Actor.Moveto(Position4)
				Duplicate2Actor.Moveto(Position5)
				Duplicate3Actor.Moveto(Position1)
			Else
				Self.GetActorRef().MoveTo(Position4)
				Duplicate1Actor.Moveto(Position5)
				Duplicate2Actor.Moveto(Position1)
				Duplicate3Actor.Moveto(Position3)
			EndIf
			
			;Kick off an event to activate the duplicates.
			if (!Self.GetActorRef().IsDead())
				SummonFXManager.GetReference().Activate(Game.GetPlayer())
			Else
				Duplicate1Actor.Disable()
				Duplicate2Actor.Disable()
				Duplicate3Actor.Disable()
			EndIf
			
			;Enable Sigdis and resume combat.
			Self.GetActorRef().PlaceAtMe(SummonFX)
			Utility.Wait(1)
			Self.GetActorRef().SetGhost(False)
			Self.GetActorRef().SetAV("Variable06", 0)
			Self.GetActorRef().Enable(True)
			Self.GetActorRef().EquipItem(GauldurBlackbow, True, False)
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

