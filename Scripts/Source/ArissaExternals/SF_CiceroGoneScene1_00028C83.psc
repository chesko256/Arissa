;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_CiceroGoneScene1_00028C83 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.CiceroGone = 2
AstridAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkBrotherhoodQuest  Auto  

ReferenceAlias Property AstridAlias  Auto  
