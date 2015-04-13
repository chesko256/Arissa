scriptName dunReachwaterRockMikrulBossBattle extends dunFolgunthurBossBattle
{ Boss Battle script variant for Mikrul Gaulderson in Reachwater Rock. }

ObjectReference property MikrulStartPoint Auto
Keyword property LinkCustom02 Auto
Activator property SummonFX Auto
Activator property BanishFX Auto
Quest property dunGauldursonQST Auto

Function BeginMikrulBattle()
	Self.GetActorRef().SetAV("Variable06", 1)
	Self.GetActorRef().EvaluatePackage()
	Self.GetActorRef().SetGhost(True)
	Self.GetActorRef().PlaceAtMe(BanishFX)	
	Utility.Wait(0.5)
		
	Self.GetActorRef().Disable(False)
	Self.GetActorRef().MoveTo(MikrulStartPoint)
	Self.GetActorRef().PlaceAtMe(SummonFX)
	Utility.Wait(1)

	Self.GetActorRef().SetAV("Variable06", 0)
	Self.GetActorRef().Enable(True)	
	Self.GetActorRef().Activate(Game.GetPlayer())
	Self.GetActorRef().SetGhost(False)
	Parent.OnLoad()
	isActive = True
	RegisterForSingleUpdate(1)
EndFunction

Event OnUpdate()
	Parent.OnActivate(Self.GetActorRef())
EndEvent

Event OnActivate(ObjectReference obj)
	;Do nothing, but intercept the activation to prevent it from activating the parent.
EndEvent

Event OnDying(Actor killer)
	EndMikrulBattle()
EndEvent

Function EndMikrulBattle()
	isActive = False

	Self.GetActorRef().SetGhost(True)
	Self.GetActorRef().PlaceAtMe(BanishFX)	
	Self.GetActorRef().Disable(False)
	Self.GetActorRef().Resurrect()
	Self.GetActorRef().SetAV("Health", 10)
	Self.GetActorRef().MoveTo(Self.GetActorRef().GetLinkedRef(LinkCustom02))

	breakLoop = True
	ActivateAndKillAllEnemies()
	
	;Kill all of the living Thralls.
	Ally1Alias.GetActorRef().Kill()
	Ally2Alias.GetActorRef().Kill()
	Ally3Alias.GetActorRef().Kill()

	Self.GetActorRef().PlaceAtMe(SummonFX)
	Utility.Wait(1)
	Self.GetActorRef().Enable(True)
	Self.GetActorRef().SetAlpha(0.33)
	Self.GetActorRef().GetActorBase().SetEssential(True)
	Self.GetActorRef().SetNoBleedoutRecovery(True)
	Self.GetActorRef().DamageAV("Health", 10000)		
	dunGauldursonQST.SetStage(119)
EndFunction