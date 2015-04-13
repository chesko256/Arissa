;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF_dunMistwatchQST_00030B36 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GuardBandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GuardBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MistwatchKey01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MistwatchKey01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fjola
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Fjola Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardBandit02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GuardBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ring2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ring2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Christer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Christer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ring
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ring Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FjolaMoveToMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FjolaMoveToMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setObjectiveCompleted(11,1)
setObjectiveDisplayed(75,1)
Actor Fjola = alias_Fjola.GetReference() as Actor
Fjola.StartCombat(game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Actor Fjola = alias_Fjola.GetActorReference()
;Fjola.setav("Aggression",3)
Actor Christer = alias_Christer.GetActorReference()
Christer.StartCombat(game.GetPlayer())
setObjectiveCompleted(75,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
setObjectiveCompleted(85,1)
game.getPlayer().removeItem(alias_Ring.GetReference(),1,TRUE)
game.getPlayer().addItem(alias_Ring2.GetReference(),1,TRUE)
MistwatchLocation.SetCleared()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE dunMistwatchQSTScript
Quest __temp = self as Quest
dunMistwatchQSTScript kmyQuest = __temp as dunMistwatchQSTScript
;END AUTOCAST
;BEGIN CODE
Actor Fjola = alias_Fjola.getReference() as Actor
Fjola.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
game.getPlayer().addItem(alias_MistwatchKey01.GetReference())
setObjectiveDisplayed(11,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
setObjectiveCompleted(11,1)
setObjectiveDisplayed(75,1)
dunMistwatchFaction.setAlly(playerFaction)
game.getPlayer().addItem(alias_Ring.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE dunMistwatchQSTScript
Quest __temp = self as Quest
dunMistwatchQSTScript kmyQuest = __temp as dunMistwatchQSTScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ChristerIntro.stop()
kMyQuest.ChristerLeavesWorld.start()
Actor Christer = alias_Christer.getReference() as Actor
Christer.EvaluatePackage()
kmyQuest.setStage(90)
Actor Fjola = alias_Fjola.getReference() as Actor
Fjola.moveTo(alias_FjolaMoveToMarker.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;game.getPlayer().addItem(alias_MistwatchKey01.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE dunMistwatchQSTScript
Quest __temp = self as Quest
dunMistwatchQSTScript kmyQuest = __temp as dunMistwatchQSTScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ChristerIntro.stop()
kmyquest.ChristerForcegreet.start()
Actor Christer = alias_Christer.getReference() as Actor
Christer.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
setObjectiveCompleted(75,1)
setObjectiveDisplayed(85,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;MiscObject Property gold  Auto  

faction Property playerFaction  Auto  

faction Property dunMistwatchFaction  Auto  

Location Property MistwatchLocation  Auto  
