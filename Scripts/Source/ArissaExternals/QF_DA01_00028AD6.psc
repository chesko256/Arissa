;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 59
Scriptname QF_DA01_00028AD6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WinterholdMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WinterholdMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MalynVaren
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MalynVaren Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NelacarStar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NelacarStar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AzurasStarInterior
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AzurasStarInterior Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MalynVarensCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MalynVarensCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aranea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aranea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MalynsJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MalynsJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShrineofAzura
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShrineofAzura Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VoiceofAzura
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VoiceofAzura Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IlinaltasDeepLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_IlinaltasDeepLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nelacar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nelacar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AzurasStarBroken
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AzurasStarBroken Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AzuraSpeaksTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AzuraSpeaksTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IlinaltasDeepDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IlinaltasDeepDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nirya
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nirya Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NelacarVoiceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NelacarVoiceMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20)

;Player knows Nelacar's whereabouts
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
;Malyn turns hostile
Actor myMalynRef = Alias_MalynVaren.GetActorRef()
myMalynRef.SetAv("Aggression", 2)
myMalynRef.AddtoFaction(DA01PlayerEnemyFaction)
myMalynRef.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DA01Intro.SetStage(100)
SetObjectiveDisplayed(10)
DA01EnableMarker.Enable()
Alias_AzurasStarBroken.GetRef().SetNoFavorAllowed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
;Player can speak to Azura
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(60, 1)
Alias_AzuraSpeaksTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
SetObjectiveCompleted(45, 1)
SetObjectiveFailed(40, 1)
SetObjectiveDisplayed(65, 1)

;Nelacar is ready to send the player into the Star
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Azura sends the player into the Star
Game.GetPlayer().MoveTo(StarPlayerMarker)

AzuraShrineBrokenStarRef.Disable()

SetObjectiveCompleted(60, 1)
SetObjectiveCompleted(62, 1)
SetObjectiveFailed(65, 1)
SetObjectiveDisplayed(80, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30)

pIlinaltasDeepMarker.AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
;Valas is dead, the player is sent back to the Shrine of Azura
SetObjectiveCompleted(80, 1)

Game.GetPlayer().MoveTo(pShrineReturnMarker)

;Activate Azura when the player loads back in the shrine
pAzuraFinalScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;Nelacar sends the player into the Star
Game.GetPlayer().MoveTo(StarPlayerMarker)
Game.EnablePlayerControls()

SetObjectiveCompleted(65, 1)
SetObjectiveDisplayed(80, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Aranea takes the Star to the Altar
DA01AraneaGiveStarScene.Start()
Game.GetPlayer().RemoveItem(Alias_AzurasStarBroken.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player has the Star

SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)
SetObjectiveDisplayed(45, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;TESTING ONLY
;Give player the rumor
DA01Intro.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Black Star Ending
AchievementsQuest.IncDaedricQuests()
Game.GetPlayer().AddItem(DA01SoulGemBlackStar, 1)
AchievementsQuest.IncDaedricArtifacts()

;disable Azura speaks
Alias_AzuraSpeaksTrigger.GetRef().Disable()

;Nelacar becomes your friend
Alias_Nelacar.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 3)

;Aranea becomes your enemy
Alias_Aranea.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)

DA01FIN.Start()

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;Nelacar forcegreets the player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN CODE
;expand Nelacar's topic list
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(62, 1)

;Player can tell Azura he is ready to enter the Star
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Nelacar sends the player into the Star
Game.DisablePlayerControls()
Utility.Wait(2)

pNelacarSoulTrapScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
;Valas is dead, the player is sent back to Nelacar's lab
SetObjectiveCompleted(80, 1)

Game.GetPlayer().MoveTo(pNelacarReturnMarker)

;Nelacar forcegreets
pNelacarFinalScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Azura's Star Ending
AchievementsQuest.IncDaedricQuests()
Game.GetPlayer().AddItem(DA01SoulGemAzurasStar, 1)
AchievementsQuest.IncDaedricArtifacts()

;disable Azura speaks
Alias_AzuraSpeaksTrigger.GetRef().Disable()

;Aranea becomes your friend
Alias_Aranea.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 3)

;Nelacar becomes your enemy
Alias_Nelacar.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)

DA01FIN.Start()

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Nelacar takes the Star to his lab
SetObjectiveFailed(60, 1)

Game.GetPlayer().RemoveItem(Alias_AzurasStarBroken.GetRef())

pNelacarExamineStarScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
;Fail quest

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest property DA01 auto

MiscObject Property DA01LightofAzura  Auto  

MiscObject Property DA01AzurasStar  Auto  

Scene Property BavynaArguesScene  Auto  

Scene Property BavynaExaminesStar  Auto  

Scene Property MalynVarenScene  Auto  

Scene Property BavynaSoulTrapScene  Auto  

ObjectReference Property ReturnMarker  Auto  

Scene Property CleansedStarScene  Auto  

Scene Property CorruptedStarScene  Auto  

MiscObject Property BlackStar  Auto  

ObjectReference Property WinterholdCenter  Auto  

Faction Property MagesGuild  Auto  

Scene Property pAraneaForcegreetFrozenHearthScene  Auto  

Scene Property pNelacarForcegreetScene  Auto  

Potion Property pWaterBreathingPotion  Auto  

Scene Property pAraneaFollowScene  Auto  

ObjectReference Property pIlinaltasDeepMarker  Auto  

Scene Property pAraneaForcegreetIlinaltaScene  Auto  

Scene Property pNelacarExamineStarScene  Auto  

ObjectReference Property pShrineofAzuraMarker  Auto  

Scene Property pAraneaEscortScene  Auto  

ObjectReference Property pAzuraStarMarker  Auto  

Scene Property pValasVarenScene  Auto  

Scene Property pNelacarSoulTrapScene  Auto  

ObjectReference Property pShrineReturnMarker  Auto  

ObjectReference Property pNelacarReturnMarker  Auto  

Faction Property pAraneaAllyFaction  Auto  

ObjectReference Property pAraneaStarMarker  Auto  

Scene Property AraneaFollowerPlayerStarScene  Auto  

ObjectReference Property pAraneaReturnMarker  Auto  

Faction Property pNelacarEnemyFaction  Auto  
Quest Property MG01  Auto  

Scene Property pNelacarFinalScene  Auto  

Scene Property pAzuraFinalScene  Auto  

ActorBase Property pNelacarActorBase  Auto  

ObjectReference Property AzuraShrineBrokenStarRef  Auto  

ObjectReference Property DA01EnableMarker  Auto  

Faction Property CollegeofWinterholdFaction  Auto  

SoulGem Property DA01SoulGemAzurasStar  Auto  

SoulGem Property DA01SoulGemBlackStar  Auto  

Quest Property DA01Intro  Auto  

Faction Property DA01PlayerEnemyFaction  Auto  

Scene Property DA01AraneaGiveStarScene  Auto  

Quest Property DA01FIN  Auto  

ObjectReference Property AzuraPlayerMoveMarkerREF  Auto  

ObjectReference Property StarPlayerMarker  Auto  

AchievementsScript Property AchievementsQuest  Auto  
