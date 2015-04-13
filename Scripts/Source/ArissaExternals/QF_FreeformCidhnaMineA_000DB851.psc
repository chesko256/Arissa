;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_FreeformCidhnaMineA_000DB851 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Grisvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Grisvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Duach
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Duach Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; quest giver dead, fail all objectives
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has skooma
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player gets shiv
Game.GetPlayer().RemoveItem(Skooma, 1)
Game.GetPlayer().AddItem(MS02Shiv, 1)
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player is told to go to Duach
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

If Game.GetPlayer().GetItemCount(Skooma) >= 1
  SetStage(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;clear objectives
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player is told to get a shiv
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Give player skooma
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)
Game.GetPlayer().AddItem(Skooma, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property Skooma  Auto  


Weapon Property MS02Shiv  Auto  
