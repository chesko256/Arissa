;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_MG04AugurSpeakScene_0004FBF4 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
AugurDoor.GetReference().Lock(False)
AugurDoor.GetReference().SetOpen()
MG04AugurFlame.GetReference().SetAnimationVariableFloat("fmagicburnamount",0.75)
utility.wait(1.5)
MG04AugurAlias.GetReference().Enable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Debug.trace("AugurSpeakScene starting")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property AugurDoor  Auto  

ReferenceAlias Property MG04AugurFlame  Auto  

ReferenceAlias Property MG04AugurAlias  Auto  
