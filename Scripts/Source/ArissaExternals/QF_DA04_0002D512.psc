;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname QF_DA04_0002D512 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ExtractorQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExtractorQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Extractor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Extractor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HermaeusMora
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HermaeusMora Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlftandWorldDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlftandWorldDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RuminationsBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RuminationsBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HermaeusMoraRename
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HermaeusMoraRename Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Septimus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Septimus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LexiconStand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LexiconStand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LexiconCubeBlank
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LexiconCubeBlank Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SeptimusEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SeptimusEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CubeStorageChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CubeStorageChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RuminationsQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RuminationsQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LexiconCubeInscribed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LexiconCubeInscribed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AtunementSphere
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AtunementSphere Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UragEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UragEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Urag
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Urag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlackreachLock
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlackreachLock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TowerOfMzarkDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TowerOfMzarkDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TamrielToAlftand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TamrielToAlftand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlftandSecondCellDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlftandSecondCellDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ElderScroll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ElderScroll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OghmaInfinium
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OghmaInfinium Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlftandZCellIntDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlftandZCellIntDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ActualBlackreachDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ActualBlackreachDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;SetObjectiveCompleted(60, 1)
AchievementsQuest.IncDaedricQuests()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE DA04QuestScript
Quest __temp = self as Quest
DA04QuestScript kmyQuest = __temp as DA04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveCompleted(35, 1)

SetObjectiveDisplayed(41, 1)
SetObjectiveDisplayed(42, 1)
SetObjectiveDisplayed(43, 1)
SetObjectiveDisplayed(44, 1)
SetObjectiveDisplayed(45, 1)

Game.GetPlayer().AddItem(Alias_Extractor.GetReference())
Game.GetPlayer().AddPerk(BloodHarvest)
kmyQuest.EnableHM(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE DA04QuestScript
Quest __temp = self as Quest
DA04QuestScript kmyQuest = __temp as DA04QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ReadCrazyBook = true
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE DA04QuestScript
Quest __temp = self as Quest
DA04QuestScript kmyQuest = __temp as DA04QuestScript
;END AUTOCAST
;BEGIN CODE
;cleanup

kmyQuest.EnableHM(false)
Alias_ExtractorQuestItem.Clear()
Alias_OghmaInfinium.GetRef().BlockActivation(false)
Alias_LexiconCubeBlank.Clear()
Alias_LexiconCubeInscribed.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE DA04QuestScript
Quest __temp = self as Quest
DA04QuestScript kmyQuest = __temp as DA04QuestScript
;END AUTOCAST
;BEGIN CODE
;SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(50, 1)

Game.GetPlayer().RemovePerk(BloodHarvest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
SetObjectiveCompleted(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(55, 1)

Alias_OghmaInfinium.GetReference().BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player gets Elder Scroll
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

MzarkMapMarker.enable()
Alias_SeptimusEssential.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveCompleted(5, 1)
SetObjectiveDisplayed(10, 1)

Alias_UragEssential.Clear()

if MQ205.IsRunning()
	MQ205.SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DA04QuestScript
Quest __temp = self as Quest
DA04QuestScript kmyQuest = __temp as DA04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

Game.GetPlayer().AddItem(Alias_AtunementSphere.GetRef(), 1)
Game.GetPlayer().AddItem(Alias_LexiconCubeBlank.GetRef(), 1)

AlftandMapMarker.AddToMap()

; update MQ205
if MQ205.IsRunning()
	MQ205.SetStage(80)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE DA04QuestScript
Quest __temp = self as Quest
DA04QuestScript kmyQuest = __temp as DA04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(55, 1)

AchievementsQuest.IncDaedricArtifacts()

kmyQuest.MoveHM()
kmyQuest.EnableHM(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
FailAllObjectives()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
SetObjectiveDisplayed(5, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Harvester  Auto  

MiscObject Property Sphere  Auto  

MiscObject Property Lexicon  Auto  

ObjectReference Property HMEndMarker  Auto  

Quest Property MQ205  Auto  

Perk Property BloodHarvest  Auto  

ObjectReference Property AlftandMapMarker  Auto  

AchievementsScript Property AchievementsQuest  Auto  

ObjectReference Property MzarkMapMarker  Auto  
