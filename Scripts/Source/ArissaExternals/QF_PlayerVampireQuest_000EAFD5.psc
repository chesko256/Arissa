;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_PlayerVampireQuest_000EAFD5 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE PlayerVampireQuestScript
Quest __temp = self as Quest
PlayerVampireQuestScript kmyQuest = __temp as PlayerVampireQuestScript
;END AUTOCAST
;BEGIN CODE
;TESTING ONLY -- Vampire Cure
kmyquest.VampireCure(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
