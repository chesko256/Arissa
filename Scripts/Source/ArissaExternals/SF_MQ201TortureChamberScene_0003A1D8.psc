;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname SF_MQ201TortureChamberScene_0003A1D8 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; face prisoner
Alias_TortureChamberGuard.GetActorRef().SetLookAt(Alias_Prisoner.GetRef(), true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; debug.trace(self + " Scene END")
Alias_TortureChamberGuard.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; close cell door
CellDoor.SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; debug.trace(self + " Scene BEGIN")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Alias_TortureChamberGuard.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CellDoor  Auto  

ReferenceAlias Property Alias_Prisoner  Auto  

ReferenceAlias Property Alias_TortureChamberGuard  Auto  
