;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_DA09_0004E4E1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestTargetHelperTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestTargetHelperTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FalkreathMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FalkreathMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Meridia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Meridia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GemStatic
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GemStatic Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragonPriest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragonPriest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GemContainerLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GemContainerLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkySceneStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkySceneStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TempleExteriorTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TempleExteriorTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cell1Exit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cell1Exit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrontDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FrontDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xMarkerVoice
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xMarkerVoice Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GemMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GemMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dawnsbreaker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dawnsbreaker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pedestal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pedestal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Statue
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Statue Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StatueTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StatueTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeamSky
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BeamSky Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GemContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GemContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossTrigger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
;DEBUG test stage
Game.GetPlayer().moveto(Alias_Gem.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
;Player brought Gem to statue and has been told to place it in the statue's hands
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
;DragonPriest dies

kmyquest.FXNecroTendrilRingRef.disable(abFadeOut = true)

setObjectiveCompleted(20)
setObjectiveCompleted(30)

;Cave in aspect doesn't happen anymore
kmyquest.startCaveIn()   ;this also starts the DA09CaveInScene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
;player picks up gem
;Meridia talks to player in his head, see DA09GemScript attached to Gem alias
;SetObjectiveDisplayed(10) -- THIS HAPPENS IN THE DA09GemScript so that it repops whenever the player hears Meridia in his head
;We also add the map marker in DA09GemScript

setObjectiveCompleted(5)
Alias_BeamSky.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
Alias_Meridia.GetReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
kmyquest.DA09PedestalEmptyRef.enable()
kmyquest.DA09PedestalRef.disable()


Game.GetPlayer().AddItem(kmyquest.DA09DawnbreakerList)
setobjectiveCompleted(40)
AchievementsQuest.IncDaedricArtifacts()
kmyquest.TeleportPlayerToSky()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
;player placed gem in statue's hand, teleports to sky

; Debug.Trace("DA09 stage 200, removing gem, and moving player to sky)")
Alias_Gem.UnregisterForUpdateGameTime()
Game.GetPlayer().RemoveItem(Alias_Gem.GetReference())

kmyquest.movePlayerToSky()

kmyquest.DungeonBlockerToggle.Disable()
kmyquest.DA09SkyScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;player has walked into the boss section of the dungeon (see DA09BossTriggerScript)
setObjectiveCompleted(20)
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
;player should get Dawnstar
setobjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
AchievementsQuest.IncDaedricQuests()
Alias_BeamSky.GetReference().Disable()
Alias_Meridia.GetReference().disable()
kmyquest.DA09SkyPlaneCollision.disable()

kmyquest.movePlayerToEarth()   ;enables player controls and fast travel

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
kmyquest.movePlayerToEarth()   ;enables player controls and fast travel

setObjectiveCompleted(15)
setObjectiveDisplayed(20)

kmyquest.DA09SkyPlaneCollision.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE DA09Script
Quest __temp = self as Quest
DA09Script kmyQuest = __temp as DA09Script
;END AUTOCAST
;BEGIN CODE
;player talked to the statue before finding the gem
setobjectiveDisplayed(5)
kmyquest.DA09ChangeLocChance.setValue(0)    ;prevent the DA09ChangeLocation quest from starting
Alias_GemMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

AchievementsScript Property AchievementsQuest  Auto  
