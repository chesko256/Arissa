Scriptname MS14AlvasCoffinScript extends ReferenceAlias  

MS14 MS14Script 

ReferenceAlias Property Alias_Alva  Auto  

Event OnInit()
    MS14Script = GetOwningQuest() as MS14
EndEvent

Event OnUpdate()
    MS14Script = GetOwningQuest() as MS14
    If MS14Script.PCFoundAlvasCoffin == 0
; ;       Debug.Trace(GetRef().GetCurrentLocation())
; ;       Debug.Trace(Game.GetPlayer().GetCurrentLocation())
        If GetRef().GetDistance(Game.GetPlayer()) < 512
            MS14Script.PCFoundAlvasCoffin = 1
        EndIf
    ElseIf MS14Script.PCFoundAlvasCoffin == 1 && GetOwningQuest().GetStage() < 80
        If GetRef().GetDistance(Alias_Alva.GetRef()) < 512
            GetOwningQuest().SetStage(80)
        EndIf 
    EndIf
EndEvent



