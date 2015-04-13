Scriptname MS14BurnedHouseScript extends ReferenceAlias  

Int Stage1
Int Stage2

Event OnUpdate()
    Stage1 = 1
; ;    Debug.trace("Stage1 " + stage1)
    If GetOwningQuest().GetStage() < 10
        Stage2 = 1
; ;        Debug.trace("Stage2 " + stage2)
; ;       Debug.trace("Location " +  Game.GetPlayer().GetCurrentLocation() )      
        If Game.GetPlayer().IsInLocation(MorthalLocation) && GetRef().GetDistance(Game.GetPlayer()) < 1000
            GetOwningQuest().SetStage(10)
        EndIf
    EndIf
EndEvent

Location Property MorthalLocation  Auto  
