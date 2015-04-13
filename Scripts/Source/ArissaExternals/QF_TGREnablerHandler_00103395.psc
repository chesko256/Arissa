;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_TGREnablerHandler_00103395 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGREndSafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGREndSafeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGREPitcherAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGREPitcherAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGREModelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGREModelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGREUrnAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGREUrnAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGREHornAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGREHornAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGREFlagonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGREFlagonAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGREGobletAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGREGobletAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGRRECandleAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGRRECandleAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;55 Radiant Done
pPitcher.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;25 Radiant Done
pModel.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;45 Radiant Done
pGoblet.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;15 Radiant Done
pHorn.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;35 Radiant Done
pUrn.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;First 5 Radiant Done
pCandles.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;75 Radiant Done
pFlagon.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;125 Radiant Done
pSafe.GetRef().Enable()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pHorn Auto
ReferenceAlias Property pFlagon Auto
ReferenceAlias Property pModel Auto
ReferenceAlias Property pPitcher Auto
ReferenceAlias Property pUrn Auto
ReferenceAlias Property pCandles Auto
ReferenceAlias Property pGoblet Auto

ReferenceAlias Property pSafe  Auto  
