;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_TG05SP_0002C367 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG05SPMercerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG05SPMercerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG05SPKarliahAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG05SPKarliahAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TG05SPQuestScript
Quest __temp = self as Quest
TG05SPQuestScript kmyQuest = __temp as TG05SPQuestScript
;END AUTOCAST
;BEGIN CODE
;Begin Scene with Karliah and Mercer
kmyQuest.pTG05Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG05SPQuestScript
Quest __temp = self as Quest
TG05SPQuestScript kmyQuest = __temp as TG05SPQuestScript
;END AUTOCAST
;BEGIN CODE
;Player is affected by Karliah's Poisoned Arrow
if (WerewolfQuest.IsRunning())
	(WerewolfQuest as PlayerWerewolfChangeScript).ShiftBack()
endif
Alias_TG05SPMercerAlias.GetActorRef().StopCombat()
Game.ForceFirstPerson()
pTG05ArrowHitRef.Enable()
pStrikeandFall.Apply()
Game.DisablePlayerControls(true,true,true,true,true,true)
Game.GetPlayer().PlayIdle(pKnockdown)
TG05UnconsciousAudioRef.Enable()
utility.Wait(7)
Game.GetPlayer().MoveTo(kmyQuest.pTG05PlayerDownMarker)
Alias_TG05SPKarliahAlias.GetActorRef().Enable()
Alias_TG05SPKarliahAlias.GetActorRef().EvaluatePackage()
setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE TG05SPQuestScript
Quest __temp = self as Quest
TG05SPQuestScript kmyQuest = __temp as TG05SPQuestScript
;END AUTOCAST
;BEGIN CODE
;First Scene Ends, Start "Kill Scene"
Alias_TG05SPKarliahAlias.GetActorRef().EvaluatePackage()
kmyQuest.pTG05KillScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE TG05SPQuestScript
Quest __temp = self as Quest
TG05SPQuestScript kmyQuest = __temp as TG05SPQuestScript
;END AUTOCAST
;BEGIN CODE
;Mercer Leaves, Player Moves to Exterior After Blackout
TG05UnconsciousAudioRef.Disable()
pTG05TransitionAudio.Enable()
Alias_TG05SPMercerAlias.GetActorRef().Disable()
kmyQuest.pTG05Quest.SetStage(60)
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ImageSpaceModifier Property pStrikeandFall  Auto  

Idle Property pKnockdown  Auto  

Quest Property WerewolfQuest  Auto  

Sound Property pQSTTG05ArrowKnockOut2D  Auto  

ObjectReference Property pTG05ArrowHitRef  Auto  

ObjectReference Property pTG05TransitionAudio  Auto  

ObjectReference Property TG05UnconsciousAudioRef  Auto
