;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_BQ02_000BD77F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BountyLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BountyLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bounty
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bounty Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE BQScript
Quest __temp = self as Quest
BQScript kmyQuest = __temp as BQScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "BQ quest started")
Alias_Hold.GetLocation().setKeywordData(kmyquest.BQActiveQuest, 2)	;# = this quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player has recieved quest
Alias_Letter.TryToEnable()
Game.GetPlayer().AddItem(Alias_Letter.GetReference())
SetObjectiveDisplayed(10)
Alias_MapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE BQScript
Quest __temp = self as Quest
BQScript kmyQuest = __temp as BQScript
;END AUTOCAST
;BEGIN CODE
;Jarl is now player's friend
Alias_Jarl.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

Alias_Hold.GetLocation().setKeywordData(kmyquest.BQActiveQuest, 0)
;Patch 1.9 #74354 changed to CompleteAllObjectives
CompleteAllObjectives()
((self as quest) as BQScript).RewardPlayer()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has finished the quest
setObjectiveCompleted(10)

if Alias_Steward.GetReference()
	setObjectiveDisplayed(100)
else
	setObjectiveDisplayed(101)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
