;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_DB05VittoriaDeathScene_000A403B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;pVeezaraAlias.GetReference().Moveto (pVeezaraMarker)
pDB05MoveDummyMarker.gotoState("Waiting")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;pVeezaraAlias.GetReference().Moveto (pVeezaraMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pVeezaraAlias  Auto  

ObjectReference Property pVeezaraMarker  Auto  

ObjectReference Property pDB05MoveDummyMarker  Auto  
