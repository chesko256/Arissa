;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_FreeformKolskeggrA_0001FD72 Extends Quest Hidden

;BEGIN ALIAS PROPERTY KolskeggrMine
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_KolskeggrMine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pavo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pavo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Miners go back to work
SetObjectiveCompleted(20, 1)

Game.GetPlayer().AddItem(FavorRewardGoldLarge)
Alias_Pavo.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Gat.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

;Pavo now buys ore
Alias_Pavo.GetActorRef().AddtoFaction(FavorJobsMineOreFaction)

CWQuest.AddGarrisonBackToWar(KolskeggrLocation)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Forsworn are dead
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Forsworn boss is dead

If GetStageDone(10) == 1
  SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player knows the mine is infested
SetObjectiveDisplayed(10, 1)

;add map marker
KolskeggrMineMapMarker.AddtoMap()

If (Alias_Boss.GetActorRef().IsDead() == 1)
  SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


MiscObject Property Gold  Auto  

ObjectReference Property KolskeggrMineMapMarker  Auto  

Faction Property FavorJobsMineOreFaction  Auto  

CWScript Property CWQuest  Auto  

Location Property KolskeggrLocation  Auto  

LeveledItem Property FavorRewardGoldLarge  Auto  
