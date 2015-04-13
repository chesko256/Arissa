;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_dunFellglowKeepQST_00076C30 Extends Quest Hidden

;BEGIN ALIAS PROPERTY JailWolf2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_JailWolf2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Prisoner03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Prisoner03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NecromancerLeader
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NecromancerLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetSceneWarlock
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PetSceneWarlock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JailWolf1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_JailWolf1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetScene_Pet1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PetScene_Pet1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JailGuard
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_JailGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CagedPrisoner
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CagedPrisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FiringRangeMage3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FiringRangeMage3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerSceneWarlock
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PrisonerSceneWarlock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NecromancerAssistant
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_NecromancerAssistant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Prisoner02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Prisoner02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FiringRangeMaster
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FiringRangeMaster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Prisoner01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Prisoner01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FiringRangeMage2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FiringRangeMage2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetScene_Pet2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_PetScene_Pet2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Trigger Fellglow Necromancer scene.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;If the player attacks any of the prisoners, they turn hostile.
PlayerFaction.SetEnemy(PrisonerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Trigger Fellglow Firing Range Scene.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Startup stage for Fellglow Dungeon scenes and events.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Prisoner event flag-- when all of the Warlocks are dead (only possible during MG03
;due to enable states), the prisoners flee.
(PrisonerFactionManager as dunFellglow_PrisonerFactionManager).SetWarlocksDead()
Alias_Prisoner01.GetActorRef().EvaluatePackage()
Alias_Prisoner02.GetActorRef().EvaluatePackage()
Alias_Prisoner03.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Triggers when the jailor warlock releases the wolves on the player.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Trigger Fellglow Dungeon Pet Scene.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property PrisonerScene  Auto  

Scene Property PetScene  Auto  

ObjectReference Property SceneManager  Auto  

ObjectReference Property PrisonerFactionManager  Auto  

ObjectReference Property DoorSupplementalCollision  Auto  

ObjectReference Property EntryDoor  Auto  

Faction Property PlayerFaction  Auto  

Faction Property PrisonerFaction  Auto  
