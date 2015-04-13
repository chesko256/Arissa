;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DBFirstArriveScene_0006E26D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.pFirstSceneOver = 1
(GetOwningQuest() As DarkBrotherhood). pAstrid.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pVeezara.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pArnbjorn.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pGabriella.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pFestus.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pBabette.GetActorReference().EvaluatePackage()
(GetOwningQuest() As DarkBrotherhood). pNazir.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pSanctuaryDialogue  Auto  

Quest Property DarkBrotherhoodQuest  Auto  
