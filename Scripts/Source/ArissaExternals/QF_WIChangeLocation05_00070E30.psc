;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WIChangeLocation05_00070E30 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Habitation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Habitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Friend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE WIChangeLocation05
Quest __temp = self as Quest
WIChangeLocation05 kmyQuest = __temp as WIChangeLocation05
;END AUTOCAST
;BEGIN CODE
; debug.trace("WIChangeLocation04 started in location:" + Alias_NewLocation.GetLocation())
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIChangeLocation05
Quest __temp = self as Quest
WIChangeLocation05 kmyQuest = __temp as WIChangeLocation05
;END AUTOCAST
;BEGIN CODE
;NOT SURE HOW TO CHECK FOR CHILD IN PAPYRUS SO USING CONDITIONS ON STAGE ITEM

Game.GetPlayer().AddItem(kmyquest.WIChangeLocation05GiftChild, 1)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE WIChangeLocation05
Quest __temp = self as Quest
WIChangeLocation05 kmyQuest = __temp as WIChangeLocation05
;END AUTOCAST
;BEGIN CODE
;NOT SURE HOW TO CHECK FOR CHILD IN PAPYRUS SO USING CONDITIONS ON STAGE ITEM

Game.GetPlayer().AddItem(kmyquest.WIChangeLocation05GiftAdult, 1)

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
