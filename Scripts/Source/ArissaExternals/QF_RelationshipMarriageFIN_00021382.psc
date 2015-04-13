;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_RelationshipMarriageFIN_00021382 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WindhelmHouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiftenHouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiftenHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY house
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_house Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseHouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoveInterest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoveInterest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthHouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkarthHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Door Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentMarriageHouse
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentMarriageHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeHouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunHouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WhiterunHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bed Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player now has access to spouse's house
If Alias_LoveInterest.GetActorRef().IsInFaction(CompanionsFaction) == 0 && Alias_LoveInterest.GetActorRef().IsInFaction(CollegeofWinterholdFaction)== 0
  SetObjectiveDisplayed(10, 1)
EndIf

Game.GetPlayer().AddtoFaction(Alias_Door.GetRef().GetFactionOwner())

Game.GetPlayer().AddKeyIfNeeded(Alias_Door.GetReference())

;player owns the spouse's bed if there is one
Game.GetPlayer().AddtoFaction(Alias_LoveInterest.GetActorRef().GetLinkedRef(apKeyword = SpouseBedKeyword).GetFactionOwner())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player has been to house
SetObjectiveCompleted(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;spouse has forcegreeted
Alias_LoveInterest.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_Bed.ForceRefto(Alias_LoveInterest.GetActorRef().GetLinkedRef(apKeyword = SpouseBedKeyword))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Spouse is dead, shut down the quest

Game.GetPlayer().RemoveFromFaction(PlayerMarriedFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE RelationshipMarriageSpouseHouseScript
Quest __temp = self as Quest
RelationshipMarriageSpouseHouseScript kmyQuest = __temp as RelationshipMarriageSpouseHouseScript
;END AUTOCAST
;BEGIN CODE
;Spouse has forcegreeted
kmyquest.SpouseShop(Alias_LoveInterest.GetActorRef())

;Start checking if the player sleeps in the same location as the spouse
;Alias_LoveInterest.GetActorRef().RegisterForSleep()

;Start collecting gold from the spouse's store
Alias_LoveInterest.RegisterForUpdateGameTime(24)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerMarriedFaction  Auto  

Keyword Property SpouseBedKeyword  Auto  

Faction Property CompanionsFaction  Auto  

Faction Property CollegeofWinterholdFaction  Auto  
