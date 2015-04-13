;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 64
Scriptname QF_MS14_00025F3E Extends Quest Hidden

;BEGIN ALIAS PROPERTY HelgiCoffin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HelgiCoffin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Benor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Benor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helgi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helgi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GhorunnHall
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GhorunnHall Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alva
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alva Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hroggar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hroggar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurnedHouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurnedHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlRebel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlRebel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CoffinDirt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CoffinDirt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lami
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lami Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvasJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlvasJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jorgen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jorgen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlImperial
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thonnir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thonnir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvasCoffin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlvasCoffin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossVampireMorvath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossVampireMorvath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gravedigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gravedigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Laelette
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Laelette Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lurbuk
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lurbuk Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; Player has caught Alva in her coffin
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
MobScared.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; Alva is dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
; Player has heard rumors about Bern, and been told to see the steward

If GetStage() <= 20
    SetObjectiveDisplayed(20, 1)
EndIf

kmyQuest.StopHouseRumor = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; Player learns Laelette was with Alva.

SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(70, 1)
Alias_AlvasJournal.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
; Player has gotten close to the burned house

Alias_BurnedHouse.GetRef().UnregisterForUpdate()
GhoruunCell.Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
;Init quest

RegisterForUpdate(5)
Alias_Alva.GetRef().RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Player has recieved the quest from the jarl.

Alias_Helgi.GetReference().Enable()

SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; The player is sent to Movarth's Lair
Alias_Alva.GetRef().UnregisterForUpdate()
Alias_Alva.GetActorRef().SetFactionRank(CrimeFaction, -1)

SetObjectiveCompleted(95, 1)
SetObjectiveDisplayed(100, 1)

If Alias_JarlImperial.GetActorRef().IsInFaction(JobJarlFaction) == True
     Alias_JarlImperial.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
ElseIf  Alias_JarlRebel.GetActorRef().IsInFaction(JobJarlFaction) == True
     Alias_JarlRebel.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
EndIf

; Alias_Thonnir.GetRef().RegisterForUpdate(1)
Game.GetPlayer().AddItem(FirstReward, 1)

If Alias_Lurbuk.GetActorReference().IsDead() == 0 && Alias_Lurbuk.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Lurbuk.GetReference().MoveTo(LurbukWaitMarker)
    Alias_Lurbuk.GetActorRef().EvaluatePackage()
EndIf
If Alias_Benor.GetActorReference().IsDead() == 0 && Alias_Benor.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Benor.GetReference().MoveTo(BenorWaitMarker)
    Alias_Benor.GetActorRef().EvaluatePackage()
EndIf
If Alias_Jorgen.GetActorReference().IsDead() == 0 && Alias_Jorgen.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Jorgen.GetReference().MoveTo(JorgenWaitMarker)
    Alias_Jorgen.GetActorRef().EvaluatePackage()
EndIf
If Alias_Lami.GetActorReference().IsDead() == 0 && Alias_Lami.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Lami.GetReference().MoveTo(LamiWaitMarker)
    Alias_Lami.GetActorRef().EvaluatePackage()
EndIf
If Alias_Thonnir.GetActorReference().IsDead() == 0
    Alias_Thonnir.GetReference().MoveTo(ThonnirWaitMarker)
    Alias_Thonnir.GetActorRef().EvaluatePackage()
EndIf

Alias_BossVampireMorvath.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
If Alias_Lurbuk.GetActorReference().IsDead() == 0
    Alias_Lurbuk.GetReference().MoveTo(LurbukGhoruunWait)
    Alias_Lurbuk.GetActorRef().EvaluatePackage()
EndIf
If Alias_Benor.GetActorReference().IsDead() == 0
    Alias_Benor.GetReference().MoveTo(BenorGhoruunWait)
    Alias_Benor.GetActorRef().EvaluatePackage()
EndIf
If Alias_Jorgen.GetActorReference().IsDead() == 0
    Alias_Jorgen.GetReference().MoveTo(JorgenGhoruunWait)
    Alias_Jorgen.GetActorRef().EvaluatePackage()
EndIf
If Alias_Lami.GetActorReference().IsDead() == 0
    Alias_Lami.GetReference().MoveTo(LamiGhoruunWait)
    Alias_Lami.GetActorRef().EvaluatePackage()
EndIf
If Alias_Thonnir.GetActorReference().IsDead() == 0
    Alias_Thonnir.GetReference().MoveTo(ThonnirGhoruunWait)
    Alias_Thonnir.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
; Quest is over, player has collected his reward

SetObjectiveCompleted(120, 1)
Game.GetPlayer().AddItem(Reward, 1)
AchievementsQuest.IncSideQuests()

UnregisterForUpdate()

If Alias_JarlImperial.GetActorRef().IsInFaction(JobJarlFaction) == True
     Alias_JarlImperial.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 2)
ElseIf  Alias_JarlRebel.GetActorRef().IsInFaction(JobJarlFaction) == True
     Alias_JarlRebel.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 2)
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
SetObjectiveDisplayed(35, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
Alias_Helgi.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; Player has activated Alva's Journal
SetObjectiveCompleted(70, 1)
SetObjectiveDisplayed(95, 1)

Alias_Alva.GetActorRef().SetFactionRank(CrimeFaction, -1)
Alias_Hroggar.GetActorRef().SetFactionRank(CrimeFaction, -1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; Player has arrived at Movarth's Lairl, move NPCs
; This stage is mostly to track the event. It doesn't set new objectives
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
; player leaves mob outside Highmoon Hall

kmyQuest.MobMarch = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Player has spoken to Helgi's coffin

SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(60, 1)
SetObjectiveDisplayed(35, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Player knows Thonnir is Laelette's husband.

Alias_Helgi.GetReference().Disable()

;SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
;Player has killed Laelette

ThonnirFindLaelette.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Player has met Helgi and is playing hide and seek.

Alias_Helgi.GetReference().Disable()
Alias_CoffinDirt.GetRef().Disable()

Alias_Laelette.GetRef().Enable()
Alias_Laelette.GetActorRef().setGhost(true)
Alias_Laelette.GetActorRef().SetAlpha(0)

SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
; Movarth is dead

SetObjectiveCompleted(100, 1)
SetObjectiveDisplayed(120, 1)

Alias_Helgi.GetReference().Enable()
Alias_Helgi.GetReference().MoveTo(MS14HelgiThankYouMarker)
Alias_Thonnir.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
; Tried to prove Alva was a vampire without the journal.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property JorgenWaitMarker auto
ObjectReference Property BenorWaitMarker auto
ObjectReference Property LamiWaitMarker auto
ObjectReference Property LurbukWaitMarker auto
ObjectReference Property ThonnirWaitMarker auto

ObjectReference Property JorgenGhoruunWait auto
ObjectReference Property BenorGhoruunWait auto
ObjectReference Property LamiGhoruunWait auto
ObjectReference Property LurbukGhoruunWait auto
ObjectReference Property ThonnirGhoruunWait auto

Scene Property MobScared  Auto  


Scene Property ThonnirFindLaelette  Auto  

ObjectReference Property MS14HelgiThankYouMarker  Auto  

Cell Property GhoruunCell  Auto  

Faction Property JobJarlFaction  Auto  

LeveledItem Property Reward  Auto  

LeveledItem Property FirstReward  Auto  

Faction Property CrimeFaction  Auto  

AchievementsScript Property AchievementsQuest Auto

Faction Property CurrentFollowerFaction  Auto  
