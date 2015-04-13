;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname SF_DA08FrotharKillsHorseScene_00062D87 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Dagny.GetRef().MoveTo(DagnyMarker)
Nelkir.GetRef().MoveTo(NelkirMarker)
(GetOwningQuest() as DA08QuestScript).FrotharGoesNuts()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Frothar.GetActorReference().SetAV("confidence", 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
GetOwningQuest().SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Dagny auto
ReferenceAlias Property Nelkir auto

ObjectReference Property DagnyMarker  Auto  

ObjectReference Property NelkirMarker  Auto  

ObjectReference Property InsideStables  Auto  

ReferenceAlias Property KarindaEssential  Auto  

ReferenceAlias Property Frothar  Auto  
