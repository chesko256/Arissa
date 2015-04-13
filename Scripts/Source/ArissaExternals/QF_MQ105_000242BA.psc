;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 135
Scriptname QF_MQ105_000242BA Extends Quest Hidden

;BEGIN ALIAS PROPERTY EnarthWordTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EnarthWordTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EinarthWord
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EinarthWord Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Horn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Horn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WulfgarWord
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WulfgarWord Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintTrialGate
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SprintTrialGate Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HighHrothgarMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HighHrothgarMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BorriWordTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BorriWordTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arngeir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arngeir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintTrialStart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SprintTrialStart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OutroTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OutroTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IvarsteadMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IvarsteadMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Einarth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Einarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BorriWord
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BorriWord Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HornMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HornMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Borri
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Borri Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WulfgarWordTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WulfgarWordTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MysteriousNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MysteriousNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SleepingGiantRoomMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SleepingGiantRoomMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wulfgar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wulfgar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
; enable Word
; which word?
if WWWhirlwind.value == 0
	Alias_BorriWord.ForceRefTo(WhirlwindWord1)
	kmyQuest.SprintWord = WordWuld
elseif WWWhirlwind.value == 1
	Alias_BorriWord.ForceRefTo(WhirlwindWord2)
	kmyQuest.SprintWord = WordNah
elseif WWWhirlwind.value == 2
	Alias_BorriWord.ForceRefTo(WhirlwindWord3)
	kmyQuest.SprintWord = WordKest
endif
; increment global so player can't leave without learning this word
WWWhirlwind.value += 1
; enable the correct word
Alias_BorriWord.GetRef().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_119
Function Fragment_119()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
; update objective to get note
MQ105Ustengrav.SetStage(15)
UnregisterForLOS(Game.GetPlayer(), kmyQuest.Tomb)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
; player has hit all targets with push shout
PushTrialScene.Stop()
BorriTeachScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_HighHrothgarMapMarker.GetRef().AddToMap()
Alias_IvarsteadMapMarker.GetRef().AddToMap()
pathPilgrim02.enable()
if MQ104.IsActive()
	SetActive()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_123
