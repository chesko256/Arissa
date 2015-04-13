;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00020BDF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;SetStage DB02 200
;SetStage DB02a 10
pDB02.SetStage (200)
pDB02a.SetStage (10)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
;DBScript.pNazirStartingOut = 1
DBScript.pSanctuaryAstrid = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB02  Auto  

Quest Property pDB02a  Auto  

Quest Property DarkBrotherhoodQuest  Auto  
