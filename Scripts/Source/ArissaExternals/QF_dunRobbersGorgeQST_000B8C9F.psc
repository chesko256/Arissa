;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_dunRobbersGorgeQST_000B8C9F Extends Quest Hidden

;BEGIN ALIAS PROPERTY LeverTriggerEast2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeverTriggerEast2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sentry
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sentry Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeverTriggerWest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeverTriggerWest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeverTriggerEast
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeverTriggerEast Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EastLeverPuller
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EastLeverPuller Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Startup stage.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Bandits go hostile if you enter the gorge without paying (30), or enter the camp.
BanditFaction.SetEnemy(PlayerFaction)
PlayerFaction.SetEnemy(BanditFaction)
Alias_LeverTriggerEast.GetReference().Disable()
Alias_LeverTriggerEast2.GetReference().Disable()
Alias_LeverTriggerWest.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player pays toll.
Alias_Sentry.GetActorRef().SetAV("Variable08", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Bandits go hostile and pull the levers if you're in the center of the gorge.
SetStage(30)
if (GetStageDone(40))
   Alias_LeverTriggerEast.GetReference().Enable()
   Alias_LeverTriggerEast2.GetReference().Enable()
   Alias_LeverTriggerWest.GetReference().Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Move the sentry into South position.
Alias_Sentry.GetActorRef().SetAV("Variable06", 1)
Alias_Sentry.GetActorRef().SetAV("Variable07", 0)
Alias_Sentry.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Player enters the gorge.
if (Alias_Sentry.GetActorRef().GetAV("Variable08") == 0)
   Setstage(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Move the sentry into the North position.
Alias_Sentry.GetActorRef().SetAV("Variable06", 2)
Alias_Sentry.GetActorRef().SetAV("Variable07", 0)
Alias_Sentry.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerFaction  Auto  

Faction Property BanditFaction  Auto  
