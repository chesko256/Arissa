;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00092A41 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CrimeGuardsScript).SetupCidhnaMine()
pTGRSS.TGArrestedCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;akSpeaker.GetCrimeFaction().SendPlayerToJail()
;MS02.SetStage(5)
MS01GuardAmbushQuest.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS01  Auto  

TGRShellScript Property pTGRSS  Auto  

Quest Property MS02  Auto  

Quest Property MS01GuardAmbushQuest  Auto  
