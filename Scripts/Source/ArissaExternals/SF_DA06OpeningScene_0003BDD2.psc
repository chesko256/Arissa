;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname SF_DA06OpeningScene_0003BDD2 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Atub.GetReference().MoveTo(DA06AtubWaitMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
(GetOwningQuest() as DA06QuestScript).OpenSceneStarted=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;DA06Gate.GetReference().Lock(False)
;DA06Gate.GetReference().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property DA06Gate  Auto  

ObjectReference Property DA06AtubWaitMarker  Auto  

ReferenceAlias Property Atub  Auto  
