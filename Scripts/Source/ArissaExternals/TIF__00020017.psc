;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00020017 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDBSideContract01.SetStage (10)
pDBSideContract02.SetStage (10)
pDBSideContract03.SetStage (10)
pDB02a.SetStage (200)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.FirstSet = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDBSideContract01  Auto  

Quest Property pDBSideContract02  Auto  

Quest Property pDBSideContract03  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

Quest Property pDB02a  Auto  
