;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_dunVolunruudQST_0008ADFA Extends Quest Hidden

;BEGIN ALIAS PROPERTY Relic01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Relic01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kvenel
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Kvenel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FieldJournal
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FieldJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relic02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Relic02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PuzzleDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PuzzleDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadGeneaologist
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DeadGeneaologist Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; player got relic02
; if also got relic01, advance stage
if getStageDone(13) == TRUE
    setStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Player has found the Notes clue
; OR the player skipped that and found the door first.
setObjectiveDisplayed(10)
bool got01
bool got02
if (game.getPlayer()).getItemCount(relic01baseID) >= 1
     setStage(13)
     got01 = true
endif
if (game.getPlayer()).getItemCount(relic02baseID) >= 1
     setStage(14)
     got02 = true
endif
if got01 == true && got02 == true
   setStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; player has both relics, now to use them
setObjectiveCompleted(10)
setObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; Kvenel is killed
setObjectiveCompleted(30)
AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; player got relic01
; if also got relic02, advance stage
if getStageDone(14) == TRUE
    setStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; player has placed both of the relics in the door relief
setObjectiveCompleted(20)
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Just a Startup Stage
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

weapon Property relic01BaseID  Auto  

weapon Property relic02baseID  Auto  
AchievementsScript Property AchievementsQuest Auto
