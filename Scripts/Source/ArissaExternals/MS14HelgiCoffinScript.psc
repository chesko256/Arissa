Scriptname MS14HelgiCoffinScript extends ReferenceAlias  

ObjectReference Property NewProperty  Auto  
ReferenceAlias Property Helgi  Auto  

Event OnActivate(ObjectReference ActorRef)
    If ActorRef == Game.GetPlayer()
        If GetOwningQuest().GetStage() >= 40 && GetOwningQuest().GetStage() <= 60
            If GetOwningQuest().GetStageDone(25) == 1 && GetOwningQuest().GetStageDone(50) == 0
                MS14HelgiCoffinScene.Start()
                GetOwningQuest().SetStage(50)
            EndIf
            If GetOwningQuest().GetStageDone(50) == 0
                If GameHour.Value >= 20 || GameHour.Value <= 6
                    MS14HelgiLaeletteNotDead.Start()
                EndIf
            EndIf
        EndIf
    EndIf
EndEvent

Scene Property MS14HelgiCoffinScene  Auto  

Scene Property MS14HelgiLaeletteNotDead  Auto  

GlobalVariable Property GameHour  Auto  
