;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DialogueRiften_000368D8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TemplePriestBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TemplePriestBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlacksmithBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlacksmithBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperBackupBeeandBarb
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnkeeperBackupBeeandBarb Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Housecarlbackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Housecarlbackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtWizard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CourtWizard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostlerBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostlerBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SamuelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SamuelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PawnshopOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PawnshopOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ConstanceAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ConstanceAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TemplePriest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TemplePriest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrancoisAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FrancoisAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Blacksmith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blacksmith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GrelodAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GrelodAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RunaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RunaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DRDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hostler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hostler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TavernkeeperBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TavernkeeperBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PawnshopOwnerBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PawnshopOwnerBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tavernkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tavernkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HroarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HroarAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;JailPass Issued
pJailPass.Value += 1
pJailDoor.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DialogueRiftenQuestScript
Quest __temp = self as Quest
DialogueRiftenQuestScript kmyQuest = __temp as DialogueRiftenQuestScript
;END AUTOCAST
;BEGIN CODE
;Romlyn Mead Sell Stage
Game.GetPlayer().AddItem(kmyQuest.pBBMead, 1)
Game.GetPlayer().RemoveItem(kmyQuest.pGold, 10)
kmyQuest.pMeadCount += 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pJailPass  Auto  

ObjectReference Property pJailDoor  Auto  
