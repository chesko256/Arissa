;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 40
Scriptname QF_MQ305_00046EF2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hakon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hakon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Felldir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Felldir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sovngarde
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Sovngarde Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gormlaith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gormlaith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tsun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tsun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alduin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alduin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShoutTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShoutTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul6 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; player in place 
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
IntroScene.Start()
Alias_Alduin.TryToDisable()
; TEMP - fix Alduin's script property
defaultsetStageAliasScript AlduinScript = Alias_Alduin as defaultsetStageAliasScript
AlduinScript.stage = 190
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; second shout
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; all actors in place for shout battle
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Alduin is dead
CompleteAllObjectives()
; add achievement
Game.AddAchievement(8)
; play music cue
MUSAlduinDeath.Add()
MQ306.SetStage(5)  ; start Paarthurnax/Odahviing scene
; objective to Tsun
MQ306.SetObjectiveDisplayed(10)
MQ306.SetActive(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
; Tsun teaches you Call of Valor
Game.TeachWord(WordHun)
Game.TeachWord(WordKaal)
Game.TeachWord(WordZoor)
Game.UnlockWord(WordHun)
Game.UnlockWord(WordKaal)
Game.UnlockWord(WordZoor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE MQ305Script
Quest __temp = self as Quest
MQ305Script kmyQuest = __temp as MQ305Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
; clear fog completely
kmyQuest.ClearShoutCount()
; lock all doors to Hall of Heroes
HallofHeroesDoor1.SetLockLevel(255)
HallofHeroesDoor1.Lock(true)
HallofHeroesDoor2.SetLockLevel(255)
HallofHeroesDoor2.Lock(true)
HallofHeroesDoor3.SetLockLevel(255)
HallofHeroesDoor3.Lock(true)
HallofHeroesDoor4.SetLockLevel(255)
HallofHeroesDoor4.Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; player has asked to be sent back - trigger sequence
Game.DisablePlayerControls()
; just to make sure
OutroScene.Start()
MQ306.SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; quick start heroes at player's position
Alias_Gormlaith.TryToMoveTo(game.getplayer())
Alias_Felldir.TryToMoveTo(game.getplayer())
Alias_Hakon.TryToMoveTo(game.getplayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; debug.trace(self + " stage 120 start")
; Alduin is enabled - fight!
actor alduin = Alias_Alduin.GetActorRef()

; move him to a start marker the player can't see
if !(Game.GetPlayer().HasLOS(AlduinStartBattleMarker))
	alduin.MoveTo(AlduinStartBattleMarker)
else
	alduin.MoveTo(AlduinStartBattleMarker2)
endif
alduin.Enable()
alduin.SetForcedLandingMarker(AlduinLandingMarker)
; Dragonrend effective again
MQAlduinIgnoreDragonrend.SetValue(0)
; Alduin can now actually be killed
alduin.RestoreActorValue("health", 10000)
alduin.GetActorBase().SetEssential(false)
alduin.GetActorBase().SetProtected(true)
alduin.SetNoBleedoutRecovery(true)
; make Alduin aggressive
alduin.SetActorValue("aggression", 1)
; make lost souls enemies of Alduin
LostSoulFaction.SetEnemy(AlduinFaction)
; debug.trace(self + " stage 120 end")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
; send player back to Tamriel
ReturnFromSovengardeImod.Apply()
utility.wait(2.5)
Game.GetPlayer().MoveTo(TamrielMarker)
Weather.ReleaseOverride()
DragonSceneWeather.ForceActive()
Game.EnablePlayerControls()
; hide MQPaarthurnax objective if still uncompleted
if MQPaarthurnax.IsObjectiveDisplayed(10) && !MQPaarthurnax.IsObjectiveCompleted(10)
	MQPaarthurnax.SetObjectiveDisplayed(10, false) 
endif
; stat for questline completion
Game.IncrementStat( "Questlines Completed" )
; turn off Sovngarde quests
MQ304.Setstage(300)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE MQ305Script
Quest __temp = self as Quest
MQ305Script kmyQuest = __temp as MQ305Script
;END AUTOCAST
;BEGIN CODE
; clear all the fog
kmyquest.FogActivateParent3.Activate(kmyquest.ShoutBattleMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; quickstart
Game.TeachWord(WordLok)
Game.UnlockWord(WordLok)
SetStage(10)
MQ304.SetStage(1)
MQ304.SetStage(5)
MQ304.SetStage(10)
MQ304.SetStage(30)
MQ304.SetStage(90)
MQ304.SetStage(150)
MQ304.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
; Alduin dying
; debug.trace(self + " starting outro scene=" + outroscene)
OutroScene.Start()
IntroScene.Stop() ; make sure
; no rollover on Alduin
Alias_Alduin.GetRef().SetDestroyed(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; first shout
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
; player approaches the Sovngarde exit - heroes exit the hall
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
; player passes by Tsun
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
; spoken to Tsun
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property IntroScene  Auto  

Quest Property MQ304  Auto  

Quest Property MQ303  Auto  

WordofPower Property WordLok  Auto  

Quest Property MQ306  Auto  

ObjectReference Property TamrielMarker  Auto  
{where to move player at end of quest}

WordofPower Property WordHun  Auto  

WordofPower Property WordKaal  Auto  

WordofPower Property WordZoor  Auto  

Scene Property OutroScene  Auto  

LocationAlias Property SkuldafnReserved  Auto  

ObjectReference Property AlduinStartBattleMarker  Auto  
{where Alduin gets moved and enabled when 
the fog is cleared}


ObjectReference Property AlduinStartBattleMarker2  Auto  

Faction Property LostSoulFaction  Auto  

Faction Property AlduinFaction  Auto  

Faction Property MQKillDragonFaction  Auto  

GlobalVariable Property MQAlduinIgnoreDragonrend  Auto  

ObjectReference Property AlduinLandingMarker  Auto  

Weather Property DragonSceneWeather  Auto  

ImageSpaceModifier Property ReturnFromSovengardeImod  Auto  

Quest Property MQPaarthurnax  Auto  

ObjectReference Property HallofHeroesDoor1  Auto  
ObjectReference Property HallofHeroesDoor2  Auto  
ObjectReference Property HallofHeroesDoor3  Auto  
ObjectReference Property HallofHeroesDoor4  Auto  

MusicType Property MUSAlduinDeath  Auto  
