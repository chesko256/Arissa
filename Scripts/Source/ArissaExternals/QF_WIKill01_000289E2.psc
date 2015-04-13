;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_WIKill01_000289E2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Relative5
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative2
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoyfriendGirlfriend
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_BoyfriendGirlfriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative9
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative7
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative10
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative8
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend7
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend2
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative6
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative1
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative3
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Relative4
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Relative4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend3
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend4
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend1
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend6
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend5
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RelationIntoFaction
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_RelationIntoFaction Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend8
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend9
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend10
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Friend10 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIKill01Script
Quest __temp = self as Quest
WIKill01Script kmyQuest = __temp as WIKill01Script
;END AUTOCAST
;BEGIN CODE
kmyquest.pStartMourningDay = kmyquest.pGameDaysPassed.value
kmyquest.pEndMourningDay = kmyquest.pGameDaysPassed.value + 7
WIFunctionsScript vWI = kmyquest.pWI as WIFunctionsScript
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative1)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative2)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative3)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative4)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative5)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative6)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative7)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative8)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative9)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Relative10)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_BoyfriendGirlfriend)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend1)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend2)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend3)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend4)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend5)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend6)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend7)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend8)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend9)
vWI.PutMournerAliasInFaction(Alias_Victim, Alias_Friend10)

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
