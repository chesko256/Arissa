;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_DialogueDawnstar_0003829F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Blacksmith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blacksmith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Housecarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Housecarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlacksmithBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlacksmithBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnkeeperBackup Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player talked to Madena
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player speaks to Seren
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has talked to Karita
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DialogueSwapGovernmentAliasesScript
Quest __temp = self as Quest
DialogueSwapGovernmentAliasesScript kmyQuest = __temp as DialogueSwapGovernmentAliasesScript
;END AUTOCAST
;BEGIN CODE
RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player asks Frida about Dawnstar
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
