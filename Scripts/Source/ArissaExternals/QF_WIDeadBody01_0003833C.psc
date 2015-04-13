;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_WIDeadBody01_0003833C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Corpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Corpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander9 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WIDeadBody01
Quest __temp = self as Quest
WIDeadBody01 kmyQuest = __temp as WIDeadBody01
;END AUTOCAST
;BEGIN CODE
Alias_Guard1.GetActorReference().startCombat(Game.GetPlayer())
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE WIDeadBody01
Quest __temp = self as Quest
WIDeadBody01 kmyQuest = __temp as WIDeadBody01
;END AUTOCAST
;BEGIN CODE
;player under arrest
Alias_Guard1.GetActorReference().GetCrimeFaction().ModCrimeGold(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE WIDeadBody01
Quest __temp = self as Quest
WIDeadBody01 kmyQuest = __temp as WIDeadBody01
;END AUTOCAST
;BEGIN CODE
Alias_Guard1.GetActorReference().GetCrimeFaction().SendPlayerToJail()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
