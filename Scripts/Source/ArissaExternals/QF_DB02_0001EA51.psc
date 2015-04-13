;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname QF_DB02_0001EA51 Extends Quest Hidden

;BEGIN ALIAS PROPERTY UnluckyFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UnluckyFriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DB02Captive2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB02Captive2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Astrid
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Astrid Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DB02Captive1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB02Captive1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlackDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlackDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DB02Captive3Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DB02Captive3Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE DB02Script
Quest __temp = self as Quest
DB02Script kmyQuest = __temp as DB02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
SetObjectiveDisplayed(20, 1)
;kmyQuest.pDBEntranceQuest.SetStage (200)
;(kmyquest.DarkBrotherhoodQuest as DBscript).CiceroArrive = 3
;kmyquest.pAstridWalkAway1 = 1
Game.EnablePlayerControls()
kmyQuest.pDBEntranceQuest.UnRegisterForUpdate()
;RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Controls the state of the Loreius Farm
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if DBScript.DB01MiscResolved == 0
if DB01Misc.GetStage () >= 10
     (pLoreius As Actor).GetActorBase().SetEssential (false)
     (pCurwe As Actor).GetActorBase().SetEssential (false)
      pCiceroRoad.Disable()
      pCart.Disable()
      pCoffin.Disable()
      pWheel.Disable()
      pHorse.Disable()
      DBScript.LoreiusState = 1
     DB01Misc.SetStage (210)
endif
endif

if DBScript.DB01MiscResolved == 1
    pCiceroRoad.Disable()
     pCart.Disable()
     pCoffin.Disable()
     pWheel.Disable()
      pHorse.Disable()
     pLoreius.Disable()
     pLoreiusDead.Enable()
     pCurwe.Disable()
     pCurweDead.Enable()
     DBScript.LoreiusState = 2
endif

if DBScript.DB01MiscResolved == 2
      pCiceroRoad.Disable()
      pCart.Disable()
      pCoffin.Disable()
      pWheel.Disable()
      pHorse.Disable()
      (pLoreius As Actor).GetActorBase().SetEssential (false)
      (pCurwe As Actor).GetActorBase().SetEssential (false)
     DBScript.LoreiusState = 1
endif


;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
if DBScript.DB01MiscResolved == 0
if DB01Misc.GetStage () < 10
     (pLoreius As Actor).GetActorBase().SetEssential (false)
     (pCurwe As Actor).GetActorBase().SetEssential (false)
      pCiceroRoad.Disable()
      pCart.Disable()
      pCoffin.Disable()
      pWheel.Disable()
      pHorse.Disable()
     DB01Misc.SetStage (215)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE DB02Script
Quest __temp = self as Quest
DB02Script kmyQuest = __temp as DB02Script
;END AUTOCAST
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
   
if DBScript.CourierDeliver == 0
       (Kmyquest.WICourier as WiCourierScript).RemoveRefFromContainer(Kmyquest.DarkBrotherhoodQuest.CourierLetter)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
if DBScript.DB01MiscResolved == 0
if DB01Misc.GetStage () < 10
     (pLoreius As Actor).GetActorBase().SetEssential (false)
     (pCurwe As Actor).GetActorBase().SetEssential (false)
      pCiceroRoad.Disable()
      pCart.Disable()
      pCoffin.Disable()
      pWheel.Disable()
      pHorse.Disable()
     DB01Misc.SetStage (215)
endif
endif


Utility.Wait(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50, 1)
Alias_Astrid.GetActorReference().GetActorBase().SetEssential (true)
Game.GetPlayer().AddToFaction(DarkBrotherhoodFaction)
Alias_Astrid.GetActorRef().SetOutfit (AstridSanctuaryOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DB02Script
Quest __temp = self as Quest
DB02Script kmyQuest = __temp as DB02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40, 1)
;kmyquest.pAstridWalkAway2 = 1
RegisterForUpdate(5)
kmyquest.pAstridWalkAway1 = 1
Alias_Astrid.GetActorReference().GetActorBase().SetEssential ()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE DB02Script
Quest __temp = self as Quest
DB02Script kmyQuest = __temp as DB02Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DB01.SetStage (200)
;Alias_Astrid.GetReference().Moveto (AstridMoveMarkerRef)
;KmyQuest.RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE DB02Script
Quest __temp = self as Quest
DB02Script kmyQuest = __temp as DB02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(30, 1)
pDBEntranceQuestScript ExternalScript = kmyQuest.pDBEntranceQuest as pDBEntranceQuestScript
ExternalScript.pSleepyTime = 5
;kmyQuest.pDBEntranceQuest.RegisterForUpdate(2)
;RegisterForUpdate(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Controls the state of the Loreius Farm
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if DBScript.DB01MiscResolved == 0
if DB01Misc.GetStage () >= 10
     (pLoreius As Actor).GetActorBase().SetEssential (false)
     (pCurwe As Actor).GetActorBase().SetEssential (false)
      pCiceroRoad.Disable()
      pCart.Disable()
      pCoffin.Disable()
      pWheel.Disable()
      pHorse.Disable()
      DBScript.LoreiusState = 1
     DB01Misc.SetStage (210)
endif
endif

if DBScript.DB01MiscResolved == 1
    pCiceroRoad.Disable()
     pCart.Disable()
     pCoffin.Disable()
     pWheel.Disable()
      pHorse.Disable()
     pLoreius.Disable()
     pLoreiusDead.Enable()
     pCurwe.Disable()
     pCurweDead.Enable()
     DBScript.LoreiusState = 2
endif

if DBScript.DB01MiscResolved == 2
      pCiceroRoad.Disable()
      pCart.Disable()
      pCoffin.Disable()
      pWheel.Disable()
      pHorse.Disable()
      (pLoreius As Actor).GetActorBase().SetEssential (false)
      (pCurwe As Actor).GetActorBase().SetEssential (false)
     DBScript.LoreiusState = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_Astrid.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt() )
SetObjectiveCompleted(50)
Game.AddAchievement(18)
Utility.Wait(5)
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property AstridMoveMarkerRef  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property pLoreius  Auto  

ObjectReference Property pCurwe  Auto  

ObjectReference Property pLoreiusDead  Auto  

ObjectReference Property pCurweDead  Auto  

ObjectReference Property pCiceroRoad  Auto  

ObjectReference Property pCoffin  Auto  

ObjectReference Property pCart  Auto  

GlobalVariable Property pFavorReward  Auto  

ObjectReference Property pWheel  Auto  

ObjectReference Property pHorse  Auto  

Faction Property DarkBrotherhoodFaction  Auto  

Quest Property DB01Misc  Auto  

Outfit Property AstridSanctuaryOutfit  Auto  
