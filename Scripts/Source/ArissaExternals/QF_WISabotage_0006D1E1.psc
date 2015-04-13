;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WISabotage_0006D1E1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Citizen1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen6
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen11
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen8
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard6
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen9
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen7
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen10
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Settlement
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Settlement Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen12
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ResourceObject
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ResourceObject Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Guard3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Citizen5 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WISabotage
Quest __temp = self as Quest
WISabotage kmyQuest = __temp as WISabotage
;END AUTOCAST
;BEGIN CODE
; debug.trace("WISabotage Stage 0 start. Location:" + Alias_Settlement.GetLocation() + ", ResourceObject:" + Alias_ResourceObject.GetReference())

kmyquest.SetResourceTypeForAlias(Alias_ResourceObject)

; debug.trace("WISabotage Stage 0 end.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
