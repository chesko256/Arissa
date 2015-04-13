;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname QF_TG00SpectatorQuest_00020BE7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG00SPBrandSheiAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00SPBrandSheiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00Spectator02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00Spectator02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00SPBrynjolfAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00SPBrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00Spectator05
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00Spectator05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00SPMadesiAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00SPMadesiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00Spectator04
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00Spectator04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00Spectator03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00Spectator03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TG00GrelkaAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TG00GrelkaAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE TG00SceneScript
Quest __temp = self as Quest
TG00SceneScript kmyQuest = __temp as TG00SceneScript
;END AUTOCAST
;BEGIN CODE
;Initialize Scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;All NPCs in Position, Start Main Scene
pTG00Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE TG00SceneScript
Quest __temp = self as Quest
TG00SceneScript kmyQuest = __temp as TG00SceneScript
;END AUTOCAST
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE TG00SceneScript
Quest __temp = self as Quest
TG00SceneScript kmyQuest = __temp as TG00SceneScript
;END AUTOCAST
;BEGIN CODE
if kmyQuest.pTG00Quest.GetStage() < 30
kmyQuest.pTG00SPExtendScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE TG00SceneScript
Quest __temp = self as Quest
TG00SceneScript kmyQuest = __temp as TG00SceneScript
;END AUTOCAST
;BEGIN CODE
if kmyQuest.pTG00SPMainScene.IsPlaying() == 1
kmyQuest.pTG00SPMainScene.Stop()
kmyQuest.pTG00SPEndScene.Start()
endif

if kmyQuest.pTG00SPExtendScene.IsPlaying() == 1
kmyQuest.pTG00SPExtendScene.Stop()
kmyQuest.pTG00SPEndScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pTG00Scene  Auto  

TG00SceneScript Property pTG00SS  Auto  

Quest Property pTG00Quest  Auto  
