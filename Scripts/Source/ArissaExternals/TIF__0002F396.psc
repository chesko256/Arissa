;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0002F396 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroArrive = 3
(GetOwningQuest() As DarkBrotherhood). pAstrid.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pVeezara.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pArnbjorn.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pGabriella.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pFestus.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pCicero.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  
