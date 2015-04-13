;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_DBDestroy_000934FB Extends Quest Hidden

;BEGIN ALIAS PROPERTY VeezaraAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VeezaraAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlackDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlackDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CommanderMaroAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CommanderMaroAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GabriellaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GabriellaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArnbjornAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArnbjornAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BabetteAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BabetteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FestusKrexAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FestusKrexAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LisAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LisAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted (40)
Alias_CommanderMaroAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 3) 
Game.GetPlayer().AddItem(pGold,3000)
;Game.GetPlayer().AddItem(LvlQuestReward04Wow)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
DB02Script DBScript = pDB02 as DB02Script

if DBScript.pCaptive1Free == 2
      if DBScript.Captive1Dead == 0
             Captive1.Disable()
      endif
endif

if DBScript.pCaptive2Free == 2
      if DBScript.Captive2Dead == 0
             Captive2.Disable()
      endif
endif

if DBScript.pCaptive3Free == 2
      if DBScript.Captive3Dead == 0       
             Captive3.Disable()
      endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted (10)
SetObjectiveDisplayed(20)

Alias_CommanderMaroAlias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.BlackDoorPass = 1
DBMapMarker.Enable()
Game.GetPlayer().RemoveFromFaction(DarkBrotherhoodFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveDisplayed(10)
DB02Script DBScript = pDB02 as DB02Script
DBScript.pCaptive1Free = 1
DBScript.pCaptive2Free = 1
DBScript.pCaptive3Free = 1

;Since the Katariah will never enable now, move its skill book somewhere else.
dunSkillBooksQST.SetStage(20)

;Adjust the Sanctuary
DBSanc_DBX_Enable.Enable()
DBSanc_DBX_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted (30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
RegisterForUpdate(5)

; -- Works better with these commented out. --Steve
;Alias_NazirAlias.GetActorRef().StartCombat(Game.GetPlayer())
;Alias_VeezaraAlias.GetActorRef().StartCombat(Game.GetPlayer())
;Alias_ArnbjornAlias.GetActorRef().StartCombat(Game.GetPlayer())
;Alias_GabriellaAlias.GetActorRef().StartCombat(Game.GetPlayer())
;Alias_FestusKrexAlias.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
UnRegisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
DB02Script DBScript = pDB02 as DB02Script

if DBScript.pCaptive1Free == 2
      if DBScript.Captive1Dead == 0
             Captive1.Disable()
      endif
endif

if DBScript.pCaptive2Free == 2
      if DBScript.Captive2Dead == 0
             Captive2.Disable()
      endif
endif

if DBScript.pCaptive3Free == 2
      if DBScript.Captive3Dead == 0       
             Captive3.Disable()
      endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted (20)
SetObjectiveDisplayed(30)

Alias_ArnbjornAlias.GetReference().Enable()
Alias_ArnbjornAlias.GetActorReference().GetActorBase().SetEssential(false)
Alias_ArnbjornAlias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
Alias_ArnbjornAlias.GetActorRef().MoveToPackageLocation()
Alias_VeezaraAlias.GetReference().Enable()
Alias_VeezaraAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_VeezaraAlias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
Alias_VeezaraAlias.GetActorRef().MoveToPackageLocation()
Alias_GabriellaAlias.GetReference().Enable()
Alias_GabriellaAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_GabriellaAlias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
Alias_GabriellaAlias.GetActorRef().MoveToPackageLocation()
Alias_FestusKrexAlias.GetReference().Enable()
Alias_FestusKrexAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_FestusKrexAlias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
Alias_FestusKrexAlias.GetActorRef().MoveToPackageLocation()
Alias_NazirAlias.GetReference().Enable()
Alias_NazirAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_NazirAlias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
Alias_NazirAlias.GetActorRef().MoveToPackageLocation()
Alias_LisAlias.GetReference().Enable()
Alias_LisAlias.GetActorReference().GetActorBase().SetEssential (false)
Alias_LisAlias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
Alias_LisAlias.GetActorRef().MoveToPackageLocation()
Alias_BabetteAlias.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pGold  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property DBMapMarker  Auto  

Quest Property pDB02  Auto  

Faction Property DBAttackPlayerFaction  Auto  

Faction Property DarkBrotherhoodFaction  Auto  


ObjectReference Property DBSanc_DBX_Enable  Auto  

ObjectReference Property DBSanc_DBX_Disable  Auto  

LeveledItem Property LvlQuestReward04Wow  Auto  

ObjectReference Property Captive1  Auto  
ObjectReference Property Captive2  Auto  
ObjectReference Property Captive3  Auto  

Quest Property dunSkillBooksQST  Auto  
