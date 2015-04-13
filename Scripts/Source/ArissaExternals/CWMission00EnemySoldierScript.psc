Scriptname CWMission00EnemySoldierScript extends ReferenceAlias  
{Script on CWMission00 quest's EnemySoldier aliases}

ReferenceAlias Property EnemySoldier1 Auto
ReferenceAlias Property EnemySoldier2 Auto

Event OnUpdate()

	;Advance quest if player sees the courier
	if GetOwningQuest().GetStagedone(20) == 0
		if Game.GetPlayer().HasLOS(Self.GetReference())
			GetOwningQuest().SetStage(20)
		EndIf
	EndIf
	
EndEvent


Event OnDeath(Actor akKiller)
	if GetOwningQuest().GetStagedone(100) == false && EnemySoldier1.GetActorReference().IsDead() && EnemySoldier2.GetActorReference().IsDead()
		GetOwningQuest().SetStage(100)
	EndIf
EndEvent
