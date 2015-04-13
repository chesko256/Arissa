Scriptname MS14LaeletteScript extends ReferenceAlias  

Event OnDeath(Actor Killer)
    GetOwningQuest().SetStage(25)
EndEvent