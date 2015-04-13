;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname SF_MS13BanditCampfireScene_0003A17D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
If (MS13.GetStageDone(10) == 0)
  MS13.SetStage(12)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property DartVictim  Auto  

Quest Property MS13  Auto  
