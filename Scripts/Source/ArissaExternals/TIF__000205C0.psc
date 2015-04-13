;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000205C0 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Startquest DBSideContract10
;SetStage DBSideContract10 10
;Startquest DBSideContract11
;SetStage DBSideContract11 10
;Set DarkBrotherhood.NextSet to 4
pDBSideContract10.SetStage (10)
pDBSideContract11.SetStage (10)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.NextSet = 4
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDBSideContract10  Auto  

Quest Property pDBSideContract11  Auto  

Quest Property DarkBrotherhoodQuest  Auto  
