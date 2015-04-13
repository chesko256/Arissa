;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_MGRArniel04FinalScene_000E0D0B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MGArniel04LookMarker.PlaceAtMe(MGEyeExplosion)
Utility.Wait(0.2)
Arniel.GetReference().Disable()
KeeningRewardRef.Enable()
GetOwningQuest().SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Explosion Property MGEyeExplosion  Auto  

ObjectReference Property MGArniel04LookMarker  Auto  

ReferenceAlias Property Arniel  Auto  

ReferenceAlias Property Keening  Auto  

ObjectReference Property KeeningRewardRef  Auto  
