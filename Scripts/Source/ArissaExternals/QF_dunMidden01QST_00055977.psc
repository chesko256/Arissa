;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_dunMidden01QST_00055977 Extends Quest Hidden

;BEGIN ALIAS PROPERTY VelehkSain
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VelehkSain Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RewardChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RewardChest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE QF_dunMidden01QST_00055977
Quest __temp = self as Quest
QF_dunMidden01QST_00055977 kmyQuest = __temp as QF_dunMidden01QST_00055977
;END AUTOCAST
;BEGIN CODE
; player has put all the souls to rest. except for Treoy
; debug.trace(myquest + ": TEMP - SetStage DunMidden01QST(75)")
myQuest.setStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE QF_dunMidden01QST_00055977
Quest __temp = self as Quest
QF_dunMidden01QST_00055977 kmyQuest = __temp as QF_dunMidden01QST_00055977
;END AUTOCAST
;BEGIN CODE
;objectReference MassiveSoulgemREF = Alias_MassiveSoulGem.getReference()
;MassiveSoulgemREF.disable()
objectReference VelehkSainREF = Alias_VelehkSain.getReference()
VelehkSainREF.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player has defeated the Dremora
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player has spoken to Treoy's Gem
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE QF_dunMidden01QST_00055977
Quest __temp = self as Quest
QF_dunMidden01QST_00055977 kmyQuest = __temp as QF_dunMidden01QST_00055977
;END AUTOCAST
;BEGIN CODE
(Alias_VelehkSain.getActorReference()).playIdle(IdleLookFar)
utility.wait(0.2)
(Alias_VelehkSain.getReference()).placeatme(summonTargetFXActivator)
utility.wait(0.33)
(Alias_VelehkSain.getReference()).disable()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; player has put 3/4 souls to rest.  Neccessary stage?
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest property myQuest auto
{point only to dunMiddenQST}

; bool Property  BalwenKnown = false auto conditional
; {has the player learned the name of Balwen?}
; bool Property KatarinaKnown = false Auto  conditional
; {has the player learned the name of Katarina?}
; bool Property PithiKnown = false Auto  conditional
; {has the player learned the name of Pithi?}
; bool Property HerotusKnown = false Auto  conditional
; {has the player learned the name of Herotus?}

bool property TreoyFreed = FALSE auto conditional
{has the player placed Treoy's Ring on the correct finger?}
bool Property  BalwenFreed = false auto conditional
{has the player freed the spirit of Balwen?}
bool Property KatarinaFreed = false Auto  conditional
{has the player freed the spirit of Katarina?}
bool Property PithiFreed = false Auto  conditional
{has the player freed the spirit of Pithi?}
;bool Property HerotusFreed = false Auto  conditional
;{has the player freed the spirit of Herotus?}

activator Property SummonTargetFXActivator  Auto  

idle Property idleLookFar  Auto  

book Property dunMiddenTreasureMap  Auto  
