;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_LogrolfMolagBalScene01_00022F1B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
GetOwningQuest().SetStage(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
If pLogrolf.GetActorRef().IsDead() == False
  GetOwningQuest().SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA10  Auto  

ReferenceAlias Property pLogrolf  Auto  
