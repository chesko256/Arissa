;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 56
Scriptname QF_MQ102_0002BF9C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alvor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Alvor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianStoneTarget
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GuardianStoneTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alduin
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Alduin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hadvar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hadvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dorthe
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Dorthe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DummyTimer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DummyTimer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sigrid
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Sigrid Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
; start up quest
; MQ102 also
MQ102.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE MQ102QuestScript
Quest __temp = self as Quest
MQ102QuestScript kmyQuest = __temp as MQ102QuestScript
;END AUTOCAST
;BEGIN CODE
; stop this quest
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
; player has asked Alvor for help
; make Alvor your friend (only if he doesn't hate you already)
if Alias_Alvor.GetActorReference().GetRelationshipRank(Game.GetPlayer()) >= 0
	Alias_Alvor.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
;	FriendTutorial.Show()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
; debug.trace(self + " stage 30")
; player exits Helgen location
; failsafe - make sure has objective
setstage(10)
setstage(20)
; clean up MQ101
if MQ101.IsRunning()
	MQ101.SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
; debug.trace(self + " stage 22")
; Hadvar tells player to join civil war
; give Imperial objective
CW00A.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
; Riverwood scene finished
HadvarAlvorScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; player isn't in Riverwood when Hadvar greets Alvor
MQ102.SetStage(23)
if Alias_Hadvar.GetRef().GetItemCount(AlvorsHouseKey) == 0
	Alias_Hadvar.GetRef().AddItem(AlvorsHouseKey)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
; debug.trace("MQ102A - stage 0")
SetStage(1)
Alias_Hadvar.GetActorRef().moveto(HadvarStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE MQ102QuestScript
Quest __temp = self as Quest
MQ102QuestScript kmyQuest = __temp as MQ102QuestScript
;END AUTOCAST
;BEGIN CODE
; start quest on Imperial side
; debug.trace("MQ Quickstart " + self)
setstage (5)
; debug.trace("MQ Quickstart DONE " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; debug.trace(self + " stage 20")
; player talks to Hadvar - give Riverwood objective
;TimerScene.Start()
MQ102.SetStage(10)
; update Riverwood if player avoids Riverwood for 24 hours
RegisterForSingleUpdateGameTime(24.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
; player has entered Alvor's house
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
; debug.trace(self + " stage 25")
; player agrees to go with Hadvar to Riverwood
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
; player finishes conversation about joining Legion
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE MQ102QuestScript
Quest __temp = self as Quest
MQ102QuestScript kmyQuest = __temp as MQ102QuestScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + " stage 10")
; make Hadvar an ally
Actor Hadvar = Alias_Hadvar.GetReference() as Actor
Hadvar.setrelationshiprank (Game.GetPlayer(), 2)
Hadvar.AddToFaction(kmyquest.CWBuddies)		;used to conditionalize "buddy dialogue" in Civil War missions

; set me to Imperial side
CWScript civilWar = CW as CWScript 
civilWar.playerAllegiance = 1
; set up Alvor and Hadvar aliases on MQ102
MQ102FactionFriend.ForceRefTo(Alias_Hadvar.GetRef())
MQ102RiverwoodFriend.ForceRefTo(Alias_Alvor.GetRef())
; start exit scene
HadvarToRiverwoodScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; fail Riverwood objective if you kill Hadvar or Alvor or Sigrid
MQ102.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; player arrives in Riverwood
HadvarToRiverwoodScene.Stop()
TimerScene.Stop()
if GetStageDone(55) == 0 && GetStageDone(52) == 0
	HadvarAlvorScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; shut down
Alias_Hadvar.GetRef().RemoveItem(AlvorsHouseKey, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE MQ102QuestScript
Quest __temp = self as Quest
MQ102QuestScript kmyQuest = __temp as MQ102QuestScript
;END AUTOCAST
;BEGIN CODE
; NEW
; complete Riverwood objective
MQ102.SetStage(30)
; Alvor now friend, will help you
setstage(47)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
; end MQ101
MQ102.SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Hadvar greets Alvor in Riverwood
MQ102.SetStage(22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
; turn on Civil War when player leaves/ignores Riverwood
MQ102.SetStage(50)
; no need for updates anymore
UnregisterForUpdate()
if Alias_Hadvar.GetRef().GetItemCount(AlvorsHouseKey) == 0
	Alias_Hadvar.GetRef().AddItem(AlvorsHouseKey)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
; start the quest so it's ready
; disable Alduin
Alias_Alduin.GetRef().Disable()
Alias_Alduin.GetRef().Moveto(AlduinStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest property CW auto
Scene property HadvarAlvorScene auto
Quest property MQ00 auto

Quest Property MQ101  Auto  

Quest Property MQ102  Auto  

ReferenceAlias Property MQ102FactionFriend  Auto  

ReferenceAlias Property MQ102RiverwoodFriend  Auto  

Quest Property MQ102B  Auto  

ObjectReference Property HadvarStartMarker  Auto  

Scene Property TimerScene  Auto  

Scene Property HadvarToRiverwoodScene  Auto  

CWAlliesScript Property CWAllies  Auto  

Quest Property CW00A  Auto  
{starting CW quest}

Key Property AlvorsHouseKey  Auto  

ObjectReference Property AlduinStartMarker  Auto  
