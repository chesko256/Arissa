;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_FreeformSoljundsSinkholeA_0006136B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Perth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Perth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tuthul
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tuthul Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoljundsSinkholeMine
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SoljundsSinkholeMine Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Miners go back to work
SetObjectiveCompleted(20, 1)
Game.GetPlayer().AddItem(FavorRewardGoldLarge)

Alias_Perth.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 2)
Alias_Tuthul.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

;Perth will buy ore
Alias_Perth.GetActorRef().AddtoFaction(FavorJobsMineOreFaction)

;Debug.MessageBox("Civil War needs to activate Soljund's Sinkhole Mine's destructible resource object.")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Boss is dead
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player knows the mine is infested
SetObjectiveDisplayed(10, 1)

;Check if the boss is dead
If Alias_Boss.GetActorRef().IsDead() == 1
  SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

Faction Property FavorJobsMineOreFaction  Auto  

LeveledItem Property FavorRewardGoldLarge  Auto  
