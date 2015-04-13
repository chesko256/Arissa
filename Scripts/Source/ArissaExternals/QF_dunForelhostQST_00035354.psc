;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 36
Scriptname QF_dunForelhostQST_00035354 Extends Quest Hidden Conditional

;BEGIN ALIAS PROPERTY GrifterImp
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GrifterImp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WellKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WellKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonPriest01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonPriest01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DraugrWarlord
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DraugrWarlord Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExteriorDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ForelhostLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ForelhostLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Well
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Well Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Grifter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Grifter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EndSoldierSons
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EndSoldierSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExtLoadMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExtLoadMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EndSoldierActual
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EndSoldierActual Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InsideForelhostMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InsideForelhostMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonPriestMask
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonPriestMask Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Journal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Journal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DebugMarker03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DebugMarker03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlassClaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GlassClaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EndSoldierImp
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EndSoldierImp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GrifterSons
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GrifterSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CryptChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CryptChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RefectoryMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RefectoryMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;shutdown stage
dunForelhostResetMarker.disable()
AchievementsQuest.IncSideQuests()
ForelhostLocationReservation.clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;start up script
EvalGrifterRef()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;well unlocked - enter refectory
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE QF_dunForelhostQST_00035354
Quest __temp = self as Quest
QF_dunForelhostQST_00035354 kmyQuest = __temp as QF_dunForelhostQST_00035354
;END AUTOCAST
;BEGIN CODE
;player has taken journal
setObjectiveCompleted(10)

if kmyQuest.ValmirKilled == False
	;setObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE QF_dunForelhostQST_00035354
Quest __temp = self as Quest
QF_dunForelhostQST_00035354 kmyQuest = __temp as QF_dunForelhostQST_00035354
;END AUTOCAST
;BEGIN CODE
;scene has ended Valmir opens door - find the journal
Alias_ExteriorDoor.getReference().lock(false)
setObjectiveDisplayed(10)
setObjectiveDisplayed(50)
Alias_Grifter.getActorReference().evaluatePackage()
if ((alias_Grifter.getReference() as actor).getActorBase()) == ValmirImpBase
	ValmirIsImp = TRUE
elseif ((alias_Grifter.getReference() as actor).getActorBase()) == ValmirSonsBase
	ValmirIsImp = FALSE
else
; 	debug.Trace("Forelhost: cannot set ValmirIsImp because" + ((alias_Grifter.getReference() as actor).getActorBase()) + " does not match base")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE QF_dunForelhostQST_00035354
Quest __temp = self as Quest
QF_dunForelhostQST_00035354 kmyQuest = __temp as QF_dunForelhostQST_00035354
;END AUTOCAST
;BEGIN CODE
;Fight Grifter
setObjectiveCompleted(60)
setObjectiveDisplayed(70)
(alias_endSoldierActual.getReference() as actor).addToFaction(soldierFightFaction)
(alias_endSoldierActual.getReference() as actor).removeFromFaction(soldierFriendlyFaction)
Alias_endSoldierActual.getActorReference().setAV("Aggression", 2.0)
(alias_grifter.getReference() as actor).addToFaction(grifterFightFaction)
(alias_grifter.getReference() as actor).removeFromFaction(grifterFriendlyFaction)
Alias_Grifter.getActorReference().setAV("Aggression", 2.0)

