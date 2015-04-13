;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_DunWhiteRiverWatchQST_0001C3FB Extends Quest Hidden

;BEGIN ALIAS PROPERTY AmbientSceneBandit1A
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmbientSceneBandit1A Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlarmResponder02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlarmResponder02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlarmResponder01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlarmResponder01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbientSceneBandit2A
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmbientSceneBandit2A Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfSceneBanditB
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WolfSceneBanditB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hajvarr
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hajvarr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rodulf
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Rodulf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wolf
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Wolf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbientSceneBandit1B
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmbientSceneBandit1B Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbientSceneBandit2B
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmbientSceneBandit2B Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfSceneBandit
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WolfSceneBandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Watchman
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Watchman Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlchemistBandit
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AlchemistBandit Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Player has killed Hajvarr. Reset the quest on next load.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;All the bandits are dead, so the wolves turn on the player.
WolfFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Setstage to trigger forcegreet.
(Alias_Watchman.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Startup Stage
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Watchman attacks.
(Alias_Watchman.GetReference() as Actor).StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Watchman summons reinforcements.
Alias_AlarmResponder01.GetReference().Enable()
Alias_AlarmResponder01.GetActorReference().EvaluatePackage()
Alias_AlarmResponder02.GetReference().Enable()
Alias_AlarmResponder02.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;On unload after quest complete, make sure the watchman will never respawn.
SetStage(20)

;Remove Rodolf's Note if needed.
if (Alias_Rodulf.GetActorRef().GetItemCount(dunWhiteRiverWatchNote) > 0)
   Alias_Rodulf.GetActorRef().RemoveItem(dunWhiteRiverWatchNote)
EndIf

;On unload, stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Watchman is not hostile.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property WolfEventManager  Auto  

Faction Property WolfFaction  Auto  

Faction Property PlayerFaction  Auto  

LocationAlias Property WhiteRiverWatchLocationAlias Auto

Book Property dunWhiteRiverWatchNote  Auto  
