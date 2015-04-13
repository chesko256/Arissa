scriptname dunRebelsCairnBossBattle extends Actor
{When Red Eagle is killed, if the sword is in the slot, it upgrades.}

ObjectReference property swordInStoneManager Auto
ObjectReference property Skeleton1 Auto
ObjectReference property Skeleton2 Auto
ObjectReference property Skeleton3 Auto
ObjectReference property Skeleton4 Auto


Event OnDeath(Actor killer)
	(swordInStoneManager as dunRebelsCairnSwordInStoneManager).UpgradeSword()
	(Skeleton1 as Actor).Kill(Self)
	(Skeleton2 as Actor).Kill(Self)
	(Skeleton3 as Actor).Kill(Self)
	(Skeleton4 as Actor).Kill(Self)
EndEvent



