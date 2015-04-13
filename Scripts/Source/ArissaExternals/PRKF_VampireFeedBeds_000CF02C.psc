;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname PRKF_VampireFeedBeds_000CF02C Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.GetPlayer().StartVampireFeed(aktargetRef as actor)
PlayerVampireQuest.VampireFeed()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

PlayerVampireQuestScript Property PlayerVampireQuest  Auto  
