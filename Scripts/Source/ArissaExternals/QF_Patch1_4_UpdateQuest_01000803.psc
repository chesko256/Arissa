;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_Patch1_4_UpdateQuest_01000803 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; FOR PATCH 1.4
debug.trace("PATCH 1.4 QUEST HAS STARTED")

; FIX FOR MS01 GUARDS NEVER LOSING THEIR SPECIAL ARREST DIALOGUE
If MS02.GetstageDone(5) == 1 && MS01GuardAmbushQuest.GetStageDone(100) == 0
  MS01GuardAmbushQuest.SetStage(100)
EndIf

; FIX FOR MS01 GUARDS NEVER LEAVING SHRINE OF TALOS
If MS01GuardAmbushQuest.GetStageDone(100) == 1 && MS01GuardAmbushQuest.IsRunning() == True
  MS01GuardAmbushQuest.Stop()
EndIf

; FIX FOR 75977, PLAYER COLLECTING MS12 INGREDIENTS OUT OF ORDER
(MS12b as MS12bQuestScript).FixEarlyCollection()

; FIX FOR MGRAPPONMUND01, COLLECTING STAFF OUT OF ORDER

If MGRAppOnmund01.GetStage() == 20
		(MGRAppOnmund01 as MGRAppOnmund1QuestScript).EarlyStaffAcquire()
endif

;FIX FOR MG06, ARMILLARY RESET BY UNCONDITIONED ONLOAD BLOCK
Debug.Trace("Patch Script is working")
If MG06.GetStage() == 50
	Debug.Trace("Checking State of ArmillaryRef")
	if MG06ArmillaryRef.GetState() == "initial"
		Debug.Trace("updating state")
		MG06ArmillaryRef.GoToState("Position01")

	endif
endif

; FIX FOR MGRARNIEL03, IF PLAYER HAS ACQUIRED QUEST A 2ND TIME

If MGRArniel03.GetStage() == 40

	if MGRArniel03.GetStageDone(10) == false
		MGRArniel03.SetStage(200)
	endif
endif

; FIX FOR TGCROWN, UNABLE TO GET BACK INTO THALMOR EMBASSY (66080)
; move gem to Reeking Cave
TGCrownGemAct15.MoveTo(TGCrown15MoveToMarker)

;TG03 Startup Check
if pTG02.GetStage() == 200
   if pTG03.GetStage() == 0
      pTG03.SetStage(10)
   endif
endif

; FIX MEHRUNES RAZOR VANISHING WHEN CELL RESETS
DA07.FixRazor()

;FIX DA14 PORTAL REMAINING AFTER QUEST COMPLETES
if DA14.GetStageDone(200) == 1
     DA14PortalDoor.disable()
     DA14PortalFX.disable()
     DA14PortalLight.disable()
     DA14PortalEnabler.disable()
endif

; FIX MS11 CALIXTO NOT BEING KILLABLE
if (MS11.GetStageDone(130) && MS11CalixtoEssential.GetRef() != None)
    MS11CalixtoEssential.Clear()
endif

;Fix for DA09 to handle if the gem is in an unreachable location
Location GemLoc = DA09GemContainerLocation.GetLocation()

if DA09.GetStageDone(100) == false ;<--adding this if statement in Update 1.6 to fix bug introduced in 1.4
	if GemLoc == KatariahLocation || GemLoc == DawnstarSanctuaryLocation
	   debug.trace("Patch Quest adding DA09 Gem to Valtheim boss chest.")
	   DA09GemFixContainer.addItem(DA09Gem.GetReference())
	endif
endif

;DA02 fix
((self as quest) as DA02FixStageScript).setStageVariable()

;TG00/TG01 Brynjolf Fix
if pTG01.GetStageDone(10) == 1
if pTG01.IsRunning() == 1
if pTG00SP.IsRunning() == 1
pTG00SP.Stop()
pBrynjolfRef.EvaluatePackage()
endif
endif
endif

;MS12 FORSAKEN CAVE RESETFIX
if MS12.getstage()== 10 &&  game.getplayer().getitemcount(MS12Potion) < 1
	MS12secretdoor.disable()
endif

;KILL THE PATCH QUEST
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS02  Auto  

Quest Property MS01GuardAmbushQuest  Auto  

Quest Property MS12b  Auto  

Quest Property MGRAppOnmund01  Auto  

Quest Property MG06  Auto  

ObjectReference Property MG06ArmillaryRef  Auto  


Quest Property MGRArniel03  Auto  

Quest Property pTG02  Auto  

Quest Property pTG03  Auto  

DA07QuestScript Property DA07  Auto  

Quest Property DA14  Auto  

ObjectReference Property DA14PortalFX  Auto  

ObjectReference Property DA14PortalDoor  Auto  

ObjectReference Property DA14PortalLight  Auto  

ObjectReference Property DA14PortalEnabler  Auto  

Quest Property MS11  Auto  

ReferenceAlias Property MS11CalixtoEssential  Auto  

;<DA09>
Location Property KatariahLocation  Auto  
Location Property DawnstarSanctuaryLocation  Auto  
LocationAlias Property DA09GemContainerLocation  Auto  
ObjectReference Property DA09GemFixContainer  Auto  
ReferenceAlias Property DA09Gem  Auto  
;</DA09>




Quest Property DA02  Auto  

;<TG00/TG01>
Quest Property pTG00  Auto  
Quest Property pTG01  Auto  
Quest Property pTG00SP  Auto  
Actor Property pBrynjolfRef  Auto  

ObjectReference Property TGCrownGemAct15  Auto  

ObjectReference Property TGCrown15MoveToMarker  Auto  
{marker to move gem to}

Quest Property MS12  Auto  

ObjectReference Property MS12SecretDoor  Auto  

MiscObject Property MS12Potion  Auto  

Quest Property DA09  Auto  
