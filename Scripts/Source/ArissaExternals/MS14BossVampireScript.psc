Scriptname MS14BossVampireScript extends ReferenceAlias  

Event OnDeath(Actor Killer)
    GetOwningQuest().SetStage(120)
EndEvent