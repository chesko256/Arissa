;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_VC01VampirismCureRitual_0005DBA7 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ReferenceAlias akAlias)
;BEGIN CODE
;Debug.MessageBox("A magical effect occurs and the player blacks out.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ReferenceAlias akAlias)
;BEGIN CODE
Imod_VC01RitualBlackOut.Apply()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If GetOwningQuest().GetStage() < 195
     GetOwningQuest().SetStage(195)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
GetOwningQuest().SetStage(195)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ImageSpaceModifier Property Imod_VC01RitualBlackout  Auto  
