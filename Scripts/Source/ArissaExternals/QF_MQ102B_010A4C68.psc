;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 64
Scriptname QF_MQ102B_010A4C68 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gerdur
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Gerdur Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ralof
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ralof Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stump
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Stump Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riverwood
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_Riverwood Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hod
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Hod Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frodnar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Frodnar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sven
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Sven Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DummyTimer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DummyTimer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alduin
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Alduin Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
; player isn't in Riverwood when Ralof meets Gerdur
MQ102.SetStage(23)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; start quest on Sons of Skyrim side
; debug.trace("MQ Quickstart " + self)
setstage (10)
; debug.trace("MQ Quickstart DONE " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE MQ102QuestScript
Quest __temp = self as Quest
MQ102QuestScript kmyQuest = __temp as MQ102QuestScript
;END AUTOCAST
;BEGIN CODE
; debug.tracestack(self + "MQ102B stage 10")
MQ102.Start()
; make Ralof a friend
Actor Ralof = Alias_Ralof.GetReference() as Actor
Ralof.setrelationshiprank (Game.GetPlayer(), 2)
Ralof.addToFaction(kmyquest.CWBuddies)		;used to conditionalize "buddy dialogue" in Civil War missions

; set me to Stormcloak side
CWScript civilWar = CW as CWScript 
civilWar.playerAllegiance = 2
; set up Gerdur and Ralof aliases on MQ102
MQ102FactionFriend.ForceRefTo(Alias_Ralof.GetRef())
MQ102RiverwoodFriend.ForceRefTo(Alias_Gerdur.GetRef())
; start exit scene
RalofToRiverwoodScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
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

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; stop quest
Alias_Ralof.GetRef().RemoveItem(GerdursHouseKey, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
; make Gerdur your friend (only if she doesn't hate you already)
if Alias_Gerdur.GetActorReference().GetRelationshipRank(Game.GetPlayer()) >= 0
	Alias_Gerdur.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
;	FriendTutorial.Show()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; turn on Civil War when player leaves/ignores Riverwood
MQ102.SetStage(50)
; no need for updates anymore
UnregisterForUpdate()
if Alias_Ralof.GetRef().GetItemCount(GerdursHouseKey) == 0
	Alias_Ralof.GetRef().AddItem(GerdursHouseKey)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
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

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
; end MQ101
MQ102.SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
; start up quest
; MQ102 also
MQ102.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
; Ralof tells player to join civil war
; give Stormcloak objective
CW00B.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; Ralof greets Gerdur in Riverwood
MQ102.SetStage(22)
if Alias_Ralof.GetRef().GetItemCount(GerdursHouseKey) == 0
	Alias_Ralof.GetRef().AddItem(GerdursHouseKey)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN CODE
; Riverwood scene finished
RalofGerdurScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
; player arrives in Riverwood
RalofToRiverwoodScene.Stop()
TimerScene.Stop() ; player arrived, no need to run timer
if GetStageDone(55) == 0 && GetStageDone(52) == 0
	RalofGerdurScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
; give player a key to Gerdur's house
Game.GetPlayer().AddItem(GerdursKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; NEW
; complete Riverwood objective
MQ102.SetStage(30)
; Gerdur now friend, will help you
setstage(47)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; debug.trace(self + " stage 20")
; player talks to Ralof - give Riverwood objective
;TimerScene.Start()
MQ102.SetStage(10)
Alias_Gerdur.GetActorRef().EvaluatePackage()
Alias_Hod.GetActorRef().EvaluatePackage()
Alias_Frodnar.GetActorRef().EvaluatePackage()
; update Riverwood if player avoids Riverwood for 24 hours
RegisterForSingleUpdateGameTime(24.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; fail Riverwood objective if you kill Ralof or Gerdur or Hod
MQ102.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetStage(1)
Alias_Ralof.GetActorRef().moveto(RalofStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; player agrees to go with Ralof to Riverwood
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
; start the quest so its ready
; disable Alduin
Alias_Alduin.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
; player has entered Gerdur's house
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
; player finishes conversation about joining Stormcloaks
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CW  Auto  

Quest Property MQ102  Auto  

ReferenceAlias Property MQ102FactionFriend  Auto  

ReferenceAlias Property MQ102RiverwoodFriend  Auto  

Scene Property RalofGerdurScene  Auto  

Message Property FriendTutorial  Auto  

ObjectReference Property DelphineWaitMarker  Auto  

Quest Property MQ101  Auto  

ObjectReference Property GerdursDoor  Auto  

Quest Property MQ102A  Auto  

ObjectReference Property RalofStartMarker  Auto  

Scene Property RalofToRiverwoodScene  Auto  

Scene Property TimerScene  Auto  
{scene to run timer to wait before advancing Riverwood scene}

Outfit Property DelphineSpyOutfit  Auto  

Key Property GerdursKey  Auto  
{key to Gerdur's house}

CWAlliesScript Property CWAllies  Auto  

Quest Property CW00B  Auto  

Key Property GerdursHouseKey  Auto  