Alias_Grifter.getActorReference().evaluatePackage()
Alias_EndSoldierActual.getActorReference().evaluatePackage()
; debug.trace("Forelhost: grifter should be attacking now")
setObjectiveCompleted(60)
;setObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;well key found - unlock well
if isObjectiveDisplayed(30)
	setObjectiveCompleted(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;debug stage for testing the end
game.getPlayer().moveto((alias_DebugMarker03.getReference()))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;scene over return journal to player

if !valmirKilled
	alias_grifter.getReference().removeItem((alias_Journal.getReference()), 1)
	game.getPlayer().addItem((alias_Journal.getReference()), 1)
	setObjectiveDisplayed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
GrifterTurnScene.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Initial greeting Done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;player has entered
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;refectory entered - find dragonpriest staff
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE QF_dunForelhostQST_00035354
Quest __temp = self as Quest
QF_dunForelhostQST_00035354 kmyQuest = __temp as QF_dunForelhostQST_00035354
;END AUTOCAST
;BEGIN CODE
;Player Discovered start betrayal scene
BetrayalScene.start()
;/(alias_endSoldierActual.getReference() as actor).addToFaction(soldierFightFaction)
(alias_endSoldierActual.getReference() as actor).removeFromFaction(soldierFriendlyFaction)
Alias_endSoldierActual.getActorReference().setAV("Aggression", 2.0)
(alias_grifter.getReference() as actor).addToFaction(grifterFightFaction)
(alias_grifter.getReference() as actor).removeFromFaction(grifterFriendlyFaction)
Alias_Grifter.getActorReference().setAV("Aggression", 2.0)/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE QF_dunForelhostQST_00035354
Quest __temp = self as Quest
QF_dunForelhostQST_00035354 kmyQuest = __temp as QF_dunForelhostQST_00035354
;END AUTOCAST
;BEGIN CODE
unlockDoorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Player has given the journal
;setObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;valmir defeated
setObjectiveCompleted(70)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Staff Obtained, but Valmir was already killed
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE QF_dunForelhostQST_00035354
Quest __temp = self as Quest
QF_dunForelhostQST_00035354 kmyQuest = __temp as QF_dunForelhostQST_00035354
;END AUTOCAST
;BEGIN CODE
;Valmir has died
ValmirKilled = True

;Already have the staff
if StaffObtained == True
	setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE QF_dunForelhostQST_00035354
Quest __temp = self as Quest
QF_dunForelhostQST_00035354 kmyQuest = __temp as QF_dunForelhostQST_00035354
;END AUTOCAST
;BEGIN CODE
;dragon priest staff obtained - go speak to Valmir
if !IsObjectiveCompleted(10)
	setObjectiveDisplayed(10, False)
endif
setObjectiveCompleted(50)
kmyQuest.StaffObtained = True

if ValmirKilled
	setstage(110)
else
	if valmirIsImp
		alias_EndSoldierActual.ForceRefTo(alias_EndSoldierSons.getReference())
		;alias_Grifter.getReference().additem(SonsOutfit, 1)
		(alias_Grifter.getReference() as actor).setOutfit(SonsOutfit)
	else
		alias_EndSoldierActual.ForceRefTo(alias_EndSoldierImp.getReference())
		;alias_Grifter.getReference().additem(ImpOutfit, 1)
		(alias_Grifter.getReference() as actor).setOutfit(ImpOutfit)
	endif
	alias_EndSoldierActual.getReference().enable()
	alias_EndSoldierActual.getReference().moveto(GrifterTurnMarkerSoldier)
	alias_Grifter.getReference().moveto(GrifterTurnMarkerValmir)
	GrifterTurnScene.start()

	setObjectiveDisplayed(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bool Property ValmirKilled = false Auto  

scene Property unlockDoorScene  Auto  

faction Property grifterFriendlyFaction  Auto  

faction Property grifterFightFaction  Auto  

scene Property PlayerHasJournalScene  Auto  

scene Property BetrayalScene  Auto  

bool Property StaffObtained  Auto  

bool Property ValmirIsImp  Auto  conditional

scene Property GrifterTurnScene  Auto  

Outfit Property ImpOutfit  Auto  

Outfit Property SonsOutfit  Auto  

faction Property SoldierFriendlyFaction  Auto  

objectReference Property GrifterTurnMarkerValmir  Auto  

objectReference Property GrifterTurnMarkerSoldier  Auto  

actorBase Property ValmirImpBase  Auto  

actorBase Property ValmirSonsBase  Auto  

Faction Property soldierFightFaction  Auto  

cwScript property CWS auto

locationAlias property ForelhostLocationReservation auto

objectReference property ImpEnableMarker auto
objectReference property SonsEnableMarker auto
AchievementsScript Property AchievementsQuest Auto

;This function checks which faction the player is in, if the grifter is alive
;and forces the appropriate actor into the grifter referenceAlias
function EvalGrifterRef()
	if CWS.playerAllegiance <= CWS.iImperials	;player is part of imperial faction or unaligned (integer value of 1)
; 		debug.Trace(self + " has found player allegiance is to imperial")
		if !valmirIsImp && !valmirKilled
; 			debug.Trace(self + " has found that Valmir is not an imperial, swap state")
			valmirIsImp = TRUE
			ImpEnableMarker.enable()			;enable imperial version of Valmir
			SonsEnableMarker.disable()			;disable sons version of Valmir
			utility.wait(0.5)
			Alias_Grifter.forceRefTo(alias_GrifterImp.getReference())
; 			debug.Trace(self + " has tried to force fill Alias_Grifter to Imperial: "+ alias_Grifter)
		else
			Alias_Grifter.forceRefTo(alias_GrifterImp.getReference())
; 			debug.Trace(self + " has tried to force fill Alias_Grifter to Imperial: "+ alias_Grifter)
		endif
	elseif CWS.playerAllegiance >= CWS.iSons	;player is part of sons faction (integer value of 2)
; 		debug.Trace(self + " has found player allegiance is to stormcloak")
		if valmirIsImp && !valmirKilled
; 			debug.Trace(self + " has found that Valmir is not a stormcloakl, swap state")
			valmirIsImp = FALSE
			ImpEnableMarker.disable()			;disable imperial version of Valmir
			SonsEnableMarker.enable()			;enable sons version of Valmir
			utility.wait(0.5)
			Alias_Grifter.forceRefTo(alias_GrifterSons.getReference())
; 			debug.Trace(self + " has tried to force fill Alias_Grifter to Stormcloak: "+ alias_Grifter)
		else
			Alias_Grifter.forceRefTo(alias_GrifterSons.getReference())
; 			debug.Trace(self + " has tried to force fill Alias_Grifter to Stormcloak: "+ alias_Grifter)
		endif
	else
; 		debug.Trace(self + " error: CWS.playerAllegiance was not equal to either Faction!")
	endif
endFunction



ObjectReference Property dunForelhostResetMarker  Auto  
