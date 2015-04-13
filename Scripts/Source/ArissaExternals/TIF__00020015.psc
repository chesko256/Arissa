;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00020015 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Set DarkBrotherhood.FirstSet to 1
;SetStage DB02a 20
;Startquest DarkSideContractDialogue
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.FirstSet = 1
pDB02a.SetStage (20)
pDarkSideDialogue.Start ()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  


Quest Property pDB02a  Auto  

Quest Property pDarkSideDialogue  Auto  
