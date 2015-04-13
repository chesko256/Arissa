;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DialogueRiftenRatway_00095F4F Extends Quest Hidden

;BEGIN ALIAS PROPERTY DRRHewnonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DRRHewnonAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DRRDrahffAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DRRDrahffAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Scene is done, Set Patrol
if pScene.IsPlaying() == 1
pScene.Stop()
endif
Alias_DRRDrahffAlias.GetActorRef().EvaluatePackage()
Alias_DRRHewnonAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;The Player has triggered the scene
pScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Done
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pScene  Auto 
