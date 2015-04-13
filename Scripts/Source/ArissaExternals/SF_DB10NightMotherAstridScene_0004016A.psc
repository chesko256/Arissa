;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DB10NightMotherAstridScene_0004016A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ImagespaceModifier.RemoveCrossfade(0.25)
CoffinOpenSound.Play(Coffin)
DB10.SetStage(60)
NazirAlias.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DB10  Auto  

ReferenceAlias Property AstridEndAlias  Auto  

sound Property CoffinOpenSound  Auto  

ObjectReference Property Coffin  Auto  

ImagespaceModifier Property NMCoffinBlackIS  Auto  

ReferenceAlias Property NazirAlias  Auto  
