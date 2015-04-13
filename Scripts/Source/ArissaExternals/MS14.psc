Scriptname MS14 extends Quest conditional

ObjectReference Property MS14LaeletteStart  Auto
GlobalVariable Property GameHour  Auto  
ReferenceAlias Property Alias_HelgiCoffin  Auto
ReferenceAlias Property Alias_CoffinDirt  Auto
ReferenceAlias Property Alias_Laelette  Auto
ReferenceAlias Property Alias_Thonnir  Auto   
ReferenceAlias Property Alias_Lami  Auto  
ReferenceAlias Property Alias_Benor  Auto  
ReferenceAlias Property Alias_Jorgen  Auto  
ReferenceAlias Property Alias_Lurbuk  Auto  

Int Property PCKnowsThonnir auto conditional
Int Property PCFoundAlvasCoffin auto conditional
Int Property ThonnirFollow auto conditional
Int Property StopHouseRumor auto conditional
Int Property LaeletteEnabled auto conditional
Int Property CoffinClue auto conditional
Int Property MobMarch auto conditional
Int Property ThonnirArrived auto conditional
Int Property PlayerArrived auto conditional

MiscObject Property Gold Auto  

Event OnUpdate()
    If MobArrived == 0
        If BenorArrived == 1 && LamiArrived == 1 && JorgenArrived == 1 && LurbukArrived == 1
            MobArrived == 1
        EndIf
    EndIf 

    If GetStage() == 100
        If Game.GetPlayer().GetDistance(MS14ThonnirArrivedMarker) < 1000
;           MobMarch = 0
            SetStage(110)
         EndIf
    EndIf

    If MobArrived == 1 && GetStage() == 110
        MS14MobScared.Start()
        Alias_CoffinDirt.GetRef().Enable()
        MobArrived = 2
    EndIf 
EndEvent


Cell Property MovarthsLair  Auto  

int Property MobArrived  Auto  

int Property BenorArrived  Auto  

int Property LamiArrived  Auto  

int Property LurbukArrived  Auto  

int Property JorgenArrived  Auto  

ObjectReference Property MS14ThonnirArrivedMarker  Auto  

Scene Property MS14MobScared  Auto  
