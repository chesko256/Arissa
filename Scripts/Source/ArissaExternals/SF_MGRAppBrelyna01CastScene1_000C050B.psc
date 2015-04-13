;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_MGRAppBrelyna01CastScene1_000C050B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(GetOwningQuest() as MGRAppBrelyna01QuestScript).SpellCast=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Game.EnablePlayerControls()
(GetOwningQuest() as MGRAppBrelyna01QuestScript).SpellCast=1
Brelyna.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Game.DisablePlayerControls(true, true, true, false, true, true, true, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Brelyna  Auto  
