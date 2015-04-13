;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 37
Scriptname QF_dunDarklightQST_0003FA89 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BossHag
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossHag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadWitch
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DeadWitch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunDarklightHagravenKey
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunDarklightHagravenKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Illia
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Illia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Silvia
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Silvia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunDarklightDoorToConfrontation
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunDarklightDoorToConfrontation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunDarklightBossChair
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_dunDarklightBossChair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossWitch
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BossWitch Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
alias_Illia.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Start final confrontation scene in DarklightTowerExterior02, set in Plan dialogue with Illia
setObjectiveCompleted(10,1)
setObjectiveDisplayed(20,1)
dunDarklightConfrontationScene.start()
alias_Illia.getActorReference().evaluatePackage()
alias_dunDarklightDoorToConfrontation.getReference().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Set when Silvia dies, starts Illia forcegreet
alias_Illia.getActorReference().evaluatePackage()
setObjectiveCompleted(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;Set if Illia dies before reaching the top of the tower
setObjectiveFailed(10,1)
setObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Set when the player pulls the lever in the first cell. Gives Illia target of locked door in second cell.
alias_Illia.getActorReference().evaluatePackage()
utility.wait(1)
alias_Illia.getActorReference().evaluatePackage()
utility.wait(1)
alias_Illia.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Set when the player reaches the top of the second cell, allows Illia to start the plan scene
alias_Illia.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;End stage of quest, set in Illia's dialogue
;alias_Illia.getActorReference().setRelationshipRank(game.getPlayer(), 3)

 AchievementsQuest.IncSideQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Set when the player unlocks the locked door on the golden path in the second cell. Gives Illia new target at top of tower.
alias_Illia.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;show scene before following
dunDarklightIlliaRejectFollow.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Set in the confrontation scene, starts combat between illia and Silvia
Actor Illia = Alias_Illia.GetReference() as Actor
Actor Silvia = Alias_Silvia.GetReference() as Actor
Illia.StartCombat(Silvia)
Silvia.StartCombat(Illia)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
alias_Illia.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;Allows Illia to become a follower, sets her as friend
alias_Illia.getActorReference().setRelationshipRank(game.getPlayer(), 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;if you say yes to Illia  or hit the trigger after saying no
dunDarklightIlliaRejectFollow.stop()
alias_Illia.getActorReference().evaluatePackage()
alias_BossHag.getactorReference().disable()
alias_BossWitch.getactorReference().disable()
alias_Silvia.getactorReference().enable()
setObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;If you say no to Illia
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
alias_Illia.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

AchievementsScript Property AchievementsQuest Auto

scene Property dunDarklightilliaRejectFollow  Auto  

scene Property dunDarklightConfrontationScene  Auto
 

