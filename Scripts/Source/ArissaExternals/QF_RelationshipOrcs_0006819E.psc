;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_RelationshipOrcs_0006819E Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player knows that Orc Strongholds
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player is now an Orc Friend
Game.GetPlayer().AddtoFaction(OrcFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;enable one of the Orc stronghold markers
DushnikhYalMapMarkerREF.AddToMap ()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property OrcFriendFaction  Auto  

ObjectReference Property DushnikhYalMapMarkerREF  Auto  
