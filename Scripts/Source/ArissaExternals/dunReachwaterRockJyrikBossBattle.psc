scriptName dunReachwaterRockJyrikBossBattle extends ReferenceAlias
{ Boss Battle script variant for Jyrik Gaulderson in Reachwater Rock. }

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

;State Tracking 
float lastTeleportTime = 0.0
int threshold = 0
int teleportUses = 0
int teleportUsesLastThreshold = 0
bool teleportOngoing = False
bool inUpdateLoop = False
bool battleActive = False

Quest property dunGauldursonQST Auto

Event OnLoad()
EndEvent

Function BeginJyrikBattle()
	battleActive = True
	Teleport()
	;Turn on Jyrik's effects.
	Self.GetActorRef().SetAV("Variable07", 1)
	Self.GetActorRef().OnUpdate()
EndFunction

;Death handling.
Function EndJyrikBattle()
		;Turn off Jyrik's effects.
		Self.GetActorRef().SetAV("Variable07", 0)
		Self.GetActorRef().SetGhost(True)
		Self.GetActorRef().PlaceAtMe(BanishFX)			
		Self.GetActorRef().Disable(False)
		Self.GetActorRef().Resurrect()
		Self.GetActorRef().SetAV("Health", 10)
		Self.GetActorRef().MoveTo(Self.GetActorRef().GetLinkedRef(LinkCustom02))
		Utility.Wait(1)
		Self.GetActorRef().PlaceAtMe(SummonFX)
		Utility.Wait(1)
		
		Self.GetActorRef().Enable(True)
		Self.GetActorRef().SetAlpha(0.33)
		Self.GetActorRef().GetActorBase().SetEssential(True)
		Self.GetActorRef().SetNoBleedoutRecovery(True)
		Self.GetActorRef().DamageAV("Health", 10000)
		
		battleActive = False
		dunGauldursonQST.SetStage(139)
EndFunction

;...or when Jyrik falls below certain health thresholds.
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (Self.GetActorRef().GetAV("Health") > 0)
		If (threshold == 0 && Self.GetActorRef().GetActorValuePercentage("Health") <= 0.6)
			threshold = 1
			Teleport()
		ElseIf (threshold == 1 && Self.GetActorRef().GetActorValuePercentage("Health") <= 0.3)
			threshold = 2
			Teleport()
		EndIf
	EndIf
EndEvent

Event OnDying(Actor killer)
	EndJyrikBattle()
EndEvent

;The main teleport process.
Function Teleport()
	if (!teleportOngoing)
		;Lock down the function.
		teleportOngoing = True
		
		if (battleActive)
			;Jyrik disappears.
			Self.GetActorRef().SetAV("Variable06", 1)
			Self.GetActorRef().EvaluatePackage()
			Self.GetActorRef().SetGhost(True)
			Self.GetActorRef().PlaceAtMe(BanishFX)
			Utility.Wait(0.1)
			Self.GetActorRef().Disable(False)

			;Beat to let the player notice something has happened...
			Utility.Wait(2)
			
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
			
			;Which spot is closest to Jyrik? He shouldn't stay put.
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
			
			;Jyrik chooses at random between the other four.
			int JyrikSpot = Utility.RandomInt(1, 4)
			if (JyrikSpot == 1)
				Self.GetActorRef().MoveTo(Position1)
			ElseIf (JyrikSpot == 2)
				Self.GetActorRef().MoveTo(Position2)
			ElseIf (JyrikSpot == 3)
				Self.GetActorRef().MoveTo(Position3)
			Else
				Self.GetActorRef().MoveTo(Position4)
			EndIf

			;Enable Jyrik and resume combat.
			Self.GetActorRef().PlaceAtMe(SummonFX)
			Utility.Wait(1)
			Self.GetActorRef().SetAV("Variable06", 0)
			Self.GetActorRef().Enable(True)
			Self.GetActorRef().SetGhost(False)
			Self.GetActorRef().SetAlpha(0.5, True)
			Self.GetActorRef().EvaluatePackage()
			Self.GetActorRef().StartCombat(Game.GetPlayer())
		EndIf
		
		;Release the lock.
		teleportOngoing = False
	EndIf
EndFunction