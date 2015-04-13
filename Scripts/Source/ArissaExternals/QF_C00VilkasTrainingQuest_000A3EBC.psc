;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_C00VilkasTrainingQuest_000A3EBC Extends Quest Hidden

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE C00VilkasTrainingScript
Quest __temp = self as Quest
C00VilkasTrainingScript kmyQuest = __temp as C00VilkasTrainingScript
;END AUTOCAST
;BEGIN CODE
; got him to bleedout
kmyQuest.StopTheFight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE C00VilkasTrainingScript
Quest __temp = self as Quest
C00VilkasTrainingScript kmyQuest = __temp as C00VilkasTrainingScript
;END AUTOCAST
;BEGIN CODE
; hit with magic -- try again
kmyQuest.StopTheFight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE C00VilkasTrainingScript
Quest __temp = self as Quest
C00VilkasTrainingScript kmyQuest = __temp as C00VilkasTrainingScript
;END AUTOCAST
;BEGIN CODE
; quest over

kmyQuest.PassTheSword()
kmyQuest.ParentQuest.SetStage(30)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE C00VilkasTrainingScript
Quest __temp = self as Quest
C00VilkasTrainingScript kmyQuest = __temp as C00VilkasTrainingScript
;END AUTOCAST
;BEGIN CODE
if (C00.GetStage() != 20)
     ; THIS SHOULD NEVER HAPPEN
     Stop()
endif

kmyQuest.StartTheFight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE C00VilkasTrainingScript
Quest __temp = self as Quest
C00VilkasTrainingScript kmyQuest = __temp as C00VilkasTrainingScript
;END AUTOCAST
;BEGIN CODE
; someone else hit him -- try again
kmyQuest.StopTheFight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE C00VilkasTrainingScript
Quest __temp = self as Quest
C00VilkasTrainingScript kmyQuest = __temp as C00VilkasTrainingScript
;END AUTOCAST
;BEGIN CODE
; hit X times
kmyQuest.StopTheFight()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property C00  Auto  
