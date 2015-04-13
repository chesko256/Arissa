;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000205BD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Startquest DBSideContract12
;SetStage DBSideContract12 10
;Set DarkBrotherhood.NextSet to 5
pDBSideContract12.SetStage (10)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.NextSet = 5
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDBSideContract12  Auto  

Quest Property DarkBrotherhoodQuest  Auto  
