;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 69
Scriptname QF_MQ304_00046EF1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Sovngarde
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Sovngarde Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hakon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hakon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alduin1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alduin1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tsun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tsun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TEMPTriggerBoxToMakeItPersistent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TEMPTriggerBoxToMakeItPersistent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoulMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoulMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Felldir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Felldir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostSoul1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostSoul1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gormlaith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gormlaith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ysgramor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ysgramor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
; lost soul 4 devour done
; debug.trace(self + " stage 110")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Alduin disappears into the mist -- lose quest target to him
Alias_Alduin1.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; enable Companion NPCs
CompanionsEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
MQ304GalmarRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; talked to lost soul
SetObjectiveCompleted(10) ; TODO -- fail this?
SetObjectiveDisplayed(20)
Alias_Alduin1.GetActorRef().EvaluatePackage()
Alias_LostSoul.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; quickstart
; debug.trace("MQ Quickstart " + self)
SetStage(5)
SetStage(10)
MQ303.SetStage(1)
MQ303.SetStage(100)
MQ303.SetStage(180)
MQ303.SetStage(300)
; debug.trace("MQ Quickstart DONE " + self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
; trigger lost soul 4 devour
Alias_Alduin1.GetActorRef().EvaluatePackage()
Alias_Alduin1.GetActorRef().SetActorValue("variable01", 1)
; disable other trigger
LostSoul3Trigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
; debug.trace(self + "stage 140 START")
; player talks to Tsun
Alias_Tsun.GetActorRef().GetActorBase().SetInvulnerable(false)
; start combat sequence
TsunFaction.SetEnemy(PlayerFaction)
Alias_Tsun.RegisterForUpdate(1)
Alias_Tsun.GetActorRef().StartCombat(Game.GetPlayer())
; failsafe
setstage(50)
; debug.trace(self + "stage 140 END")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
; trigger lost soul 3 devour
Alias_Alduin1.GetActorRef().EvaluatePackage()
Alias_Alduin1.GetActorRef().SetActorValue("variable01", 1)
; disable other trigger
LostSoul4Trigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
; player reaches "end of valley"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
; Ysgramor has forcegreeted
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; spoken to all heroes
CompleteAllObjectives()
HallofHeroesScene.Stop()
MQ305.SetStage(10)
MQ305.SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
; lost soul 2 flight grab done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
HallofHeroesScene.Start()
; disable all "Alduins in the mist"
Alias_Alduin1.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
; Alduin's attack on SE lost soul triggered (Lost Soul 1)
; reset actor value
Alias_Alduin1.GetActorRef().SetActorValue("variable01", 1)
Alias_Alduin1.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player arrives in Sovngarde
; failsafe
setstage(5)
SetObjectiveDisplayed(10)
; stop combat from Skuldafn
Game.GetPlayer().StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
; lost soul 1 flight grab done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; Tsun defeated
Alias_Tsun.GetActorRef().GetActorBase().SetInvulnerable(true)
Alias_Tsun.GetActorRef().IgnoreFriendlyHits(true)
TsunFaction.SetAlly(PlayerFaction)
Alias_Tsun.GetActorRef().StopCombat()
Alias_Tsun.UnregisterForUpdate()
; bridge opened
BridgeBlockTrigger.Disable()
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
TsunDefeatScene.Start()
; failsafe
LostSoulScene1.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
; Alduin's attack on SW lost soul triggered (Lost Soul 2)
Alias_Alduin1.GetActorRef().SetActorValue("variable01", 1)
Alias_Alduin1.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; Alduin devours soul from mist
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
MQ304UlfricRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
; player approaches 3 heroes
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
; debug.trace(self + " stage 100")
; lost soul 3 devour done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; start the quest before player enters Sovngarde
; Alduin is immune from Dragonrend until mist clears
MQAlduinIgnoreDragonrend.SetValue(1)
; move NPCs into position
Alias_Felldir.GetRef().Enable()
Alias_Hakon.GetRef().Enable()
Alias_Gormlaith.GetRef().Enable()
Alias_Hakon.GetRef().MoveTo(HallofHeroesMarker)
Alias_Felldir.GetRef().MoveTo(HallofHeroesMarker)
Alias_Gormlaith.GetRef().MoveTo(HallofHeroesMarker)
; enable ambush Alduins
Alias_Alduin1.TryToEnable()
LostSoulScene1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE MQ304Script
Quest __temp = self as Quest
MQ304Script kmyQuest = __temp as MQ304Script
;END AUTOCAST
;BEGIN CODE
; Lost soul stops following
kmyQuest.LostSoulFollowFlag = false
Alias_LostSoul.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
MQ304RikkeRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
; player passes first lost soul - start timer to stop following
Alias_LostSoul.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
MQ304FrokiRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN CODE
MQ304SvaknirRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
; player has spoken to Shor
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; player reaches viewpoint to see Alduin escape into the mist
Alias_Alduin1.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ303  Auto  

Faction Property TsunFaction  Auto  

Faction Property PlayerFaction  Auto  

ObjectReference Property BridgeBlockTrigger  Auto  

Scene Property TsunDefeatScene  Auto  

ObjectReference Property HallofHeroesMarker  Auto  

Quest Property MQ305  Auto  

Scene Property LostSoulScene1  Auto  

Scene Property HallofHeroesScene  Auto  

ObjectReference Property CompanionsEnableMarker  Auto  
{turns on post-Companions NPCs
}

GlobalVariable Property MQAlduinIgnoreDragonrend  Auto  

ObjectReference Property LostSoul3Trigger  Auto  

ObjectReference Property LostSoul4Trigger  Auto  


ObjectReference Property MQ304SvaknirRef  Auto  

ObjectReference Property MQ304FrokiRef  Auto  

ObjectReference Property MQ304UlfricRef  Auto  
ObjectReference Property MQ304GalmarRef  Auto  
ObjectReference Property MQ304RikkeRef  Auto  
