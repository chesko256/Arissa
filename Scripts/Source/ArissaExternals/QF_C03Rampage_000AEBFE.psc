;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_C03Rampage_000AEBFE Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Njada
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Njada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ria
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kodlak
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Kodlak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Athis
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Athis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Torvar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Torvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE C03RampageQuest
Quest __temp = self as Quest
C03RampageQuest kmyQuest = __temp as C03RampageQuest
;END AUTOCAST
;BEGIN CODE
; change you back
kmyQuest.RestorePlayerRace()

; unlock the Whiterun doors
RampageEndTrigger.Delete()
UnderforgeDoor.BlockActivation(false)
WhiterunMainDoor.BlockActivation(false)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE C03RampageQuest
Quest __temp = self as Quest
C03RampageQuest kmyQuest = __temp as C03RampageQuest
;END AUTOCAST
;BEGIN CODE
; lock off Whiterun exits
RampageEndTrigger.Enable()
UnderforgeDoor.BlockActivation()
WhiterunMainDoor.BlockActivation()
kmyQuest.StartRampage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property UnderforgeDoor  Auto  

ObjectReference Property WhiterunMainDoor  Auto  

ObjectReference Property RampageEndTrigger  Auto  
