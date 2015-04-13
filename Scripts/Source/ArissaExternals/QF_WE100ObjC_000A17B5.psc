;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_WE100ObjC_000A17B5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Item Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player reads the note

setObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Success!
;player took item


; debug.trace(self + "stage 100, completing objective")

setObjectiveCompleted(1)

; debug.trace(self + "stage 100, stoping quest")
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WE100ObjScript
Quest __temp = self as Quest
WE100ObjScript kmyQuest = __temp as WE100ObjScript
;END AUTOCAST
;BEGIN CODE
;*** This quest is started with keyword sending story event from WE100
;*** There are multiples of this quest, they should be identical
;*** If you add more of these quests make sure you add them to the conditions on WE100 
;*** Any changes to this quest need to be made in all the other WE100ObjX quests

; debug.trace(self + "stage 0")

 if kmyquest.WE100ReadLetter.GetValue() == 1
	;we've already read it before this quest started
; 	debug.trace(self + "stage 0 kmyquest.WE100ReadLetter.GetValue() == 1")
	setStage(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
