;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_WIChangeLocation03_0006E028 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Challenger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Challenger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE WIChangeLocation03Script
Quest __temp = self as Quest
WIChangeLocation03Script kmyQuest = __temp as WIChangeLocation03Script
;END AUTOCAST
;BEGIN CODE
Alias_Challenger.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE WIChangeLocation03Script
Quest __temp = self as Quest
WIChangeLocation03Script kmyQuest = __temp as WIChangeLocation03Script
;END AUTOCAST
;BEGIN CODE
;set by script on Challenger alias
setObjectiveCompleted(100)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE WIChangeLocation03Script
Quest __temp = self as Quest
WIChangeLocation03Script kmyQuest = __temp as WIChangeLocation03Script
;END AUTOCAST
;BEGIN CODE
;player didn't agree to the duel but the challenger is attacking him anyway
;guards should help the player
setObjectiveDisplayed(100)
Alias_Challenger.GetActorReference().AddToFaction(kmyquest.WIPlayerEnemyFaction)
Alias_Challenger.GetActorReference().setav("Aggression", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIChangeLocation03Script
Quest __temp = self as Quest
WIChangeLocation03Script kmyQuest = __temp as WIChangeLocation03Script
;END AUTOCAST
;BEGIN CODE
; debug.trace("WIChangeLocation03 started in location:" + Alias_NewLocation.GetLocation())
kmyquest.SetNextEventGlobals()		;lives in parent script WorldInteractionsScript
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE WIChangeLocation03Script
Quest __temp = self as Quest
WIChangeLocation03Script kmyQuest = __temp as WIChangeLocation03Script
;END AUTOCAST
;BEGIN CODE
;player didn't agree to the duel but the challenger is attacking him anyway
;guards should ignore the situation
setObjectiveDisplayed(100)
Alias_Challenger.GetActorReference().AddToFaction(kmyquest.WIPlayerEnemySpecialCombatFaction)
Alias_Challenger.GetActorReference().setav("Aggression", 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
