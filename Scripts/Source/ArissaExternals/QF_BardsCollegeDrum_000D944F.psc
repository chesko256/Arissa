;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_BardsCollegeDrum_000D944F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RjornsDrum
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RjornsDrum Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Giraud
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Giraud Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Drum has been recovered

SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Giraud has given the quest to the player

SetObjectiveDisplayed(20,1)
MapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Drum has been returned to Giraud

SetObjectiveCompleted(40,1)
Alias_Giraud.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Game.GetPlayer().RemoveItem(Alias_RjornsDrum.GetRef(), 1)

Game.IncrementSkill(Block)
Game.IncrementSkill(Marksman)
Game.IncrementSkill(OneHanded)
Game.IncrementSkill(TwoHanded)
Game.IncrementSkill(HeavyArmor)
Game.IncrementSkill(Smithing)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Player grabbed item before getting the quest
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ObjectReference Property MapMarker  Auto  

string Property Block  Auto  

string Property HeavyArmor  Auto  

string Property OneHanded  Auto  

string Property TwoHanded  Auto  

string Property Marksman  Auto  

string Property Smithing  Auto  
