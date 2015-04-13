;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_CW01AOutfitImperial_000C349B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Beirand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Beirand Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CW01AOutfitImperialScript
Quest __temp = self as Quest
CW01AOutfitImperialScript kmyQuest = __temp as CW01AOutfitImperialScript
;END AUTOCAST
;BEGIN CODE
;medium
Game.GetPlayer().AddItem(kmyquest.CWPlayerUniformImperialMedium)
setObjectiveCompleted(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CW01AOutfitImperialScript
Quest __temp = self as Quest
CW01AOutfitImperialScript kmyQuest = __temp as CW01AOutfitImperialScript
;END AUTOCAST
;BEGIN CODE
;light
Game.GetPlayer().AddItem(kmyquest.CWPlayerUniformImperialLight)
setObjectiveCompleted(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;called in final line of dialogue

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Rikke told player to get outfit
setObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CW01AOutfitImperialScript
Quest __temp = self as Quest
CW01AOutfitImperialScript kmyQuest = __temp as CW01AOutfitImperialScript
;END AUTOCAST
;BEGIN CODE
;heavy
Game.GetPlayer().AddItem(kmyquest.CWPlayerUniformImperialHeavy)
setObjectiveCompleted(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