Function Fragment_123()
;BEGIN CODE
; Greybeards bow
Alias_Borri.GetActorRef().PlayIdle(IdleSilentBow)
Alias_Einarth.GetActorRef().PlayIdle(IdleSilentBow)
Alias_Wulfgar.GetActorRef().PlayIdle(IdleSilentBow)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
setObjectiveCompleted(40)
setObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
; player has demonstrated whirlwind sprint
; debug.trace(self + " stage 140 - completed sprint trial")
; open the gate!
SprintTrialGate.SetOpen(true)
SprintTrialScene.Stop()
SprintTrialTrigger.Disable()
; open the gate!
SprintTrialGate.SetOpen(true)
setObjectiveCompleted(60)
setObjectiveDisplayed(70)
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_76
Function Fragment_76()
;BEGIN CODE
; player arrives at High Hrothgar, triggers intro scene to advance
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
; learn word from Borri scene finished
; ready to start MQ105SprintTrialScene
SprintTrialScene.Start()
; enable sprint trigger
SprintTrialTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_109
Function Fragment_109()
;BEGIN CODE
setObjectiveCompleted(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; player has demonstrated Shout
setObjectiveCompleted(20)
setObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_118
Function Fragment_118()
;BEGIN CODE
; absorb done
Game.UnlockWord(WordDah)
MQ105Ustengrav.SetStage(50)
; turn on outro triggers
OutroTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; enable Word
Alias_EinarthWord.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_95
Function Fragment_95()
;BEGIN CODE
; close gate
SprintTrialGate.SetOpen(false)
; unequip shout
Alias_Wulfgar.GetActorRef().EquipShout(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
; player has spoken to Arngeir
setObjectiveCompleted(70)
; add achievement
Game.AddAchievement(3)
; start Ustengrav quest
; debug.trace(self + " stage 160 - start Ustengrav")
MQ105Ustengrav.SetStage(10)
; debug.trace(self + " stage 160 - start Ustengrav DONE")
Alias_MysteriousNote.GetRef().Enable()
; tomb can't be activated now
TombActivator.SetDestroyed(true)
; show on map
UstengravMQ105EnableMarker.Disable()
UstengravMapMarker.AddToMap()
; set Jurgen Windcaller flag
(kmyQuest.MQ00 as MQ00QuestScript).JurgenWindcallerFlag = true
; stop the sprint trial scene (failsafe)
SprintTrialScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_128
Function Fragment_128()
;BEGIN CODE
; cast spell effect towards word
GraybeardTeachFX.Cast(Alias_Borri.GetRef(), Alias_BorriWord.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_79
Function Fragment_79()
;BEGIN CODE
; enable Word
Alias_WulfgarWord.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_129
Function Fragment_129()
;BEGIN CODE
; cast spell effect towards word
GraybeardTeachFX.Cast(Alias_Wulfgar.GetRef(), Alias_WulfgarWord.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
; player has returned the horn to Arngeir
MQ105Ustengrav.SetStage(40)
; remove horn
Game.GetPlayer().RemoveItem(Alias_Horn.GetRef(), 1)
; release reservation of Ustengrav
UstengravReserved.Clear()
; start outro scene
OutroScene.Start()
; tomb can now be activated
TombActivator.SetDestroyed(false)
; enable horn
;MQ105HornActivatorRef.Enable()
; stop the sprint trial scene (failsafe)
SprintTrialScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_98
Function Fragment_98()
;BEGIN CODE
; player hits "failsafe" trigger on the path to High Hrothgar - invalidate Ivarstead QT
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
; player has found the note
UnregisterForLOS(Game.GetPlayer(), kmyQuest.Tomb)
MQ105Ustengrav.SetStage(20)
; turn on MQ106
MQ106.setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; player has talked to Arngeir
setObjectiveCompleted(10)
setObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_132
Function Fragment_132()
;BEGIN CODE
; tutorial on more powerful shouts
; debug.trace(self + " stage 85 - ShowAsHelpMessage")
Message.ResetHelpMessage("Shout")
MQ105ShoutMsg.ShowAsHelpMessage("Shout", 5, 30, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
; player has the horn
; enable horn and give to player
Alias_Horn.GetRef().Enable()
Game.GetPlayer().addItem(Alias_Horn.GetRef())
MQ105Ustengrav.SetStage(30)
; stop the sprint trial scene (failsafe)
SprintTrialScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_102
Function Fragment_102()
;BEGIN AUTOCAST TYPE MQGreybeardAbsorbScript
Quest __temp = self as Quest
MQGreybeardAbsorbScript kmyQuest = __temp as MQGreybeardAbsorbScript
;END AUTOCAST
;BEGIN CODE
; trigger absorb from Einarth
kmyquest.AbsorbEffect(Alias_Einarth.GetActorRef(), 76)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_115
Function Fragment_115()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
; absorb done
; unlock first word player doesn't have yet
if !Game.IsWordUnlocked(WordWuld)
	Game.UnlockWord(WordWuld)
elseif !Game.IsWordUnlocked(WordNah)
	Game.UnlockWord(WordNah)
else
	Game.UnlockWord(WordKest)
endif
setObjectiveCompleted(50)
setObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_100
Function Fragment_100()
;BEGIN CODE
; Arngeir greets after first shout test
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; turn on quest when player kills dragon
; in case he wants to bypass going back to his HQ
; make Greybeards friends of the player
GreybeardFaction.SetAlly(PlayerFaction)
; enable dragons in the world
DragonEnableMarker.enable()
DragonsEnabled.SetValueInt(1)
; unlock HH doors
HighHrothgarExteriorDoor1.Lock(false)
HighHrothgarExteriorDoor2.Lock(false)
; clear Farengar's reservation
FarengarReserved.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
; get objective from Sifnar
setstage(5)
setObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
; player has learned Word from Arngeir
Game.TeachWord(WordDah)
; word fades away
(Alias_WulfgarWord.GetRef() as FXGreybeardShoutScript).GoAway()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN CODE
; player has spoken to Arngeir
; open the gate again (failsafe)
SprintTrialGate.SetOpen(true)
; stop the sprint trial scene (failsafe)
SprintTrialScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; if player has already struck someone, advance immediately
setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_117
Function Fragment_117()
;BEGIN AUTOCAST TYPE MQGreybeardAbsorbScript
Quest __temp = self as Quest
MQGreybeardAbsorbScript kmyQuest = __temp as MQGreybeardAbsorbScript
;END AUTOCAST
;BEGIN CODE
; trigger absorb from Wulfgar
kmyquest.AbsorbEffect(Alias_Wulfgar.GetActorRef(), 265)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
; stop MQ104 scenes if player didn't go back to HQ before coming here
MQ104.SetStage(130)
MQ104.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_96
Function Fragment_96()
;BEGIN CODE
; player enters High Hrothgar
Alias_Arngeir.GetActorRef().EvaluatePackage()
Alias_Borri.GetActorRef().EvaluatePackage()
Alias_Einarth.GetActorRef().EvaluatePackage()
Alias_Wulfgar.GetActorRef().EvaluatePackage()
; start intro scene
EinarthTeachScene.Start()
; disable the pilgrim along the path
pathPilgrim02.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_90
Function Fragment_90()
;BEGIN CODE
; Greybeard outro scene done
MQ105Ustengrav.SetStage(60)
; add player to Greybeard faction
Game.GetPlayer().AddToFaction(GreybeardFaction)
; for now, just finish the quest
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_134
Function Fragment_134()
;BEGIN CODE
; first phantom has been summoned - give shout tutorial when player equips Unrelenting Force
if Game.GetPlayer().GetEquippedShout() == UnrelentingForceShout
	SetStage(85)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_107
Function Fragment_107()
;BEGIN CODE
; learn word from Einarth
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
stop()
; TODO -- follow on Greybeards stuff
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_105
Function Fragment_105()
;BEGIN CODE
; Einarth absorb done
Game.UnlockWord(WordRo)
setObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; player has learned Word from Einarth
Game.TeachWord(WordRo)
;setObjectiveCompleted(30)
;setObjectiveDisplayed(35)
; word fades away
(Alias_EinarthWord.GetRef() as FXGreybeardShoutScript).GoAway()
; open 1 more dragon mound
dunDragonMoundQST.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_92
Function Fragment_92()
;BEGIN CODE
; open gate
SprintTrialGate.SetOpen(true)
; equip shout on Wulfgar
Alias_Wulfgar.GetActorRef().EquipShout(WhirlwindSprint)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; start quest on Imperial side
; debug.trace("MQ Quickstart " + self)
MQ104.setstage(1)
MQ103.SetStage(182)
MQ103.SetStage(190)
MQ104.setstage(10)
MQ104.setstage(30)
MQ104.setstage(90) ; make sure player has shout
MQ104.setstage(120)
MQ104.setstage(150)
MQ104.setstage(160) ; finish quest
MQ104.setstage(180)
MQ104.setstage(200)
; debug.trace("MQ Quickstart DONE" + self)
setstage(5)
setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_85
Function Fragment_85()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GreybeardSpeakingEffect(3.0)
;Game.GetPlayer().PlayIdle(playerOutroIdle)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; player strikes one of the Greybeards with push
; set stage 50 if Arngeir has given objective
if getStageDone(30) == 1
  setstage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_125
Function Fragment_125()
;BEGIN CODE
; cast spell effect towards word
GraybeardTeachFX.Cast(Alias_Einarth.GetRef(), Alias_EinarthWord.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_111
Function Fragment_111()
;BEGIN AUTOCAST TYPE MQGreybeardAbsorbScript
Quest __temp = self as Quest
MQGreybeardAbsorbScript kmyQuest = __temp as MQGreybeardAbsorbScript
;END AUTOCAST
;BEGIN CODE
; trigger absorb from Borri
kmyquest.AbsorbEffect(Alias_Borri.GetActorRef(), 120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; start testing scene
EinarthTeachScene.Stop()
PushTrialScene.Start()
setObjectiveDisplayed(40)
;RegisterForUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
; player and all Greybeards in place - trigger ending ceremony
; debug.trace(self + " stage 270 - advance ending ceremony scene")
Game.DisablePlayerControls(abMovement =true, abFighting = true, abCamSwitch =false, abLooking = false, abSneaking = true, abMenu = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_120
Function Fragment_120()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
; player enters tomb area
RegisterForLOS(Game.GetPlayer(), kmyQuest.Tomb)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_87
Function Fragment_87()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GreybeardSpeakingEffect(7.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_88
Function Fragment_88()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GreybeardSpeakingEffect(3.0)
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_114
Function Fragment_114()
;BEGIN AUTOCAST TYPE MQ105QuestScript
Quest __temp = self as Quest
MQ105QuestScript kmyQuest = __temp as MQ105QuestScript
;END AUTOCAST
;BEGIN CODE
; player has learned Whirlwind Sprint from Borri
; failsafe
if kmyQuest.SprintWord == None
	kmyQuest.SprintWord = WordWuld
endif
Game.TeachWord(kmyQuest.SprintWord)
(Alias_BorriWord.GetRef() as FXGreybeardShoutScript).GoAway()
; calculate which word to unlock (for dialogue condition)
if !Game.IsWordUnlocked(WordWuld)
	kmyQuest.iSprintWordToUnlock = 1
elseif !Game.IsWordUnlocked(WordNah)
	kmyQuest.iSprintWordToUnlock = 2
else
	kmyQuest.iSprintWordToUnlock = 3
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerFaction  Auto  

Faction Property GreybeardFaction  Auto  

Scene Property EinarthTeachScene  Auto  

WordOfPower Property WordRo  Auto  

Scene Property PushTrialScene  Auto  

Scene Property BorriTeachScene  Auto  

WordOfPower Property WordWuld  Auto  

Scene Property SprintTrialScene  Auto  

WordOfPower Property WordFeim  Auto  

WordOfPower Property WordSu  Auto  

WordOfPower Property WordFaas  Auto  

Quest Property MQ106  Auto  

ObjectReference Property DragonEnableMarker  Auto  

ObjectReference Property SprintTrialTrigger  Auto  

ObjectReference Property UstengravMapMarker  Auto  

ObjectReference Property SprintTrialGate  Auto  

ObjectReference Property UstengravMQ105EnableMarker  Auto  

LocationAlias Property UstengravReserved  Auto  

GlobalVariable Property DragonsEnabled  Auto  

GlobalVariable Property FavorRewardLarge  Auto  

GlobalVariable Property WWWhirlwind  Auto  
{tracks how many words of the shout the player knows}

ObjectReference Property WhirlwindWord1  Auto  
{first word: Wuld}

ObjectReference Property WhirlwindWord2  Auto  
{word 2: Nah}

ObjectReference Property WhirlwindWord3  Auto  
{word 3: Kest}

WordOfPower Property WordDah  Auto  

ObjectReference Property OutroTrigger  Auto  
{triggers for when everyone's in place for outro scene
}

Scene Property OutroScene  Auto  

WordOfPower Property WordNah  Auto  
{2nd word of Whirlwind Sprint}

WordOfPower Property WordKest  Auto  
{3rd word of Whirlwind Sprint}

Shout Property WhirlwindSprint  Auto  

Quest Property MQ104  Auto  

Quest Property MQ103  Auto  

Quest Property MQ105Ustengrav  Auto  

ObjectReference Property TombActivator  Auto  
{tomb activator to replace horn}

ObjectReference Property HighHrothgarExteriorDoor1  Auto  

ObjectReference Property HighHrothgarExteriorDoor2  Auto  

Idle Property IdleSilentBow  Auto  

Quest Property dunDragonMoundQST  Auto  

ReferenceAlias Property FarengarReserved  Auto  
{clear this when MQ105 starts}

Spell Property GraybeardTeachFX  Auto  

Idle Property PlayerOutroIdle  Auto  

ObjectReference Property PathPilgrim02  Auto  

Message Property MQ105ShoutMsg  Auto  

Shout Property UnrelentingForceShout  Auto  

ObjectReference Property MQ105HornActivatorRef  Auto  
