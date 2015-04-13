;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_MS12NurelionDiesScene_0002C267 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Nurelion.GetActorReference().AddToFaction(HarmlessCorpse)
NurelionEssential.Clear()
Nurelion.GetActorReference().Kill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Nurelion  Auto  

Faction Property HarmlessCorpse  Auto  

ReferenceAlias Property NurelionEssential  Auto  
