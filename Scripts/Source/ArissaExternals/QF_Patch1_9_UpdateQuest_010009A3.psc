;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_Patch1_9_UpdateQuest_010009A3 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; FOR PATCH 1.9
debug.trace("PATCH 1.9 QUEST HAS STARTED")

; 89868
;  kicking C06 if C05 completed but was unable to start it
if ( (C05.GetStageDone(200)) && (!C06.GetStageDone(1)) )
    (C00 as CompanionsHousekeepingScript).StartStoryQuest(C06 as CompanionsStoryQuest)
endif

; forcing the player into the CSCQ alias if the quest is already running at patch start
if (CompanionsSingleCombatQuest.IsRunning())
    if (CSCQPlayerAlias.GetReference() == None)
        CSCQPlayerAlias.ForceRefTo(Game.GetPlayer())
    endif
endif
; end 89868

;73466 Clearing the quest item flag on Gallus's Pre-Encoded Journal if no longer needed
if pTG06.GetStageDone(200) == 1
pJournalAlias.Clear()
endif
; end 73466

;94264 Stripping the Invisibility Spell off of Karliah in case it's been reapplied
if pTG05.GetStageDone(200) == 1
(KarliahRef as Actor).RemoveSpell(TG05KarliahInvisibilitySpell)
endif
; end 94264


; 78906 Clearing quest item aliases if MS12 has completed
if (MS12PostQuest.IsRunning())
    MS12bIngredient1.Clear()
    MS12bIngredient3.Clear()
endif
; end 78906

;78144 Enable TGCaches if needed
if pTGRShell.GetStageDone(165) == 1
pTGWhiterunCacheEnabler.Enable()
endif
if pTGRShell.GetStageDone(175) == 1
pTGSolitudeCacheEnabler.Enable()
endif
if pTGRShell.GetStageDone(185) == 1
pTGWindhelmCacheEnabler.Enable()
endif
if pTGRShell.GetStageDone(195) == 1
pTGMarkarthCacheEnabler.Enable()
endif
;end 78144

; 89173 Shut down CR12 if it's running with an empty Questgiver alias
if (CR12.IsRunning() && CR12Questgiver.GetReference() == None)
    Debug.Trace("CR12: Shutting down CR12 since it has an empty questgiver.")
    (CR12 as CompanionsRadiantQuest).IsAccepted = false
    (CR12 as CompanionsRadiantQuest).Premature = true
    ((CR12 as CompanionsRadiantQuest).ParentQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
endif
; end 89173 

; 75151 if the player already drank Esbern's potion, give him the right perk
If (FreeformSkyHavenTempleD.GetStageDone(100) == 1) && (Game.GetPlayer().GetItemCount(BladesPotion) < 1)
  Game.GetPlayer().AddPerk(MQBladesDragonResearch)
EndIf

; if the player has already completed FreeformSkyHavenTempleD, clear objectives
If (FreeformSkyHavenTempleD.GetStageDone(100) == 1) 
  FreeformSkyHavenTempleD.CompleteAllObjectives()
EndIf
; end 75151

; 74640 if the player has encountered the Markarth guards in MS01 but somehow hasn't advanced the quest, push the quest forward
If (MS01.GetStageDone(95) == 1) && (MS01GuardAmbushQuest.GetStage() < 100)
  MS01GuardAmbushQuest.SetStage(10)
EndIf
; end 74640

; 76948 
; let Mathies get picked for CR08 after DA05 is done with him
if (DA05.GetStageDone(20))
    DA05VictimFather.GetActorRef().RemoveFromFaction(CR08ExclusionFaction)
else
    DA05VictimFather.GetActorRef().AddToFaction(CR08ExclusionFaction)
endif
; end 76948

; 77685 kicking C05 if C04 completed but was unable to start it
if ( (C04.GetStageDone(200)) && (!C05.GetStageDone(1)) )
    (C00 as CompanionsHousekeepingScript).StartStoryQuest(C05 as CompanionsStoryQuest)
endif
; end 77685 

; 74822 detect if DA05 is running in a bad state; shut it down
if ( (DA05.GetStage() == 10) && (DA05Sinding.GetActorRef().IsDead()) )
    DA05.SetStage(205)
endif
; end 74822

;KILL THE PATCH QUEST
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property C05  Auto  

Quest Property C06  Auto  

Quest Property C00  Auto  

Quest Property CompanionsSingleCombatQuest  Auto  

ReferenceAlias Property CSCQPlayerAlias  Auto  

Quest Property pTG06  Auto  

ReferenceAlias Property pJournalAlias  Auto  

Quest Property MS12PostQuest  Auto  

ReferenceAlias Property MS12bIngredient1  Auto  

ReferenceAlias Property MS12bIngredient3  Auto  

Quest Property pTGRShell  Auto  

ObjectReference Property pTGWhiterunCacheEnabler  Auto  

ObjectReference Property pTGSolitudeCacheEnabler  Auto  

ObjectReference Property pTGWindhelmCacheEnabler  Auto  

ObjectReference Property pTGMarkarthCacheEnabler  Auto  

Quest Property CR12  Auto  

ReferenceAlias Property CR12Questgiver  Auto  

Quest Property FreeformSkyHavenTempleD  Auto  

Potion Property BladesPotion  Auto  

Perk Property MQBladesDragonResearch  Auto  

Quest Property MS01GuardAmbushQuest  Auto  

Quest Property MS01  Auto  

ReferenceAlias Property DA05VictimFather  Auto  

Faction Property CR08ExclusionFaction  Auto  

Quest Property DA05  Auto  

Quest Property C04  Auto  

ReferenceAlias Property DA05Sinding  Auto  

SPELL Property TG05KarliahInvisibilitySpell  Auto  

Quest Property pTG05  Auto  

ObjectReference Property KarliahRef  Auto  
