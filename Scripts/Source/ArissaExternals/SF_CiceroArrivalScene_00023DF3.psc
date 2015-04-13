;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_CiceroArrivalScene_00023DF3 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroArrive = 3
;AstridAlias.GetActorReference().EvaluatePackage()
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

Scene Property pCiceroEndArriveScene  Auto  

Scene Property pCiceroArrivalScene  Auto  

ObjectReference Property DBSanctuary_EnableCiceroOnNextEntry  Auto  

ReferenceAlias Property AstridAlias  Auto  
