;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0002AD00 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDBSideContract06.SetStage (10)
pDBSideContract07.SetStage (10)
pDBSideContract08.SetStage (10)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.NextSet = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDBSideContract06  Auto  

Quest Property pDBSideContract07  Auto  

Quest Property pDBSideContract08  Auto  

Quest Property DarkBrotherhoodQuest  Auto  
