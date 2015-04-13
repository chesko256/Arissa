;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_MQ101Scene1New_000BECD4 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
If (GetOwningQuest().GetStagedone(2) == 0) &&  (GetOwningQuest().GetStagedone(6) == 0) && (GetOwningQuest().GetStagedone(7) == 0)
  GetOwningQuest().SetStage(35)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
GetOwningQuest().SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
GetOwningQuest().SetStage(14)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
