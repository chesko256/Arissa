;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_DB02a_00022F47 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DB02aScript
Quest __temp = self as Quest
DB02aScript kmyQuest = __temp as DB02aScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed (10, 1)
Game.GetPlayer().AddToFaction(DarkBrotherhoodFaction)
Game.GetPlayer().AddItem(ArmorDBCuirass,1)
Game.GetPlayer().AddItem(ArmorDBBoots,1)
Game.GetPlayer().AddItem(ArmorDBGauntlets,1)
Game.GetPlayer().AddItem(ArmorDBHelmet,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DB02aScript
Quest __temp = self as Quest
DB02aScript kmyQuest = __temp as DB02aScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (10, 1)
SetObjectiveDisplayed (20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DB02aScript
Quest __temp = self as Quest
DB02aScript kmyQuest = __temp as DB02aScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB01.SetStage (200)
kmyQuest.DB02.SetStage (200)
SetStage (10)
KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
pSanctuaryDoor1.Enable()
pSanctuaryDoor2.Disable()
pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
EntranceScript.pSleepyTime = 6
Alias_AstridAlias.GetReference().Moveto (pAstridSanctuaryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DB02aScript
Quest __temp = self as Quest
DB02aScript kmyQuest = __temp as DB02aScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted (20, 1)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  

Faction Property DarkBrotherhoodFaction  Auto  

Quest Property pDBEntranceQuest  Auto  

ObjectReference Property pAstridSanctuaryMarker  Auto  

Armor Property ArmorDBCuirass  Auto  

Armor Property ArmorDBBoots  Auto  

Armor Property ArmorDBGauntlets  Auto  

Armor Property ArmorDBHelmet  Auto  
