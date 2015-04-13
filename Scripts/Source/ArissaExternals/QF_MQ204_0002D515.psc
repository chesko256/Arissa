;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 73
Scriptname QF_MQ204_0002D515 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WordClearSkies
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WordClearSkies Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Einarth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Einarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WordFireBreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WordFireBreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WordClearSkies3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WordClearSkies3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Borri
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Borri Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arngeir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arngeir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Paarthurnax
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Paarthurnax Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wulfgar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wulfgar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BreathTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BreathTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StormTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StormTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lorekeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lorekeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WordClearSkies2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WordClearSkies2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; reached the point in the conversation where P will tell you about backstory of Dragonrend Shout
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
; end Paarthurnax scene (for quickstart)
PaarthurnaxScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_71
Function Fragment_71()
;BEGIN CODE
; Arngeir's final "no" line
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; player has cleared at least some of the storm
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
; cast spell effect towards word
GraybeardTeachFX.Cast(Alias_Arngeir.GetRef(), Alias_WordClearSkies.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; quickstart
; debug.trace("MQ Quickstart " + self)
MQ203.SetStage(1)
MQ203.SetStage(20)
MQ203.SetStage(60)
MQ203.SetStage(110)
MQ203.SetStage(140)
MQ203.SetStage(200)
MQ203.SetStage(260)
MQ203.SetStage(280)
MQ203.SetStage(300)
; move Esbern and Delphine to Sky Haven Temple
Delphine.moveto(SkyHavenTempleMarker)
Esbern.moveto(SkyHavenTempleMarker)
; debug.trace("MQ Quickstart DONE" + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; P wants to know why you need to learn Dragonrend
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN AUTOCAST TYPE MQ204QuestScript
Quest __temp = self as Quest
MQ204QuestScript kmyQuest = __temp as MQ204QuestScript
;END AUTOCAST
;BEGIN CODE
; absorb sequence done
; unlock first word player doesn't have yet
if !Game.IsWordUnlocked(WordYol)
	Game.UnlockWord(WordYol)
elseif !Game.IsWordUnlocked(WordTor)
	Game.UnlockWord(WordTor)
else
	Game.UnlockWord(WordShul)
endif

SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Arngeir has agreed to help after all
ClearSkiesScene.Start()
IntroScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
; Greybeards have rebuked Arngeir
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; debug.trace(self + " stage 150")
; finished with P's introduction/force-greet
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Game.TeachWord(WordLok)
; word fades away
(Alias_WordClearSkies.GetRef() as FXGreybeardShoutScript).GoAway()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; finished with conversation - head to exterior
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE MQGreybeardAbsorbScript
Quest __temp = self as Quest
MQGreybeardAbsorbScript kmyQuest = __temp as MQGreybeardAbsorbScript
;END AUTOCAST
;BEGIN CODE
; trigger absorb from Arngeir
kmyQuest.AbsorbEffect(Alias_Arngeir.GetActorRef(), 86)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; teach shout
; enable word 1
Alias_WordClearSkies.GetReference().Enable()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
Game.TeachWord(WordKoor)
; word fades away
(Alias_WordClearSkies3.GetRef() as FXGreybeardShoutScript).GoAway()
; advance scene
setstage(83)
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

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
; player already had Elder Scroll when he arrived
; complete MQ205 as well
MQ205.SetStage(10)
MQ205.SetStage(100)
; make sure scene ends
setstage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE MQ204QuestScript
Quest __temp = self as Quest
MQ204QuestScript kmyQuest = __temp as MQ204QuestScript
;END AUTOCAST
;BEGIN CODE
; teach player fire breath word - whichever one they don't know yet
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
; enable Word
; which word?
if FirebreathWordCount.value == 0
	Alias_WordFireBreath.ForceRefTo(FireBreathWord1)
	kmyQuest.FireBreathWord = WordYol
elseif FirebreathWordCount.value == 1
	Alias_WordFireBreath.ForceRefTo(FireBreathWord2)
	kmyQuest.FireBreathWord = WordTor
elseif FirebreathWordCount.value == 2
	Alias_WordFireBreath.ForceRefTo(FireBreathWord3)
	kmyQuest.FireBreathWord = WordShul
endif
; increment global so player can't leave without learning this word
FirebreathWordCount.value += 1
; enable the correct word
Alias_WordFireBreath.GetRef().enable()

Alias_Paarthurnax.GetActorRef().RestoreActorValue("health", 160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; player has struck P with fire breath shout
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
; unlock words
Game.UnlockWord(WordLok)
Game.UnlockWord(WordVah)
Game.UnlockWord(WordKoor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
; cast spell effect towards word
GraybeardTeachFX.Cast(Alias_Arngeir.GetRef(), Alias_WordClearSkies3.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
setstage(205)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; player strikes Paarthurnax with firebreath shout prior to being asked
; setstage 140 if quest is ready for that
setStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
; cast spell effect towards word
GraybeardTeachFX.Cast(Alias_Arngeir.GetRef(), Alias_WordClearSkies2.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN CODE
; ready to tell you to find an Elder Scroll
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; transition to MQ205
CompleteAllObjectives()
MQ205.SetStage(10)
MQ205.SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
; all words learned
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; player speaks initially to Paarthurnax
; Paarthurnax "teaches" Fire Breath shout
; turn on Esbern dream scene
MQ00.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
; setstage 140 if player has already hit P with fire shout
setStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
Game.TeachWord(WordVah)
; word fades away
(Alias_WordClearSkies2.GetRef() as FXGreybeardShoutScript).GoAway()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN AUTOCAST TYPE MQGreybeardAbsorbScript
Quest __temp = self as Quest
MQGreybeardAbsorbScript kmyQuest = __temp as MQGreybeardAbsorbScript
;END AUTOCAST
;BEGIN CODE
; trigger absorb from Paarthurnax
kmyquest.DragonAbsorbEffect(Alias_Paarthurnax.GetActorRef(), 135)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
; Arngeir has told player he won't help
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
; Arngeir says player isn't ready
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; enable word 2
Alias_WordClearSkies2.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; begin MQ204
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
; player has reached top of mountain - enable P
Alias_Paarthurnax.GetActorRef().Enable()
PaarthurnaxScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
; enable word 3
Alias_WordClearSkies3.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN AUTOCAST TYPE MQ204QuestScript
Quest __temp = self as Quest
MQ204QuestScript kmyQuest = __temp as MQ204QuestScript
;END AUTOCAST
;BEGIN CODE
; player has learned Fire Breath
Game.TeachWord(kmyQuest.FireBreathWord)
(Alias_WordFireBreath.GetRef() as FXGreybeardShoutScript).GoAway()
; calculate which word to unlock (for dialogue condition)
if !Game.IsWordUnlocked(WordYol)
	kmyQuest.iFireWordToUnlock = 1
elseif !Game.IsWordUnlocked(WordTor)
	kmyQuest.iFireWordToUnlock = 2
else
	kmyQuest.iFireWordToUnlock = 3
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
; player has spoken to Arngeir
IntroScene.Start()
; enable Sky Haven clutter
SkyHavenClutterMarker.Enable()
; give Delphine and Esbern swords
(Delphine as Actor).SetOutfit(BladesArmorNoHelmet)
(Esbern as Actor).SetOutfit(EsbernNewOutfit)
Delphine.AddItem(AkaviriKatana)
Esbern.Additem(AkaviriKatana)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property IntroScene  Auto  

WordOfPower Property WordLok  Auto  
WordOfPower Property WordVah  Auto  
WordOfPower Property WordKoor Auto  

Quest Property MQ203  Auto  

Scene Property PaarthurnaxScene  Auto  

ObjectReference Property BreathTarget  Auto  

WordOfPower Property WordYol  Auto  
{fire breath, word 1}

Quest Property MQ205  Auto  

ObjectReference Property SkyHavenTempleMarker  Auto  
{; for quickstart
}

ObjectReference Property Delphine  Auto  

ObjectReference Property Esbern  Auto  

WordofPower Property WordTor  Auto  

WordofPower Property WordShul  Auto  

GlobalVariable Property FirebreathWordCount  Auto  

Quest Property MQ00  Auto  

mq105questscript Property MQ105  Auto  

Scene Property ClearSkiesScene  Auto  

ObjectReference Property FireBreathWord1  Auto  
{FX word to enable}

ObjectReference Property FireBreathWord2  Auto  

ObjectReference Property FireBreathWord3  Auto  

ObjectReference Property SkyHavenClutterMarker  Auto  

Outfit Property BladesArmorNoHelmet  Auto  

Weapon Property AkaviriKatana  Auto  

Outfit Property EsbernNewOutfit  Auto  

Spell Property GraybeardTeachFX  Auto  
