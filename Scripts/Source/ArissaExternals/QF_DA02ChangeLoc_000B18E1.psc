;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DA02ChangeLoc_000B18E1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MarkerC
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_MarkerC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardD
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_GuardD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardC
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_GuardC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerD
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_MarkerD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardB
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_GuardB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerB
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_MarkerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardA
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_GuardA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerA
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_MarkerA Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DA02ChangeLocScript
Quest __temp = self as Quest
DA02ChangeLocScript kmyQuest = __temp as DA02ChangeLocScript
;END AUTOCAST
;BEGIN CODE
; debug.trace("DA02ChangeLoc stage 0, start up. Forcing GuardA/B/C/D aliases in DA02.")

; debug.trace("Forcing and moving GuardA:" +Alias_GuardA.GetReference() )
kmyquest.DA02GuardA.ForceRefTo(Alias_GuardA.GetReference())
kmyquest.DA02GuardA.TryToMoveTo(Alias_MarkerA.GetReference())

; debug.trace("Forcing and moving GuardB:" +Alias_GuardB.GetReference() )
kmyquest.DA02GuardB.ForceRefTo(Alias_GuardB.GetReference())
kmyquest.DA02GuardB.TryToMoveTo(Alias_MarkerB.GetReference())

; debug.trace("Forcing and moving GuardC:" +Alias_GuardC.GetReference() )
kmyquest.DA02GuardC.ForceRefTo(Alias_GuardC.GetReference())
kmyquest.DA02GuardC.TryToMoveTo(Alias_MarkerC.GetReference())

; debug.trace("Forcing and moving GuardD:" +Alias_GuardD.GetReference() )
kmyquest.DA02GuardD.ForceRefTo(Alias_GuardD.GetReference())
kmyquest.DA02GuardD.TryToMoveTo(Alias_MarkerD.GetReference())

; debug.trace("DA02ChangeLoc stage 0, calling Stop()")

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
