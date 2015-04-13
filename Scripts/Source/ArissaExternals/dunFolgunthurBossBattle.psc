scriptName dunFolgunthurBossBattle extends dunProgressiveCombatScriptRefAlias
{ Boss Battle script for Mikrul Gaulderson in Folgunthur. }

Faction property MikrulFaction Auto
Faction property ThrallFaction Auto
Faction property PlayerFaction Auto

ReferenceAlias property Ally1Alias Auto
ReferenceAlias property Ally2Alias Auto
ReferenceAlias property Ally3Alias Auto
ReferenceAlias property Mikrul Auto

ObjectReference Ally1Slot
ObjectReference Ally2Slot
ObjectReference Ally3Slot
ObjectReference Temp

float property timeForSpellcasting auto hidden

bool initBattle = False

Event OnActivate(ObjectReference obj)
	if (!initBattle)
		initBattle = True
		isActive = True
		totalEnemies = BattleManager.countLinkedRefChain()
		UpdateLoop()
	EndIf
EndEvent

Event OnUnload()
	breakLoop = True
EndEvent

Function UpdateLoop()
	While (isActive && !breakLoop)
		RunUpdate()
		Utility.Wait(1)
	EndWhile
	breakLoop = False
EndFunction

Function RunUpdate()
	;Basically, do everything dunProgressiveCombatScript wants to do.
	Parent.RunUpdate()
	
	;Then, if we're still active, run through and update the aliases.
	if (isActive)
		FindLivingAliases()
; 		;Debug.Trace("Alias: " + Ally1Alias.GetReference() + " " + Ally1Alias.GetActorRef().IsDead())
; 		;Debug.Trace("Alias: " + Ally2Alias.GetReference() + " " + Ally2Alias.GetActorRef().IsDead())
; 		;Debug.Trace("Alias: " + Ally3Alias.GetReference() + " " + Ally3Alias.GetActorRef().IsDead())
	EndIf
EndFunction

Function FindLivingAliases()
	ObjectReference localManager = BattleManager
	int currentAlias = 0
	
	While (localManager != None && currentAlias < 3)
		if ((localManager.GetLinkedRef(EnemyLinkKeyword) As Actor) != None && !(localManager.GetLinkedRef(EnemyLinkKeyword) As Actor).IsDead())
			currentAlias = currentAlias + 1
			If (currentAlias == 1)
				Ally1Alias.ForceRefTo(localManager.GetLinkedRef(EnemyLinkKeyword))
			ElseIf (currentAlias == 2)
				Ally2Alias.ForceRefTo(localManager.GetLinkedRef(EnemyLinkKeyword))
			ElseIf (currentAlias == 3)
				Ally3Alias.ForceRefTo(localManager.GetLinkedRef(EnemyLinkKeyword))
			EndIf
		EndIf
		localManager = localManager.GetLinkedRef()
	EndWhile
EndFunction

Function UpdateQuestAliases()
	Ally1Alias.ForceRefTo(Ally1Slot)
	Ally2Alias.ForceRefTo(Ally2Slot)
	Ally3Alias.ForceRefTo(Ally3Slot)
	if (Ally2Alias.GetReference().GetDistance(Mikrul.GetReference()) > Ally3Alias.GetReference().GetDistance(Mikrul.GetReference()) && Ally3Alias.GetReference() != None)
		Temp = Ally3Alias.GetReference()
		Ally3Alias.ForceRefTo(Ally2Alias.GetReference())
		Ally2Alias.ForceRefTo(Temp)
	EndIf
	if (Ally1Alias.GetReference().GetDistance(Mikrul.GetReference()) > Ally2Alias.GetReference().GetDistance(Mikrul.GetReference()) && Ally2Alias.GetReference() != None)
		Temp = Ally2Alias.GetReference()
		Ally2Alias.ForceRefTo(Ally1Alias.GetReference())
		Ally1Alias.ForceRefTo(Temp)
	EndIf
	if (Ally2Alias.GetReference().GetDistance(Mikrul.GetReference()) > Ally3Alias.GetReference().GetDistance(Mikrul.GetReference()) && Ally3Alias.GetReference() != None)
		Temp = Ally3Alias.GetReference()
		Ally3Alias.ForceRefTo(Ally2Alias.GetReference())
		Ally2Alias.ForceRefTo(Temp)
	EndIf
EndFunction

;If Mikrul's health falls below 50%, he kills a thrall.
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (Mikrul.GetActorRef().GetAV("Health") <= 0)
; 		;Debug.Trace("Mikrul Wrapping Up")
		;Wrap up the battle.
		isActive = False
		Self.UnregisterForUpdate()
		
		;Kill all of the remaining Thralls.
		Ally1Alias.GetActorRef().Kill()
		Ally2Alias.GetActorRef().Kill()
		Ally3Alias.GetActorRef().Kill()
		While(BattleManager != None)
			(BattleManager.GetLinkedRef(EnemyLinkKeyword) as Actor).Activate(Self.GetReference())
			Utility.Wait(0.5)
			(BattleManager.GetLinkedRef(EnemyLinkKeyword) as Actor).Kill()
			BattleManager = BattleManager.GetLinkedRef()
		EndWhile
	EndIf
EndEvent