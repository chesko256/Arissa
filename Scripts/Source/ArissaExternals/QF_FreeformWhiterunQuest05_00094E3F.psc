;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_FreeformWhiterunQuest05_00094E3F Extends Quest Hidden

;BEGIN ALIAS PROPERTY ArcadiaAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ArcadiaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FarengarAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FarengarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrostSaltsAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FrostSaltsAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
If GetStageDone(200) == 0
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
Game.GetPlayer().AddItem(Alias_FrostSaltsAlias.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ArcadiaAlias.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt() )
Alias_FarengarAlias.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt() )
Game.GetPlayer().RemoveItem(Alias_FrostSaltsAlias.GetReference())
Game.GetPlayer().AddItem(pPotion1,1)
Game.GetPlayer().AddItem(pPotion2,1)
Game.GetPlayer().AddItem(pPotion3,1)
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

GlobalVariable Property pFavorReward  Auto  

Potion Property pPotion1  Auto  
Potion Property pPotion2  Auto  
Potion Property pPotion3  Auto  

Alias Property FrostSaltsAlias  Auto 
