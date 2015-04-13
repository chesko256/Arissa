;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname QF_dunHunterQST_00018601 Extends Quest Hidden

;BEGIN ALIAS PROPERTY guardianWolf
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_guardianWolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY guardianTroll
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_guardianTroll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY guardianMudcrab
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_guardianMudcrab Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY guardianBear
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_guardianBear Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Froki
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Froki Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY disableStuffMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_disableStuffMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY guardianMammoth
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_guardianMammoth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY guardianSabrecat
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_guardianSabrecat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY guardianSkeever
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_guardianSkeever Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; player has received Second set of anointments
setObjectiveDisplayed(60)
setObjectiveDisplayed(61)
setObjectiveDisplayed(62)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; set when the player has killed the first tier
setObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; player has killed the sabrecat
setObjectiveCompleted(62)
if getStageDone(61) == TRUE && getStageDone(60) == TRUE
setStage(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; set when Tier 2 all killed
setObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; player sent after the guardian troll
setObjectiveCompleted(70)
setObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
; player has killed the mammoth
setObjectiveCompleted(61)
if getStageDone(60) == TRUE && getStageDone(62) == TRUE
setStage(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE QF_dunHunterQST_00018601
Quest __temp = self as Quest
QF_dunHunterQST_00018601 kmyQuest = __temp as QF_dunHunterQST_00018601
;END AUTOCAST
;BEGIN CODE
; ; set when player kills guardian Wolf
setObjectiveCompleted(32)
if getStageDone(31) == TRUE && getStageDone(30) == TRUE
setStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE QF_dunHunterQST_00018601
Quest __temp = self as Quest
QF_dunHunterQST_00018601 kmyQuest = __temp as QF_dunHunterQST_00018601
;END AUTOCAST
;BEGIN CODE
; set when player kills guardian Skeever
setObjectiveCompleted(31)
if getStageDone(30) == TRUE && getStageDone(32) == TRUE
setStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
if (Alias_Froki.GetRef()).getItemCount(dunHunterRewardAmulet) >= 1
	; Make sure he has the reward amulet to give (player may have pickpocketed it?)
	(Alias_Froki.GetRef()).removeItem(dunHunterRewardAmulet,1)
	game.getPlayer().addItem(dunHunterRewardAmulet, 1)
endif
Alias_Froki.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; set when player accepts the Contests
; temporarily disable anything we need in the world.  This turns on @ quest end.
Alias_disableStuffMarker.getReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; player has killed the bear
setObjectiveCompleted(60)
if getStageDone(61) == TRUE && getStageDone(62) == TRUE
setStage(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE QF_dunHunterQST_00018601
Quest __temp = self as Quest
QF_dunHunterQST_00018601 kmyQuest = __temp as QF_dunHunterQST_00018601
;END AUTOCAST
;BEGIN CODE
; set when player kills guardian Mudcrab
setObjectiveCompleted(30)
if getStageDone(31) == TRUE && getStageDone(32) == TRUE
setStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; Player killed Froki.  Fail Quest.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; player has received first set of anointments
setObjectiveDisplayed(30)
setObjectiveDisplayed(31)
setObjectiveDisplayed(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; player has killed the troll champion
setObjectiveCompleted(80)
setObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; when froki has intro'd kyne.  This is where the quest proposal hangs until accepted
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
;bool hasKilledSkeever conditional
;bool hasKilledWolf conditional
;bool hasKilledCrab conditional
AchievementsScript Property AchievementsQuest Auto

Armor Property dunHunterRewardAmulet  Auto  
