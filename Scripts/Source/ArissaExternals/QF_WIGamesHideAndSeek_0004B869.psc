;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_WIGamesHideAndSeek_0004B869 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PlayerE
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerE Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HideAndSeekMarker5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HideAndSeekMarker5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Habitation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Habitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HideAndSeekMarker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HideAndSeekMarker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HideAndSeekMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HideAndSeekMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerIsIt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerIsIt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ref2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ref2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HideAndSeekMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HideAndSeekMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HideAndSeekMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HideAndSeekMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HabitationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HabitationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ref1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ref1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; debug.trace("WIGamesHideAndSeek stage 255, shut down.")
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIGamesHideAndSeekScript
Quest __temp = self as Quest
WIGamesHideAndSeekScript kmyQuest = __temp as WIGamesHideAndSeekScript
;END AUTOCAST
;BEGIN CODE
; debug.trace("WIGamesTag stage 0")
;debug.messagebox("WIGamesTag stage 0")

Alias_PlayerA.ForceRefTo(Alias_Ref1.GetReference())
Alias_PlayerB.ForceRefTo(Alias_Ref2.GetReference())

kmyquest.setNumPlayers()

kmyquest.setIsPlayerInvolved()
kmyquest.Tag(None, Alias_PlayerA.GetActorReference(), self)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
