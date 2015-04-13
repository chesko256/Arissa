;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_MG07SavosVisionScene1_000B8799 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MG07GhostEnableParentAlias.GetReference().Disable(true)
SavosGhost.GetReference().DisableNoWait(true)
HafnarGhost.GetReference().DisableNoWait(true)
AtmahGhost.GetReference().DisableNoWait(true)
TakesGhost.GetReference().DisableNoWait(true)
ElvaliGhost.GetReference().DisableNoWait(true)
GirduinGhost.GetReference().DisableNoWait(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SavosGhost  Auto  

ReferenceAlias Property HafnarGhost  Auto  

ReferenceAlias Property AtmahGhost  Auto  

ReferenceAlias Property GirduinGhost  Auto  

ReferenceAlias Property ElvaliGhost  Auto  

ReferenceAlias Property TakesGhost  Auto  

ReferenceAlias Property MG07GhostEnableParentAlias  Auto  
