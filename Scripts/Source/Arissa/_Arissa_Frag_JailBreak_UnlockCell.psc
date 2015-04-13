;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 36
Scriptname _Arissa_Frag_JailBreak_UnlockCell Extends Scene Hidden

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
Alias_Arissa.GetActorReference().SetOutfit(_Arissa_Outfit_BlendInFalkreath)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
Alias_Arissa.GetActorReference().SetOutfit(_Arissa_Town_Outfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetStage(99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
CellDoor.Lock(false)
if GetOwningQuest().IsObjectiveDisplayed(102)
   GetOwningQuest().SetObjectiveCompleted(102)
   GetOwningQuest().SetObjectiveDisplayed(110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
Alias_Arissa.GetActorReference().MoveTo(_Arissa_MQ01_JailBreakCrumbStart)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CellDoor  Auto  

Outfit Property _Arissa_Outfit_BlendInFalkreath  Auto  

Outfit Property _Arissa_Town_Outfit  Auto  

ReferenceAlias Property Alias_Arissa  Auto  

ObjectReference Property _Arissa_MQ01_JailBreakCrumb1  Auto  

ObjectReference Property _Arissa_MQ01_JailBreakCrumbStart  Auto  
