;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0009BE4C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DarkBrotherhood DBScript = GetOwningQuest() as DarkBrotherhood
AKSpeaker.SetPlayerTeammate()
PlayerFollowerCount.SetValue(1)
DBScript.CiceroFollower = 1
DBScript.CiceroState = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property PlayerFollowerCount  Auto  
