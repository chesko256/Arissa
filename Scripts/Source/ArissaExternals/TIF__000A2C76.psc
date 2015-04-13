;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000A2C76 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.GetCrimeFaction().SetCrimeGold(0)
akspeaker.GetCrimeFaction().SetCrimeGoldViolent(0)
Game.GetPlayer().StopCombatAlarm()
FavorJarlsMakeFriends.EastmarchImpGetOutofJail = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property JarlMarkarth  Auto  

ReferenceAlias Property JarlWhiterun  Auto  

ReferenceAlias Property JarlSolitude  Auto  

ReferenceAlias Property JarlWindhelm  Auto  

FavorJarlsMakeFriendsScript Property FavorJarlsMakeFriends  Auto  
