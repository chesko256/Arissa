;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 38
Scriptname QF_E3demo_00093637 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY giant01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_giant01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragonStone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragonStone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY wolfAlpha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_wolfAlpha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ104marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ104marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arvel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arvel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BFBDragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BFBDragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragon02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragon02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hare
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hare Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY wolf02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_wolf02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mammoth02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_mammoth02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TowerBandit01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TowerBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CWSoldiersMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CWSoldiersMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY enableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_enableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CWSoldiersMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CWSoldiersMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mammoth01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_mammoth01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BleakFallsStartMoveTo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BleakFallsStartMoveTo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY e3DemoBleakFallsBarrow
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_e3DemoBleakFallsBarrow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CampfireBandit01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CampfireBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CampfireBandit02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CampfireBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY giant02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_giant02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spider
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spider Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BFB_Boss_Chest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BFB_Boss_Chest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragon01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragon01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY wolf01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_wolf01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY finaleMoveTo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_finaleMoveTo Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Arvel Shout 2
ArvelShouts2Scene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Spider is dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE QF_E3demo_00093637
Quest __temp = self as Quest
QF_E3demo_00093637 kmyQuest = __temp as QF_E3demo_00093637
;END AUTOCAST
;BEGIN CODE
; set when player leaves bandit tower, enable BFB dragon
Alias_BFBDragon.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE QF_E3demo_00093637
Quest __temp = self as Quest
QF_E3demo_00093637 kmyQuest = __temp as QF_E3demo_00093637
;END AUTOCAST
;BEGIN CODE
; Dragon #2 smashes through tower! (package driven)

; murder all the soldiers.
int i = 0
int t = E3demoSoldiersList.getSize()
while i < t
    form temp = E3demoSoldiersList.getAt(i)
    (temp as actor).moveto(Alias_BFBDragon.getReference())
    i += 1
endWhile

; TEMP SECTION?
; Try enabling Dragon #2 and force right into the smashy package.

;Alias_Dragon02.getReference().moveTo(TowerSmashPopToMarker)
;utility.wait(1.0)
;setStage(361)

