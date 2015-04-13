;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_dunIcerunnerQST_000906D4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bandit02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit12
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit05
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IcerunnerEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_IcerunnerEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit09
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit10
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit07
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RowboatEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RowboatEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushBanditDisableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmbushBanditDisableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushBanditEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmbushBanditEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit04
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit13
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit11
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit08
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bandit08 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
if(!GetStageDone(20))
   Alias_AmbushBanditEnableMarker.GetReference().Enable()
   Alias_AmbushBanditDisableMarker.GetReference().Disable()
   SetStage(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Clear out the rowboats and topdeck bandits.
Alias_RowboatEnableMarker.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Enable the Icerunner & Bandits.
Alias_IcerunnerEnableMarker.GetReference().Enable()
Alias_RowboatEnableMarker.GetReference().Enable()
Alias_Bandit12.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Alias_Bandit01.GetActorRef().Disable()
Alias_Bandit02.GetActorRef().Disable()
Alias_Bandit03.GetActorRef().Disable()
Alias_Bandit04.GetActorRef().Disable()
Alias_Bandit05.GetActorRef().Disable()
;Alias_Bandit06.GetActorRef().Disable()
Alias_Bandit07.GetActorRef().Disable()
Alias_Bandit08.GetActorRef().Disable()
Alias_Bandit09.GetActorRef().Disable()
Alias_Bandit10.GetActorRef().Disable()
Alias_Bandit11.GetActorRef().Disable()
Alias_Bandit12.GetActorRef().Disable()
Alias_Bandit13.GetActorRef().Disable()
;Alias_Bandit14.GetActorRef().Disable()
Alias_AmbushBanditEnableMarker.GetReference().Disable()
Alias_AmbushBanditDisableMarker.GetReference().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Set bandits hostile.
BanditFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BanditFaction  Auto  

Faction Property PlayerFaction  Auto  
