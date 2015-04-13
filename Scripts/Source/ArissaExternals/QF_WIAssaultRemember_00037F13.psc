;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WIAssaultRemember_00037F13 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIAssaultRememberScript
Quest __temp = self as Quest
WIAssaultRememberScript kmyQuest = __temp as WIAssaultRememberScript
;END AUTOCAST
;BEGIN CODE
Actor VictimActor = Alias_Victim.GetActorReference()


; debug.trace("WIAssaultRemember adding " + VictimActor + " to WIAssaultFaction")
VictimActor.AddToFaction(kmyquest.WIs.WIAssaultedFaction)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
