;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_dunFaldarsToothQST_0004E667 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FaldarsToothLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_FaldarsToothLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IntroDog02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_IntroDog02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IntroBandit
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_IntroBandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FightingPitBandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FightingPitBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FightingPitBandit03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FightingPitBandit03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExtDoorLever
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExtDoorLever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FightingPitWolf
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FightingPitWolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IntroDog01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_IntroDog01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CageDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CageDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FightingPitBandit02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FightingPitBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CardGameBandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CardGameBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FightingPitDog
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FightingPitDog Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CardGameBandit02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CardGameBandit02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;boss killed
Scene3Complete = True
if Scene1Complete && Scene2Complete && Scene3Complete
	setStage(100)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE QF_dunFaldarsToothQST_0004E667
Quest __temp = self as Quest
QF_dunFaldarsToothQST_0004E667 kmyQuest = __temp as QF_dunFaldarsToothQST_0004E667
;END AUTOCAST
;BEGIN CODE
;Dog Fighting Ring scene complete
(alias_FightingPitDog.getReference() as actor).addToFaction(dunFaldarsToothDogAttackFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;BossKilled
dunFaldarsToothBossReserve.clear()
dunFaldarsToothLocReserve.clear()
PostQuestDisableMarker.disable()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;start up stage of quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE QF_dunFaldarsToothQST_0004E667
Quest __temp = self as Quest
QF_dunFaldarsToothQST_0004E667 kmyQuest = __temp as QF_dunFaldarsToothQST_0004E667
;END AUTOCAST
;BEGIN CODE
; debug.Trace("dunFaldarToothQST has set stage 10")
alias_extDoorLever.getReference().activate(alias_extDoorLever.getReference())
(alias_introBandit.getReference() as actor).removeFromFaction(dunPrisonerFaction)
(alias_introDog01.getReference() as actor).evaluatePackage()
(alias_introDog02.getReference() as actor).evaluatePackage()
Scene1Complete = True
if Scene1Complete && Scene2Complete && Scene3Complete
	setStage(100)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;betting scene complete
Scene2Complete = True
if Scene1Complete && Scene2Complete && Scene3Complete
	setStage(100)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE QF_dunFaldarsToothQST_0004E667
Quest __temp = self as Quest
QF_dunFaldarsToothQST_0004E667 kmyQuest = __temp as QF_dunFaldarsToothQST_0004E667
;END AUTOCAST
;BEGIN CODE
;cage unlocked, end cage fight scene
kmyQuest.dunFaldarsToothCageFight.stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

faction Property introFarmerFaction  Auto  

faction Property dunFaldarsToothDogAttackFaction  Auto  

faction Property dunPrisonerFaction  Auto  

Scene Property dunFaldarsToothCageFight  Auto  

ReferenceAlias Property dunFaldarsToothBossReserve  Auto  

LocationAlias Property dunFaldarsToothLocReserve  Auto  

ObjectReference Property postQuestDisableMarker  Auto  

bool Property Scene1Complete  Auto  

bool Property Scene2Complete  Auto  

bool Property Scene3Complete  Auto  

