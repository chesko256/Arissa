;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 42
Scriptname QF_dunArcherQST_000CAB3C Extends Quest Hidden

;BEGIN ALIAS PROPERTY MiddleTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiddleTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AngiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AngiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AngiTargetLookMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AngiTargetLookMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WeaponRackWeapon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WeaponRackWeapon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RightTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RightTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeftTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeftTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AngisTargetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AngisTargetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FarTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FarTarget Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;player hit middle, left, and right targets
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Archery dialogue opened
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;player attempts final challenge
kmyQuest.angiShootsFinalTime.stop()

kmyQuest.playerChallengeComplete01 = 0
kmyQuest.playerHitTargetLeft = 0
kmyQuest.playerHitTargetMiddle = 0
kmyQuest.playerHitTargetRight = 0
kmyQuest.playerHitTargetFar = 0

kmyQuest.playerShootsAllTargets.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;player hit far target
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;player already has been introduced to Angi
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;player failed the final challenge
kmyQuest.playerShootsAllTargets.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;Angi shoots for the second time
kmyQuest.playerHitMidTarget.stop()
Alias_AngisTargetMarker.GetReference().moveto(Alias_MiddleTarget.GetReference())
kmyQuest.angiShootsSecondTime.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;player attempts second challenge
kmyQuest.angiShootsSecondTime.stop()

kmyQuest.playerChallengeComplete01 = 0
kmyQuest.playerHitTargetLeft = 0
kmyQuest.playerHitTargetMiddle = 0
kmyQuest.playerHitTargetRight = 0
kmyQuest.playerHitTargetFar = 0

kmyQuest.playerShootsThreeTargets.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;player completed the final challenge
game.IncrementSkill("Marksman")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;start combat with the player
(Alias_AngiAlias.getReference() as Actor).startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;player given reward, quest ends
kmyQuest.playerShootsAllTargets.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;Practice Arrows now available
;Player needs to hit middle target
kmyQuest.angiShootsFirstTime.stop()
kmyQuest.playerHitMidTarget.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;Angi shoots for the final time
kmyQuest.playerShootsFarTarget.stop()
Alias_AngisTargetMarker.GetReference().moveto(Alias_MiddleTarget.GetReference())
kmyQuest.angiShootsFinalTime.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;player hit left target
;player now needs to hit the right target
game.IncrementSkill("Marksman")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;Angi Shoots for Third Time
kmyQuest.playerShootsThreeTargets.stop()
Alias_AngisTargetMarker.GetReference().moveto(Alias_FarTarget.GetReference())
kmyQuest.angiShootsThirdTime.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;player hit middle target
;player now needs to hit the left target
game.IncrementSkill("Marksman")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;player completed second challenge
game.IncrementSkill("Marksman")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;player needs to hit far target
kmyQuest.angiShootsThirdTime.stop()

kmyQuest.playerChallengeComplete01 = 0
kmyQuest.playerHitTargetLeft = 0
kmyQuest.playerHitTargetMiddle = 0
kmyQuest.playerHitTargetRight = 0
kmyQuest.playerHitTargetFar = 0

kmyQuest.playerShootsFarTarget.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;player completed third challenge
game.IncrementSkill("Marksman")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;sorry about family becomes open
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;Angi shoots for the first time
Alias_AngisTargetMarker.GetReference().moveto(Alias_MiddleTarget.GetReference())
kmyQuest.angiShootsFirstTime.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE dunArcherQuestScript
Quest __temp = self as Quest
dunArcherQuestScript kmyQuest = __temp as dunArcherQuestScript
;END AUTOCAST
;BEGIN CODE
;player failed second challenge
kmyQuest.playerShootsThreeTargets.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;player hit middle, left, and right targets
game.IncrementSkill("Marksman")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
