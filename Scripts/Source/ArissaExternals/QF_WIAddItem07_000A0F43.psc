;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_WIAddItem07_000A0F43 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ItemLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ItemLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calcelmo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calcelmo Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WIAddItem07Script
Quest __temp = self as Quest
WIAddItem07Script kmyQuest = __temp as WIAddItem07Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(10)
kmyquest.PayPlayer(1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;player read note

setObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;player said no
setObjectiveDisplayed(10, false)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIAddItem07Script
Quest __temp = self as Quest
WIAddItem07Script kmyQuest = __temp as WIAddItem07Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetNextEventGlobals()	;lives in parent script WorldInteractionsScript
; debug.trace("WIAddItem07 Stage 0")

;NOTE: A great deal happens in WIAddItem07Script's OnStoryAddToPlayer event
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE WIAddItem07Script
Quest __temp = self as Quest
WIAddItem07Script kmyQuest = __temp as WIAddItem07Script
;END AUTOCAST
;BEGIN CODE
kmyquest.PayPlayer(2)
setObjectiveCompleted(10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
