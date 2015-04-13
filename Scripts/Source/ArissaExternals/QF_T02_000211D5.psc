;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname QF_T02_000211D5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TempleChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TempleChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IvarsteadMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IvarsteadMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY YngvarBound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_YngvarBound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jofthor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jofthor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calcelmo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calcelmo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FastredsBoy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FastredsBoy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fastred
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fastred Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boti
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boti Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MonumentAmuletQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MonumentAmuletQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FastredBound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FastredBound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FaleenBound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FaleenBound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MonumentAmulet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MonumentAmulet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Yngvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Yngvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JofthorBound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JofthorBound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faleen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faleen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Maramal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Maramal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dinya
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dinya Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fenrig
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fenrig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LovePoem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LovePoem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BotiBound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BotiBound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ruki
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ruki Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoveLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoveLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BassianusBound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BassianusBound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bassianus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bassianus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoveRepo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoveRepo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Klimmek
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Klimmek Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkarthMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CalcelmoBound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CalcelmoBound Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KlimmekBound
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KlimmekBound Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE T02QuestScript
Quest __temp = self as Quest
T02QuestScript kmyQuest = __temp as T02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(25, 1)
SetObjectiveDisplayed(30, 1)

Alias_Fastred.GetActorRef().ModFavorPointsWithGlobal(MajorFavor)
Alias_FastredsBoy.GetActorRef().ModFavorPointsWithGlobal(MajorFavor)
kmyQuest.CheckForFastredScene = False
UnregisterForUpdate()

Alias_FastredBound.Clear()
Alias_BassianusBound.Clear()
Alias_KlimmekBound.Clear()
Alias_JofthorBound.Clear()
Alias_BotiBound.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE T02QuestScript
Quest __temp = self as Quest
T02QuestScript kmyQuest = __temp as T02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(80, 1)
SetObjectiveDisplayed(90, 1)

; do this while we know the player is away from both Riften and Ivarstead
T02PostQuest.Start()
(T02PostQuest as T02PostQuestScript).FastredMoveToRiften = kmyQuest.FastredMoveToRiften
T02PostQuest.SetStage(10)

kmyQuest.SeekingRuki = false
kmyQuest.SeekingFenrig = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE T02QuestScript
Quest __temp = self as Quest
T02QuestScript kmyQuest = __temp as T02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(70, 1)
SetObjectiveDisplayed(75, 1)

Game.GetPlayer().AddItem(Alias_MonumentAmulet.GetReference())
kmyQuest.SeekingRuki = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE T02QuestScript
Quest __temp = self as Quest
T02QuestScript kmyQuest = __temp as T02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(95, 1)
SetObjectiveDisplayed(100, 1)

kmyQuest.SeekingRuki = false
kmyQuest.SeekingFenrig = false

kmyQuest.CheckForDeadLoversScene = False
UnregisterForUpdate()

Alias_MonumentAmuletQuestItem.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE T02QuestScript
Quest __temp = self as Quest
T02QuestScript kmyQuest = __temp as T02QuestScript
;END AUTOCAST
;BEGIN CODE
AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(100, 1)
pFFRiften05.SetStage(10)

Alias_Dinya.GetActorRef().ModFavorPointsWithGlobal(MajorFavor)
Game.GetPlayer().AddPerk(MaraPerk)
T02PerkMessage.Show()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

Alias_IvarsteadMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(25, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted(45, 1)
SetObjectiveDisplayed(50, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(55, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE T02QuestScript
Quest __temp = self as Quest
T02QuestScript kmyQuest = __temp as T02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(55, 1)
SetObjectiveDisplayed(70, 1)

Alias_Calcelmo.GetActorRef().ModFavorPointsWithGlobal(MajorFavor)
Alias_Faleen.GetActorRef().ModFavorPointsWithGlobal(MajorFavor)
kmyQuest.CheckForCalcelmoScene = False
UnregisterForUpdate()

Alias_CalcelmoBound.Clear()
Alias_CalcelmoBound.Clear()
Alias_YngvarBound.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE T02QuestScript
Quest __temp = self as Quest
T02QuestScript kmyQuest = __temp as T02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(90, 1)
SetObjectiveDisplayed(95, 1)

kmyQuest.SeekingRuki = true
kmyQuest.SeekingFenrig = false

Alias_Fenrig.GetReference().Disable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(45, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)

Alias_MarkarthMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MajorFavor  Auto  

Quest Property pFFRiften05  Auto  

Quest Property T02PostQuest  Auto  

Perk Property MaraPerk  Auto  

ObjectReference Property BunkhouseMarker  Auto  

Message Property T02PerkMessage  Auto  

AchievementsScript Property AchievementsQuest  Auto  
