;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_TG07SP_00055AA4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BrynjolfAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_BrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VexAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_VexAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DelvinAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DelvinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarliahAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_KarliahAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TG07SPQuestScript
Quest __temp = self as Quest
TG07SPQuestScript kmyQuest = __temp as TG07SPQuestScript
;END AUTOCAST
;BEGIN CODE
;Last Scene in Vault
pTG07LockAudio.Disable()
pTG07LockAudio02.Disable()
kmyQuest.pTG07SPGuildScene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE TG07SPQuestScript
Quest __temp = self as Quest
TG07SPQuestScript kmyQuest = __temp as TG07SPQuestScript
;END AUTOCAST
;BEGIN CODE
;First Scene is Complete... Trigger Second Part
kmyQuest.pTG07SPGuildScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TG07SPQuestScript
Quest __temp = self as Quest
TG07SPQuestScript kmyQuest = __temp as TG07SPQuestScript
;END AUTOCAST
;BEGIN CODE
;Trigger First Scene
kmyQuest.pTG07SPGuildScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE TG07SPQuestScript
Quest __temp = self as Quest
TG07SPQuestScript kmyQuest = __temp as TG07SPQuestScript
;END AUTOCAST
;BEGIN CODE
;Scene Ends, Update Quest
kmyquest.pTG07Quest.SetStage(30)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pTG07LockAudio  Auto  

ObjectReference Property pTG07LockAudio02  Auto  
