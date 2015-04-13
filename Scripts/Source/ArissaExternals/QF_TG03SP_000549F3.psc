;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 44
Scriptname QF_TG03SP_000549F3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG03SPSabjornAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03SPSabjornAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03SPMallusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03SPMallusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG03SPCaptainAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG03SPCaptainAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Captain of the Guard Maintenance
Alias_TG03SPCaptainAlias.GetActorReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;Sabjorn Maintenance
Alias_TG03SPSabjornAlias.GetActorReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE TG03SPQuestScript
Quest __temp = self as Quest
TG03SPQuestScript kmyQuest = __temp as TG03SPQuestScript
;END AUTOCAST
;BEGIN CODE
;Start the Scene
kmyQuest.pTG03SPMeadScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN AUTOCAST TYPE TG03SPQuestScript
Quest __temp = self as Quest
TG03SPQuestScript kmyQuest = __temp as TG03SPQuestScript
;END AUTOCAST
;BEGIN CODE
;Scene Done
kmyQuest.pTG03Quest.SetStage(80)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
