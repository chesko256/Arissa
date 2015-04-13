;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_FavorJarlsMakeFriendsTrack_00087E28 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NPC2
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_NPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC1
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_NPC1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Track the new friend
; Debug.Trace("Player has made a new friend")
If !(Alias_NPC1.GetActorRef() == Game.GetPlayer())
  FavorJarlsMakeFriends.TrackFriend(Alias_NPC1.GetActorRef())
ElseIf !(Alias_NPC2.GetActorRef() == Game.GetPlayer())
  FavorJarlsMakeFriends.TrackFriend(Alias_NPC2.GetActorRef())
EndIf
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FavorJarlsMakeFriendsScript Property FavorJarlsMakeFriends  Auto  
