;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_dunBlindCliffQST_00039B3B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Petra
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Petra Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Melka
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Melka Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MelkaReleaseButton
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MelkaReleaseButton Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MelkaGoalMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MelkaGoalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MelkaPrisonMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MelkaPrisonMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;(MalkaBarks.getOwningQuest()).start()
;(MalkaBarks.getOwningQuest()).setStage(11)
(alias_Melka.getReference()).moveTo(alias_MelkaPrisonMarker.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;setObjectiveDisplayed(15,false)
;failAllObjectives()
if dunBlindCliffQST.gotReward == FALSE
     if(alias_melka.getActorReference()).getItemCount(rewardStaff) < 1
        (alias_melka.getActorReference()).addItem(rewardStaff, 1)
     endif
   dunBlindCliffQST.gotReward == TRUE
endif
; debug.trace("DunBlindCliffQST Stage: " + 200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; stage set when trap deactivated
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Scene stage @ Hall Cage Trap
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; trying a dummy stage for quest script processing
(MalkaBarks.getOwningQuest()).start()
objectReference Melka = alias_melka.getActorReference()
(Melka as actor).evaluatePackage()
Melka.moveTo(alias_MelkaPrisonMarker.getReference())
utility.wait(1)
MalkaBarks.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE QF_dunBlindCliffQST_00039B3B
Quest __temp = self as Quest
QF_dunBlindCliffQST_00039B3B kmyQuest = __temp as QF_dunBlindCliffQST_00039B3B
;END AUTOCAST
;BEGIN CODE
; the player releases Melka from her cage
; set objective redundantly in case player didn't hear dialogue
setObjectiveDisplayed(15)
; debug.trace("DunBlindCliffQST Stage: " + 20)
(alias_melka.getActorReference()).evaluatePackage()
MalkaBarks.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;setObjectiveDisplayed(15,false)
setObjectiveCompleted(15)
; debug.trace("DunBlindCliffQST Stage: " + 100)
AchievementsQuest.IncSideQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; when Malka enters the boss chamber, presumably sees Petra
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; comment for sunlit room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if (alias_Petra.getActorReference()).isDead() == FALSE
setObjectiveDisplayed(15)
; debug.trace("DunBlindCliffQST Stage: " + 15)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; This stage exists to temporarily hold old dialogue
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Melka Comments on the Dart Trap
; debug.trace("DunBlindCliffQST Stage: " + 30)
(alias_melka.getActorReference()).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property MalkaBarks  Auto 
weapon property RewardStaff auto
AchievementsScript Property AchievementsQuest Auto
dunBlindCliffQSTscript property dunBlindCliffQST auto
