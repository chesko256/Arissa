;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_CidhnaMineOpenGateScene_000CD143 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
CidhnaMineDoorB.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
If GetOwningQuest().GetStageDone(25) == 0
  CidhnaMineDoorA.Lock()
  CidhnaMineDoorB.SetOpen()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CidhnaMineDoorB  Auto  

ObjectReference Property CidhnaMineLeverB  Auto  

ObjectReference Property CidhnaMineDoorLeverB  Auto  

ObjectReference Property CidhnaMineDoorA  Auto  
