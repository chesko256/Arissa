;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_TG05MercerUnlockScene02_000CED9F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
pTG05PuzzleDoor.Activate(pMercer.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
getowningquest().setstage(45)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Activator Property pTG05Door  Auto  

ObjectReference Property pTG05PuzzleDoor  Auto  

ReferenceAlias Property pMercer  Auto  
