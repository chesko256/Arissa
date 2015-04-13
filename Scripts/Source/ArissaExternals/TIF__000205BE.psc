;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000205BE Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDBSideContract04.SetStage (10)
pDBSideContract05.SetStage (10)
pDB04.SetStage (200)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.NextSet = 1
DB04Script pDB04Script = pDB04 as DB04Script
pDB04Script.Side = 3
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDBSideContract04  Auto  

Quest Property pDBSideContract05  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

Quest Property pDB04  Auto  
