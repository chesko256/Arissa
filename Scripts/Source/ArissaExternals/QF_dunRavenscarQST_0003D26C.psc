;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_dunRavenscarQST_0003D26C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Boss03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrappedBandit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrappedBandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CageDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CageDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MoveBanditMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MoveBanditMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss04 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE dunRavenscarQST
Quest __temp = self as Quest
dunRavenscarQST kmyQuest = __temp as dunRavenscarQST
;END AUTOCAST
;BEGIN CODE
SetStage(40)
Alias_TrappedBandit.GetActorRef().RemoveFromFaction(kmyquest.PlayerFaction)
Alias_TrappedBandit.GetActorRef().SetAV("Aggression", 3)
Alias_TrappedBandit.GetActorRef().StartCombat(Game.GetPlayer())
utility.wait(4)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE dunRavenscarQST
Quest __temp = self as Quest
dunRavenscarQST kmyQuest = __temp as dunRavenscarQST
;END AUTOCAST
;BEGIN CODE
kmyquest.dunRavenscarSetStageTrigREF.Enable()
Alias_TrappedBandit.GetActorRef().RemoveFromFaction(kmyquest.dunRavenscarFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Moved from OnInit
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Alias_TrappedBandit.GetReference().MoveTo(Alias_MoveBanditMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
