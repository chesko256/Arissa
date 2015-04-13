;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_DarkBrotherhoodSanctuaryRe_00087BA2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CiceroAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CiceroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DelvinMalloryAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DelvinMalloryAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBCaptive4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBCaptive4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBCaptive1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBCaptive1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBCaptive2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBCaptive2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DBCaptive3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DBCaptive3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
if DBScript.CiceroDead==0
     Alias_CiceroAlias.GetReference().Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted (10,1)
Utility.Wait(5)
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  
