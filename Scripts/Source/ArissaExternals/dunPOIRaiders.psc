scriptName dunPOIRaiders extends ObjectReference
{On load, waits for the player to move within a set distance. Then does some LoS checks, and spawns the specified enemies at a spot the player can't see.}


ActorBase property Raider1Base Auto
{ActorBase of the enemy to spawn.}

ActorBase property Raider2Base Auto
{ActorBase of the enemy to spawn.}

ActorBase property Raider3Base Auto
{ActorBase of the enemy to spawn.}

int property Raider1Count = 1 Auto
{Number of RaiderBase1 instances to spawn. Defaults to 1.}

int property Raider2Count = 1 Auto
{Number of RaiderBase2 instances to spawn. Defaults to 1.}

int property Raider3Count = 1 Auto
{Number of RaiderBase3 instances to spawn. Defaults to 1.}

EncounterZone property Zone Auto
{Encounter zone for the newly-created instances.}

int property Raider1Difficulty = 0 Auto
{Raider1's levelled difficulty. 0=Easy (Default), 1=Medium, 2=Hard, 3=VHard}

int property Raider2Difficulty = 0 Auto
{Raider2's levelled difficulty. 0=Easy (Default), 1=Medium, 2=Hard, 3=VHard}

int property Raider3Difficulty = 0 Auto
{Raider3's levelled difficulty. 0=Easy (Default), 1=Medium, 2=Hard, 3=VHard}


int property DistanceToSpawn = 3000 Auto
{Distance at which we begin trying to spawn the enemies. Default: 3000}

ObjectReference property FirstSpawnPoint Auto
{First ObjectReference in a linked chain of potential spawn points. Enemies will spawn at the first point the player does not have LoS to.}

bool breakLoop = False

auto State waiting
	Event OnLoad()
		UpdateLoop()
	EndEvent
	
	Event OnUnload()
		breakLoop = True
	EndEvent
EndState

State AllDone
	Event OnLoad()
		;Do nothing.
	EndEvent
	
	Event OnUnload()
		;Do nothing.
	EndEvent
EndState

Function UpdateLoop()
	While (Game.GetPlayer().GetDistance(Self) >= DistanceToSpawn && !breakLoop)
		Utility.Wait(1)
	EndWhile
	if (Game.GetPlayer().GetDistance(Self) < DistanceToSpawn)
		;Figure out where to spawn the enemies.
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
		if (foundSpawnPoint)
			;Then spawn them.
			While (Raider1Base != None && Raider1Count > 0)
				FirstSpawnPoint.PlaceActorAtMe(Raider1Base, Raider1Difficulty, Zone).EvaluatePackage()
				Raider1Count = Raider1Count - 1
			EndWhile
			While (Raider2Base != None && Raider2Count > 0)
				FirstSpawnPoint.PlaceActorAtMe(Raider2Base, Raider2Difficulty, Zone).EvaluatePackage()
				Raider2Count = Raider2Count - 1
			EndWhile
			While (Raider3Base != None && Raider3Count > 0)
				FirstSpawnPoint.PlaceActorAtMe(Raider3Base, Raider3Difficulty, Zone).EvaluatePackage()
				Raider3Count = Raider3Count - 1
			EndWhile
		EndIf
		GoToState("AllDone")
		Self.Disable()
	EndIf
	breakLoop = False
EndFunction