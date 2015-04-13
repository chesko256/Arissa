;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_FreeformWhiterunQuest03_000946FD Extends Quest Hidden

;BEGIN ALIAS PROPERTY ProventusAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ProventusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY pSwordAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_pSwordAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AdrianneAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AdrianneAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
If GetStageDone(20) == 0
  FailAllObjectives()
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed (10)
Game.GetPlayer().AddItem(Alias_pSwordAlias.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ProventusAlias.GetReference().AddItem(Alias_pSwordAlias.GetReference())
SetObjectiveCompleted (10)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
