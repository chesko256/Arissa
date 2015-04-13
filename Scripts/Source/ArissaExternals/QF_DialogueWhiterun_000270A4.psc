;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_DialogueWhiterun_000270A4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BalgruufAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BalgruufAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BraithAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BraithAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PawnshopOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PawnshopOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmrenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmrenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VignarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VignarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Apothecary
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Apothecary Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OlfridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OlfridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MikaelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MikaelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostlerBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostlerBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LarsAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LarsAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardCaptain
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardCaptain Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StallOwnerFruits
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StallOwnerFruits Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Priestess
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Priestess Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Housecarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Housecarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IrilethAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IrilethAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ApothecaryBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ApothecaryBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StallOwnerJewelry
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StallOwnerJewelry Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Blacksmith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blacksmith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaffirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SaffirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UthgerdAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UthgerdAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hostler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hostler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnkeeperBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnkeeperBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AdrianneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AdrianneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PriestessBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PriestessBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlackSmithBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlackSmithBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StallOwnerMeat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StallOwnerMeat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardCaptainBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardCaptainBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkulvarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkulvarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PawnshopOwnerBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PawnshopOwnerBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IdolafAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IdolafAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DrunkenHuntsmanOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DrunkenHuntsmanOwner Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has talked to Carlotta about her men troubles
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Jon's first conversation done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has talked to Idolaf and chosen a side
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Scene between Adrianne and Battle-Born has played
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

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Heimskr mentions the Justiciars
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
