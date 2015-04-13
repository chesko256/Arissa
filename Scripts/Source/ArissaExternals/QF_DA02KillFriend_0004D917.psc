;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_DA02KillFriend_0004D917 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DeadFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadFriend Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DA02KillFriendScript
Quest __temp = self as Quest
DA02KillFriendScript kmyQuest = __temp as DA02KillFriendScript
;END AUTOCAST
;BEGIN CODE
; debug.trace("DA02KillFriend stage 0 is forcing DA02 DeadFriend alias to be the same as it's DeadFriend alias: " + Alias_DeadFriend.GetReference() + " and setting stage 300 on DA02")
kmyquest.DA02DeadFriend.ForceRefTo(Alias_DeadFriend.GetReference())
kmyquest.DA02BoethiahsConduit.ForceRefTo(Alias_DeadFriend.GetReference())
kmyquest.DA02.SetStage(11)

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
