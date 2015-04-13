scriptName dunPOISoldiersRaidOnStart extends ObjectReference
{On load, spawns a group of bandits to raid the Reach Forsworn Camp POI.}

ObjectReference property FirstSpawnPoint Auto
ActorBase property SoldierBaseImp Auto
ActorBase property SoldierBaseSons Auto
Quest property CW Auto
Quest property RaidQuest Auto
ReferenceAlias property Soldier1Alias Auto
ReferenceAlias property Soldier2Alias Auto
ReferenceAlias property Forsworn1Alias Auto

bool breakLoop

auto State waiting
	Event OnLoad()
		RaidQuest.SetStage(10)
		UpdateLoop()
	EndEvent
	
	Event OnUnload()
		breakLoop = True
	EndEvent
EndState

State WaitingForUnload
	Event OnUnload()
		Soldier1Alias.GetActorRef().Disable()
		Soldier1Alias.GetActorRef().Delete()
		Soldier2Alias.GetActorRef().Disable()
		Soldier2Alias.GetActorRef().Delete()
		RaidQuest.Stop()
	EndEvent
EndState

State AllDone
	Event OnLoad()
		;Do nothing.
	EndEvent
	
	Event OnUpdate()
		;Do nothing.
	EndEvent

	Event OnUnload()
		;Do nothing.
	EndEvent
EndState


Function UpdateLoop()
	While(!breakLoop)
		if (Game.GetPlayer().GetDistance(Self) < 3000)
			GoToState("WaitingForUnload")
			breakLoop = True
			;Figure out where to spawn the soldiers.
			bool foundSpawnPoint = False
			While (!foundSpawnPoint && FirstSpawnPoint != None)
				if (Game.GetPlayer().HasLOS(FirstSpawnPoint))
					;If the player has LOS, try the next point.
					FirstSpawnPoint = FirstSpawnPoint.GetLinkedRef()
				Else
					;Otherwise, pick this point.
					foundSpawnPoint = True
				EndIf
			EndWhile
			if (FirstSpawnPoint != None)
				;Then spawn either Imperial or Stormcloak soldiers, depending on who controls the Reach.
				CWScript CWs = (CW As CWScript)	
				Actor tmp
				if (CWs.OwnerReach < 2) ;Imperials
					tmp = FirstSpawnPoint.PlaceActorAtMe(SoldierBaseImp, 0, None)
					Soldier1Alias.ForceRefTo(tmp)
					tmp.EvaluatePackage()
					tmp = FirstSpawnPoint.PlaceActorAtMe(SoldierBaseImp, 0, None)
					Soldier2Alias.ForceRefTo(tmp)
					tmp.EvaluatePackage()
				Else
					tmp = FirstSpawnPoint.PlaceActorAtMe(SoldierBaseSons, 0, None)
					Soldier1Alias.ForceRefTo(tmp)
					tmp.EvaluatePackage()
					tmp = FirstSpawnPoint.PlaceActorAtMe(SoldierBaseSons, 0, None)
					Soldier2Alias.ForceRefTo(tmp)
					tmp.EvaluatePackage()
				EndIf
				Soldier1Alias.GetActorReference().StartCombat(Forsworn1Alias.GetActorReference())
				Soldier2Alias.GetActorReference().StartCombat(Forsworn1Alias.GetActorReference())
			EndIf
		EndIf
		Utility.Wait(1)
	EndWhile
	breakLoop = False
EndFunction