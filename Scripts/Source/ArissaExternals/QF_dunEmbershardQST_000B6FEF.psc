;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_dunEmbershardQST_000B6FEF Extends Quest Hidden

;BEGIN ALIAS PROPERTY LootRoomGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootRoomGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BridgeBandit01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BridgeBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BridgeBandit02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BridgeBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlertBandit02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlertBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlertBandit01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlertBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BridgesLever01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BridgesLever01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE QF_dunEmbershardQST_000B6FEF
Quest __temp = self as Quest
QF_dunEmbershardQST_000B6FEF kmyQuest = __temp as QF_dunEmbershardQST_000B6FEF
;END AUTOCAST
;BEGIN CODE
;Gets set when the lever for the two bridges gets pulled

if (Alias_BridgeBandit01.GetActorRef()).isDead() == 1 && (Alias_BridgeBandit02.GetActorRef()).isDead() == 1 && GetStageDone(30) == 0
	;Start Bandit Alert scene
	;debug.messagebox("BridgeBandits are dead, start AlertBandits scene")
	Alias_AlertBandit01.GetReference().Enable()
	Alias_AlertBandit02. GetReference().Enable()
	kmyquest.AlertBanditsSCENE.Start()
else
	;Do Nothing
	;debug.messagebox("BridgeBandits aren't dead, not start AlertBandits scene")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Set if the player comes in the expected way.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Set if the player comes in the unexpected way.
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property AlertBanditsSCENE  Auto  
