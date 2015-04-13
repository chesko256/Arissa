;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_Patch1_5_UpdateQuest_0100083F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Lydia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lydia Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; FOR PATCH 1.5
debug.trace("PATCH 1.5 QUEST HAS STARTED")

; 77808 - check for MQ202 failing to start
if MQ201.GetStageDone(230) && MQ202.GetStage() == 0
	; restart MQ202
	MQ202.SetStage(5)
	; should we be at stage 10?
	if MQ201.GetStageDone(250)
		MQ202.SetStage(10)
	endif
endif

; 77727 - check for MQ201 embassy guard being dead when MQ201 is already running
if MQ201.IsRunning() && MQ201.GetStage() <= 100 && MQ201EmbassyGuard.GetRef() == None
	MQ201EmbassyGuard.ForceRefTo(ThalmorEmbassyGuardPost1.PlaceActorAtMe(ThalmorEmbassyGuardDayShift03))
endif

; 72932 - reset one of the ore mines inside Cidhna Mine
CidhnaMineOre.disable()
CidhnaMineOre.clearDestruction()
CidhnaMineOre.setDestroyed(False)
(CidhnaMineOre as MineOreScript).ResourceCountCurrent = -1
CidhnaMineOre.enable()

;71639 - add Lydia to the marriage faction if you own the house
If (HousePurchase as HousePurchaseScript).WhiterunHouseVar >= 1
  Alias_Lydia.GetActorRef().AddtoFaction(PotentialMarriageFaction)
EndIf

;76641 - TGFences fix if any of the fences have been slain before the quest ran
If TG03.GetStageDone(200) == 1
TGFences.SetStage(20)
endif
If TG04.GetStageDone(200) == 1
TGFences.SetStage(10)
endif
If TG06.GetStageDone(200) == 1
TGFences.SetStage(30)
endif
If TGTQ01.GetStageDone(200) == 1
TGFences.SetStage(50)
endif
If TGTQ04.GetStageDone(200) == 1
TGFences.SetStage(40)
endif
If TGFenceCaravan.GetStageDone(200) == 1
TGFences.SetStage(60)
endif

;75707 - Fixes if TG06 has restarted if the Key to the Dwarven Museum was taken after TG06 ended - will fix Karliah, Enthir or Brynjolf being out of position when this occurs
If TG07.GetStageDone(10) == 1
TG06.Stop()
(KarliahRef as Actor).EvaluatePackage()
(BrynjolfRef as Actor).EvaluatePackage()
(EnthirRef as Actor).EvaluatePackage()
endif
If TGPost.GetStageDone(110) == 1
(KarliahRef as Actor).MoveTo(TG09PostKarliahMarker)
endif

; 74635 - Re-enable C02 kickoff triggers if it choked on reserved aliases
if ( (C02Trigger1.IsDisabled() || C02Trigger2.IsDisabled()) && (!C02.GetStageDone(1)) )
	C02Trigger1.Enable()
	C02Trigger2.Enable()
endif

;KILL THE PATCH QUEST
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ201  Auto  

Quest Property MQ202  Auto  

ReferenceAlias Property MQ201EmbassyGuard  Auto  

ActorBase Property ThalmorEmbassyGuardDayShift03  Auto  

ObjectReference Property ThalmorEmbassyGuardPost1  Auto  

ObjectReference Property CidhnaMineOre  Auto  

Faction Property PotentialMarriageFaction  Auto  

Quest Property HousePurchase  Auto  

Quest Property TG03  Auto  

Quest Property TG04  Auto  

Quest Property TG06  Auto  

Quest Property TGTQ01  Auto  

Quest Property TGTQ04  Auto  

Quest Property TGFenceCaravan  Auto  

Quest Property TGFences  Auto  

Quest Property TG07  Auto  

ObjectReference Property KarliahRef  Auto  

ObjectReference Property BrynjolfRef  Auto  

ObjectReference Property EnthirRef  Auto  

Quest Property TGPost  Auto  

ObjectReference Property TG09PostKarliahMarker  Auto  

ObjectReference Property C02Trigger1  Auto  

ObjectReference Property C02Trigger2  Auto  

Quest Property C02  Auto  