;Alias_Dragon02.getActorReference().stopCombat()
;Alias_Dragon02.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Arvel Shout 1
ArvelShouts1Scene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
; player has taken dragonstone.  pop objective in MQ103
MQ103.setStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE QF_E3demo_00093637
Quest __temp = self as Quest
QF_E3demo_00093637 kmyQuest = __temp as QF_E3demo_00093637
;END AUTOCAST
;BEGIN CODE
;debug.messageBox("E3 demo stage 0 set")
Alias_enableMarker.getReference().enable()
Alias_CWSoldiersMarker01.getReference().disable()
Alias_CWSoldiersMarker02.getReference().disable()
Alias_BFBDragon.getReference().enable()
; turn off random world encounters
WEEnabled.setValue(0)
WIComplexEventsEnabled.setValue(0)
WIEventsEnabled .setValue(0)
GameHour.Value = 11.0
;;;;;;;;;;;;;;;;;;;;;;;
dunHunterQST.setStage(51)
MS03.setStage(5)
T01.setStage(60)
dunValthumeQST.setStage(3)
MQ103.setStage(50)
finaleWeather.forceActive(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;campfire scene
CampfireScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Arvel is free
Alias_Arvel.GetActorReference().setav("Variable01",1)
Alias_Arvel.GetActorReference().evaluatePackage()
;kmyquest.UnRegisterForUpdate()
ArvelRunsScene.Start()
;Alias_Arvel.GetActorRef().SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;testing purposes
Alias_Player.getReference().moveto(Alias_BleakFallsStartMoveTo.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; dragon 2 spawns in!
; NOTE - currently triggered when Dragon 01 hits 50% HP

alias_dragon02.getActorReference().enable()
E3demoDragon02AttackScene.start()

MUSCombatBoss.add()

; ground Dragon #1
alias_Dragon01.getActorReference().setAllowFlying(false)
alias_Dragon01.getActorReference().evaluatePackage()

alias_mammoth01.getRef().disable()
alias_mammoth02.getRef().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Cue spider
ArvelStuckScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;cue Cut Arvel Down Objective...if needed
ArvelStuckScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE QF_E3demo_00093637
Quest __temp = self as Quest
QF_E3demo_00093637 kmyQuest = __temp as QF_E3demo_00093637
;END AUTOCAST
;BEGIN CODE
; SURPRISE it's a dragon.
Alias_BFBDragon.getActorReference().startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
Alias_Arvel.GetActorRef().SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE QF_E3demo_00093637
Quest __temp = self as Quest
QF_E3demo_00093637 kmyQuest = __temp as QF_E3demo_00093637
;END AUTOCAST
;BEGIN CODE
; stage to set when the giant has been taken away by dragon 01
; debug.trace("[E3 Demo] Stage 321: Big Fragment Script")

Actor Dragon01 = Alias_Dragon01.getActorReference()

Actor Giant01 = Alias_Giant01.getActorReference()
Giant01.setAV("Confidence", 0)
Actor Mammoth01 = Alias_Mammoth01.getActorReference()
Mammoth01.setAV("Confidence", 0)
Actor Mammoth02 = Alias_Mammoth02.getActorReference()
Mammoth02.setAV("Confidence", 0)

; wait a moment before sending EVPs
utility.wait(0.10)

int i = 0
int t = E3demoSoldiersList.getSize()
while i < t
    form temp = E3demoSoldiersList.getAt(i)
    (temp as actor).startCombat(Dragon01)
    (temp as actor).evaluatePackage()
    i += 1
endWhile

i = 0
t = E3demoHerdList.getSize()
while i < t
    form temp = E3demoHerdList.getAt(i)
    (temp as actor).evaluatePackage()
    i += 1
endWhile

; further safety net - register the herd survivors for LoS sight to disable when off-camera
actor PlayerActor = game.getPlayer()
Giant01.RegisterForLOS(PlayerActor ,Giant01)
Mammoth01.RegisterForLOS(PlayerActor ,Mammoth01)
Mammoth02.RegisterForLOS(PlayerActor ,Mammoth02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;player has talked to Arvel
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE QF_E3demo_00093637
Quest __temp = self as Quest
QF_E3demo_00093637 kmyQuest = __temp as QF_E3demo_00093637
;END AUTOCAST
;BEGIN CODE
; stage to set when first giant is attacked.
; re-disabled BFB dragon just in case
Alias_BFBDragon.getReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
; TEMP? trying to force the tower smashy.
;Alias_Dragon02.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; fire off the fox/hare mini-scene.
E3demoFoxAndTheHare.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE QF_E3demo_00093637
Quest __temp = self as Quest
QF_E3demo_00093637 kmyQuest = __temp as QF_E3demo_00093637
;END AUTOCAST
;BEGIN CODE
; debug.trace("[E3demo] start stage 300 fragment")
ALIAS_MQ104marker.getRef().disable()
;game.getPlayer().moveTo(Alias_finaleMoveTo.getReference())

Alias_BFBDragon.getReference().disable()

; make sure the scene 3D is loaded before running stuff
; debug.trace("[E3demo] s300: pre while loop")
int i = 0
while !(Alias_Giant01.getRef().is3Dloaded())
    utility.wait(1.0)
    i += 1
;     debug.trace("[E3demo] s300: recursion #"+i)
endWhile
; debug.trace("[E3demo] s300: after while loop")
(Alias_MQ104Marker.getReference()).disable()

finaleWeather.forceActive(true)
;GameHour.Value = 18.0
; debug.trace("[E3demo] s300 fragment over")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; wolf scene outlying Riverwood
E3demoWolfPackScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE QF_E3demo_00093637
Quest __temp = self as Quest
QF_E3demo_00093637 kmyQuest = __temp as QF_E3demo_00093637
;END AUTOCAST
;BEGIN CODE
; debug.trace("[E3demo] stage 320")

; Dragon 01 spawns and goes after a giant.
actor Dragon01 = alias_Dragon01.getActorReference()
Dragon01.enable()
E3demoDragon01AttackScene.start()
;Dragon01.startCombat(alias_giant01.getActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Arvel Shout 3
ArvelShouts3Scene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weather Property finaleWeather  Auto  

GlobalVariable Property gameHour  Auto  

Scene Property CampfireScene  Auto  

Scene Property ArvelCutStage1  Auto  

Scene Property ArvelCutStage2  Auto  

Scene Property ArvelRunsScene  Auto  

Scene Property ArvelShouts1Scene  Auto  

Scene Property ArvelShouts2Scene  Auto  

Scene Property ArvelShouts3Scene  Auto  

Scene Property ArvelStuckScene  Auto  

Scene Property SpiderScene  Auto  

scene Property E3demoFoxAndTheHare  Auto  

scene Property E3DemoWolfPackScene  Auto  

scene Property E3demodragon01attackscene  Auto  

scene Property E3demoDragon02AttackScene  Auto  

formlist Property E3demoSoldiersList  Auto  

GlobalVariable Property WEEnabled  Auto  

MusicType Property MUSCombatBoss  Auto  

FormList Property E3DemoHerdList  Auto  

ObjectReference Property TowerSmashPopToMarker  Auto  

Quest Property dunHunterQST  Auto  

Quest Property dunValthumeQST  Auto  

Quest Property MQ103  Auto  

Quest Property T01  Auto  

Quest Property MS03  Auto  

GlobalVariable Property WIEventsEnabled  Auto  

GlobalVariable Property WIComplexEventsEnabled  Auto  
