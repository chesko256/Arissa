scriptname dunProgressiveCombatScriptRefAlias extends ReferenceAlias
{Script for managing a large-scale ambush-based combat, keeping a fixed number alive at once.}

;The topmost enemy 'manager' in the chain.
ObjectReference property BattleManager Auto

;Keyword for the enemy links.
Keyword property EnemyLinkKeyword Auto

;Max number of simultaneous enemies to be active at a time.
int property simultaneousEnemies Auto

;Whether the first set of enemies should be activated on cell load. Otherwise, the battle begins when this ref is activated.
bool property startsActive = false Auto

;Insert this delay before each enemy activation beyond the first.
float property delay = 0.0 Auto

;Ref to activate when the battle is complete (all enemies activated and killed)
ObjectReference property refActivateOnComplete Auto

;Add a random delay to enemy activations to avoid synchronization.
bool property useSmallRandomDelay = True Auto


bool initialEnemyActivated
bool property isActive Auto
int property totalEnemies auto hidden
int currentEnemyLink = 0
float property updateTime = 1.0 Auto

bool property doOnce auto hidden
bool property breakLoop auto hidden
bool property busy auto hidden


Event OnLoad()
	totalEnemies = BattleManager.countLinkedRefChain()
	if (!doOnce)
		isActive = startsActive
	EndIf
	UpdateLoop()
; 	;Debug.Trace("Progressive Combat: " + battleManager + " " + totalEnemies)
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
	if (isActive)
		isActive = UpdateBattle()
; 		;Debug.Trace("Progressive Combat " + Self + " processing.")
		if (!isActive)
; 			;Debug.Trace("Activating completion ref.")
			refActivateOnComplete.Activate(Self.GetReference())
		EndIf
	EndIf
EndFunction

Event OnActivate(ObjectReference obj)
; 	;Debug.Trace("Progressive Combat activated.")
	isActive = True
	Self.UpdateLoop()
EndEvent

bool Function UpdateBattle()
	if (!busy)
; 		;Debug.Trace("Progressive Update:" + Self + " " + CountActiveEnemies(BattleManager, currentEnemyLink) + " " + simultaneousEnemies + " " + currentEnemyLink)
; 		;Debug.Trace("Progressive Update2 :" + simultaneousEnemies + " " + totalEnemies)
		busy = True
		While (CountActiveEnemies(BattleManager, currentEnemyLink) < simultaneousEnemies && currentEnemyLink < totalEnemies)
			if (initialEnemyActivated)
				Utility.Wait(delay)
			Else
				initialEnemyActivated = True
			EndIf
			if (useSmallRandomDelay)
				Utility.Wait(Utility.RandomFloat(0, 0.5))
			EndIf
			ActivateNextEnemy()
		EndWhile
		busy = False
; 		;Debug.Trace("Surviving enemies: " + CountActiveEnemies(BattleManager, currentEnemyLink))
		if (CountActiveEnemies(BattleManager, currentEnemyLink) == 0)
; 			;Debug.Trace("All enemies dead.")
			return False
		Else
			return True
		EndIf
	EndIf
	Return True
EndFunction

int Function CountActiveEnemies(ObjectReference manager, int LinksToCount)
; 	;Debug.Trace("Count Active Enemies: Counting: " + manager + " " + LinksToCount + EnemyLinkKeyword)
; 	;Debug.Trace("Count Active Enemies: Counting: " + manager.GetLinkedRef(EnemyLinkKeyword) + " " + (manager.GetLinkedRef(EnemyLinkKeyword) as Actor).IsDead())
	if (manager == None || LinksToCount == 0 ||EnemyLinkKeyword == None)
		Return 0
	ElseIf ((manager.GetLinkedRef(EnemyLinkKeyword) As Actor) == None ||  (manager.GetLinkedRef(EnemyLinkKeyword) As Actor).IsDead())
		Return CountActiveEnemies(manager.GetLinkedRef(), LinksToCount - 1)
	Else
; 		;Debug.Trace("Survivor: " + manager.GetLinkedRef(EnemyLinkKeyword) As Actor)
		Return 1 + CountActiveEnemies(manager.GetLinkedRef(), LinksToCount - 1)
	EndIf
EndFunction

Function ActivateNextEnemy()
; 	;Debug.Trace("Activating next enemy.")
	BattleManager.GetNthLinkedRef(currentEnemyLink).GetLinkedRef(EnemyLinkKeyword).Activate(Self.GetReference())
	currentEnemyLink = currentEnemyLink + 1
	;If the player has killed this enemy, keep on going.
; 	;Debug.Trace(BattleManager.GetNthLinkedRef(currentEnemyLink - 1).GetLinkedRef(EnemyLinkKeyword) + " " + (BattleManager.GetNthLinkedRef(currentEnemyLink - 1).GetLinkedRef(EnemyLinkKeyword) As Actor).IsDead())
	if ((BattleManager.GetNthLinkedRef(currentEnemyLink - 1).GetLinkedRef(EnemyLinkKeyword) As Actor).IsDead() && currentEnemyLink < totalEnemies)
		ActivateNextEnemy()
	EndIf
EndFunction

Function ActivateAllEnemies()
; 	;Debug.Trace("Activate All Enemies called.")
	While(currentEnemyLink < totalEnemies)
		ActivateNextEnemy()
	EndWhile
EndFunction

Function ActivateAndKillAllEnemies()
; 	;Debug.Trace("Activate All Enemies called.")
	While(currentEnemyLink < totalEnemies)
		ActivateNextEnemy()
		Utility.Wait(delay)
	EndWhile
	int i = 0
	While (i < totalEnemies)
		(BattleManager.GetNthLinkedRef(i).GetLinkedRef(EnemyLinkKeyword) As Actor).Kill()
		i = i + 1
	EndWhile
EndFunction