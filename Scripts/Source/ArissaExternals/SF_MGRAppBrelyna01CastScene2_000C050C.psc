;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_MGRAppBrelyna01CastScene2_000C050C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;GetOwningQuest().SetStage(30)
Game.GetPlayer().SetAlpha(1)
if Creature1.GetReference().IsDisabled() == 0
Creature1.GetReference().Disable()
endif
if Creature2.GetReference().IsDisabled() == 0
Creature2.GetReference().Disable()
endif
if Creature3.GetReference().IsDisabled() == 0
Creature3.GetReference().Disable()
endif
(GetOwningQuest() as MGRAppBrelyna01QuestScript).Spell2Cast = -1
Game.EnablePlayerControls()
Game.SetInCharGen(false, false, false)
Brelyna.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Game.ForceThirdPerson()
Game.DisablePlayerControls(true, true, true, false, true, true, true, true)
Game.SetInCharGen(true, true, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Brelyna  Auto  

ReferenceAlias Property Creature1  Auto  

ReferenceAlias Property Creature2  Auto  

ReferenceAlias Property Creature3  Auto  
