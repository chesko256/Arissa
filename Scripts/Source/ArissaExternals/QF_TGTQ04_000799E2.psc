;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_TGTQ04_000799E2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGTQ04Holding
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04Holding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ04LocketAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04LocketAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ04NoteAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04NoteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ04LinweAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04LinweAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ04TorstenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04TorstenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ04NiranyeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04NiranyeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ04BannerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04BannerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ04Note01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04Note01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ04UtteringHillsCampMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04UtteringHillsCampMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGTQ04NiranyesSafe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGTQ04NiranyesSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dunUtteringHillsEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dunUtteringHillsEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Player destroyed the banner
SetObjectiveCompleted(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player arrives at Uttering Hills Cave
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player sent to speak to Niranye
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
pNiranye.SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player Got the Truth from Niranye or Note off his Body
pUtteringHillsCaveMapMarker.AddToMap()
if pTGTQ04Quest.IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
SetObjectiveDisplayed(40,1)
Alias_dunUtteringHillsEnableMarker.GetReference().Enable()
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Niranye Attacks!
if pTGTQ04Quest.IsObjectiveDisplayed(20) == 1
SetObjectiveDisplayed(20,0)
endif
if pTGTQ04Quest.IsObjectiveDisplayed(30) == 1
SetObjectiveDisplayed(30,0)
endif
Alias_TGTQ04NiranyeAlias.GetActorRef().RemoveFromFaction(pCrimeFactionWindhelm)
Alias_TGTQ04NiranyeAlias.GetActorRef().AddToFaction(pTGTQ04EnemyFaction)
Alias_TGTQ04NiranyeAlias.GetActorRef().SetAv("Aggression",2)
Alias_TGTQ04NiranyeAlias.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Player is in view of Banner
SetObjectiveDisplayed(60,1)
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Player obtained Locket
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Debug Quest Start
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Niranye Not Yet Solved, Not Hostile
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TGTQ04QuestScript
Quest __temp = self as Quest
TGTQ04QuestScript kmyQuest = __temp as TGTQ04QuestScript
;END AUTOCAST
;BEGIN CODE
;Player is sent to speak with Tolbjorn
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TGTQ04QuestScript
Quest __temp = self as Quest
TGTQ04QuestScript kmyQuest = __temp as TGTQ04QuestScript
;END AUTOCAST
;BEGIN CODE
;Quest Completed
pTorsten.SetEssential(false)
Game.GetPlayer().RemoveItem(kmyQuest.pTGTQ04Locket,1)
Game.GetPlayer().AddItem(pReward)
kmyQuest.pTGRShellQuest.SetStage(185)
pTGFences.SetStage(40)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player Finds Note in House's Safe
SetObjectiveCompleted(30,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTGTQ04Quest  Auto  

ActorBase Property pNiranye  Auto  

ActorBase Property pTorsten  Auto  

Quest Property pTGFences  Auto  

Faction Property pCrimeFactionWindhelm  Auto  

Faction Property pTGTQ04EnemyFaction  Auto  

ObjectReference Property pUtteringHillsCaveMapMarker  Auto  

LeveledItem Property pReward  Auto  
