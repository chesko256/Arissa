;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 32
Scriptname QF_dunHillgrundsTombQST_0003E897 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ValsVeran
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ValsVeran Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aunt
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Aunt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SecretPassageMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_SecretPassageMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_chest01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiddenDoorActivator
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_HiddenDoorActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY interiorMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_interiorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Golldir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Golldir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_chest03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest04
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_chest04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValsVeranStandinMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ValsVeranStandinMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest05
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_chest05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorDoor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExteriorDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EndFightController
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_EndFightController Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_chest02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Found Secret Door
FoundSecretDoorScene.start()
alias_ValsVeran.getReference().enable()
setObjectiveCompleted(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;unlock Door
alias_ExteriorDoor.getReference().lock(false)
(alias_Golldir.getReference() as actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
AchievementsQuest.IncSideQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Dead end, find secret Door
findHiddenPassageScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;fight is now active
; debug.Trace("hillgrunds tomb fight intro over, fight should now begin")
alias_EndFightController.getReference().activate(alias_EndFightController.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;player has entered tomb
alias_golldir.getactorReference().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;scene at pressure plate
dunHillgrundsTombPressurePlateScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Testing stage
game.getplayer().moveto(testMarker)
alias_golldir.getReference().moveto(testMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;safety trigger
if !alias_valsVeran.getReference().isenabled()
	alias_valsVeran.getReference().enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE QF_dunHillgrundsTombQST_0003E897
Quest __temp = self as Quest
QF_dunHillgrundsTombQST_0003E897 kmyQuest = __temp as QF_dunHillgrundsTombQST_0003E897
;END AUTOCAST
;BEGIN CODE
;Quest Accepted
DoorUnlockScene.start()
;pop quest name
utility.wait(2.0)
alias_Golldir.getActorRef().addToFaction(dunPlayerAllyFaction)
alias_Golldir.getActorRef().setNotShowOnStealthMeter(true)
alias_Golldir.getActorRef().setPlayerTeammate(True, False)
setObjectiveDisplayed(10)
setObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest complete
dunHillgrundsTombQSTFIN.start()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;A chest has been opened
if !lootSceneComplete
	lootSceneComplete = True
	dunHillgrundsTombChestOpenScene.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Start up stage
alias_Golldir.getReference().enable()
alias_aunt.getReference().enable()
;alias_ValsVeran.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;intro dialog done, accept now availible
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;player has been thanked

game.getplayer().additem(rewardList, 1)
game.getplayer().additem(HillgrundsChestKey, 1)
alias_Golldir.getActorRef().setNotShowOnStealthMeter(False)
alias_Golldir.getActorRef().setPlayerTeammate(False, False)
alias_Golldir.getActorRef().makePlayerFriend()
alias_Golldir.getReference().removeitem(HillgrundsChestKey, 1)
setObjectiveCompleted(90)
setObjectiveCompleted(5)
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Vals fight start
ValsFightStartScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Vals Veran killed
setObjectiveCompleted(10)
if !GolldirKilled
	setObjectiveDisplayed(90)
	dunHillgrundsTombEndForceGreetScene.start()
else
	setStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Scene at door to end
dunHillgrundsTombEndDoorScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Aunt Scene over pop secret passage objective
;setObjectiveDisplayed(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Golldir killed
GolldirKilled = True
setObjectiveFailed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;found Agna's corpse start scene
AgnaCorpseScene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property DoorUnlockScene  Auto  

scene Property AgnaCorpseScene  Auto  

scene Property findHiddenPassageScene  Auto  

scene Property FoundSecretDoorScene  Auto  

scene Property ValsFightStartScene  Auto  

faction Property WarlockFaction  Auto  

faction Property DraugrFaction  Auto  

objectReference Property testMarker  Auto  

leveledItem Property RewardList  Auto  

Bool Property GolldirKilled=False  Auto  

key Property HillgrundsChestKey  Auto  

scene Property dunHillgrundsTombEndForceGreetScene  Auto  

quest Property dunHillgrundsTombQSTFIN  Auto  

scene Property dunHillgrundsTombEndDoorScene  Auto  

scene Property dunHillgrundsTombPressurePlateScene  Auto  

scene Property dunHillgrundsTombChestOpenScene  Auto  

bool Property lootSceneComplete  Auto  

AchievementsScript Property AchievementsQuest Auto

Faction Property dunPlayerAllyFaction  Auto  
