;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 52
Scriptname QF_CWFunctions_0002BFAE Extends Quest Hidden

;BEGIN ALIAS PROPERTY LocationA
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LocationA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReferenceA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReferenceA Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;THIS QUEST IS FOR DEBUGGING ONLY THESE AREN'T FUNCTIONS CALLED BY GAME
debug.messageBox("Starting CWAttackCity for Whiterun")
kmyquest.CWs.CWAttackCityStart.SendStoryEvent(kmyquest.CWs.WhiterunLocation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;QUICKSTART Riften Attack on Imperial side - note doesn't wait for the actual campaign to finsih starting
; debug.trace("CWFunctions setting vars")
(kmyquest.CW as CWScript).DebugOn.SetValue(1.00)
(kmyquest.CW as CWScript).CWDebugForceAttacker.setValue(1)
(kmyquest.CW as CWScript).CWDebugForceHold.setValue(9)
while (kmyquest.CW as CWScript).CWDebugForceAttacker.Value == 0 || (kmyquest.CW as CWScript).CWDebugForceHold.Value == 0
  utility.wait(1)
;   debug.trace("CWFunctions waiting for CWDebugForceAttacker/Hold to be non-zero")
endwhile

; debug.trace("CWFunctions calling stage on CW to put player in Imperial faction and make Civil War active")
kmyquest.CW.SetStage(1)
while (kmyquest.CW as CWScript).countCampaigns == 0
utility.wait(1)
; debug.trace("CWFunctions waiting for campaign count to increment before starting seige quest")
endwhile
; debug.trace("CWFunctions starting siege quest")
kmyquest.CWSiegeStart.SendStoryEvent(kmyquest.RiftenLocation)
while kmyquest.CWSiegeRiftenAttackQST.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWSiegeRiftenAttackQST.IsRunning()")
endwhile
kmyQuest.CWSiegeRiftenAttackQST.SetStage(1)
utility.wait(1)
Game.GetPlayer().MoveTo(kmyquest.RiftenAttackStart)
kmyquest.GameHour.SetValue(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;test clear crime gold function
kmyquest.CWs.ClearHoldCrimeGold(kmyquest.CWs.WhiterunHoldLocation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;THIS QUEST IS FOR DEBUGGING ONLY THESE AREN'T FUNCTIONS CALLED BY GAME

;Moves the player to ReferenceA
Game.GetPlayer().moveto(Alias_ReferenceA.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;QUICKSTART Whiterun Attack on SONS side - note doesn't wait for the actual campaign to finsih starting
; debug.trace("CWFunctions setting vars")
(kmyquest.CW as CWScript).DebugOn.SetValue(1.00)
(kmyquest.CW as CWScript).CWDebugForceAttacker.setValue(2)
(kmyquest.CW as CWScript).CWDebugForceHold.setValue(4)
while (kmyquest.CW as CWScript).CWDebugForceAttacker.Value == 0 || (kmyquest.CW as CWScript).CWDebugForceHold.Value == 0
  utility.wait(1)
;   debug.trace("CWFunctions waiting for CWDebugForceAttacker/Hold to be non-zero")
endwhile

; debug.trace("CWFunctions calling stage on CW to put player in SONS faction and make Civil War active")
kmyquest.CW.SetStage(2)
while (kmyquest.CW as CWScript).countCampaigns == 0
utility.wait(1)
; debug.trace("CWFunctions waiting for campaign count to increment before starting seige quest")
endwhile
; debug.trace("CWFunctions starting siege quest")
kmyquest.CWSiegeStart.SendStoryEvent(kmyquest.WhiterunLocation)
while kmyquest.CWSiegeWhiterunAttackQST.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWSiegeWhiterunAttackQST.IsRunning()")
endwhile
kmyquest.CWSiegeWhiterunAttackQST.SetStage(1)
utility.wait(1)
Game.GetPlayer().MoveTo(kmyquest.CWSiegeWhiterunAttackStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;Quick Start Defense on Fort Quest

;QUICKSTART Fort Siege on IMPERIAL side
; debug.trace("CWFunctions setting vars")
(kmyquest.CW as CWScript).DebugOn.SetValue(1.00)
(kmyquest.CW as CWScript).CWDebugForceAttacker.setValue(2)
(kmyquest.CW as CWScript).CWDebugForceHold.setValue(4)
while (kmyquest.CW as CWScript).CWDebugForceAttacker.Value == 0 || (kmyquest.CW as CWScript).CWDebugForceHold.Value == 0
  utility.wait(1)
;   debug.trace("CWFunctions waiting for CWDebugForceAttacker/Hold to be non-zero")
endwhile

; debug.trace("CWFunctions calling stage on CW to put player in IMPERIAL faction and make Civil War active")
kmyquest.CW.SetStage(1)

while kmyquest.CWFortSiege.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWFortSiege.IsRunning()")
endwhile

; debug.trace("CWFunctions CWFortSiege quest isRunning! ")
debug.MessageBox("CWFunctions CWFortSiege quest isRunning! ")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
; debug.trace("CWFunctions setting Whiterun hold owned by the Imperials.")
; debug.trace("CWFunctions setting Whiterun owned by the Imperials... please wait...")
kmyquest.CWDebugOn.setValue(1)
kmyquest.CWs.SetHoldOwnerByInt(4, 1)
; debug.trace("CWFunctions DONE setting Whiterun owned by the Imperials.")
debug.messagebox("CWFunctions DONE setting Whiterun owned by the Imperials.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;THIS QUEST IS FOR DEBUGGING ONLY THESE AREN'T FUNCTIONS CALLED BY GAME

;sets CWScript PlayerAllegiance to 2 (ie Sons)
kmyquest.CWs.setStage(2)

;kmyquest.CWs.WarIsActive = 1

kmyquest.CWs.AddEnemyFortsToBackToWar(ShowDebugMessage = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;quick start the City Attack portion of the attack on Whiterun
setStage(100)
while kmyquest.CWSiegeWhiterunAttackQST.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWSiegeWhiterunAttackQST.IsRunning()")
endwhile
kmyquest.CWSiegeWhiterunAttackQST.setStage(50)
utility.wait(3)
Game.GetPlayer().moveto(kmyquest.COCMarkerWhiterun)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;THIS QUEST IS FOR DEBUGGING ONLY THESE AREN'T FUNCTIONS CALLED BY GAME

;sets ownership of alias LocationA to whatever the player allegiance is
;A convenient way to test if setOwner() function is processing a location correctly
; debug.trace("Stage 20")
kmyquest.CWs.SetOwner(Alias_LocationA.GetLocation(), kmyquest.CWs.playerAllegiance)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;THIS QUEST IS FOR DEBUGGING ONLY THESE AREN'T FUNCTIONS CALLED BY GAME
debug.notification("Calling setOwnerWhiterun(2)")
kmyquest.CWs.setOwnerWhiterun(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;QUICKSTART Markarth Attack on SONS side - note doesn't wait for the actual campaign to finsih starting
; debug.trace("CWFunctions setting vars")
(kmyquest.CW as CWScript).DebugOn.SetValue(1.00)
(kmyquest.CW as CWScript).CWDebugForceAttacker.setValue(2)
(kmyquest.CW as CWScript).CWDebugForceHold.setValue(4)
while (kmyquest.CW as CWScript).CWDebugForceAttacker.Value == 0 || (kmyquest.CW as CWScript).CWDebugForceHold.Value == 0
  utility.wait(1)
;   debug.trace("CWFunctions waiting for CWDebugForceAttacker/Hold to be non-zero")
endwhile

; debug.trace("CWFunctions calling stage on CW to put player in SONS faction and make Civil War active")
kmyquest.CW.SetStage(2)
while (kmyquest.CW as CWScript).countCampaigns == 0
utility.wait(1)
; debug.trace("CWFunctions waiting for campaign count to increment before starting seige quest")
endwhile
; debug.trace("CWFunctions starting siege quest")
kmyquest.CWSiegeStart.SendStoryEvent(kmyquest.MarkarthLocation)
while kmyquest.CWSiegeMarkarthAttackQst.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWsiegeMarkarthAttackQst.IsRunning()")
endwhile
kmyquest.CWSiegeMarkarthAttackQst.SetStage(1)
utility.wait(1)
Game.GetPlayer().MoveTo(kmyquest.CWSiegeMarkarthAttackStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;QUICKSTART Whiterun DEFENSE on IMPERIAL side - note doesn't wait for the actual campaign to finsih starting
; debug.trace("CWFunctions setting vars")
(kmyquest.CW as CWScript).DebugOn.SetValue(1.00)
(kmyquest.CW as CWScript).CWDebugForceAttacker.setValue(2)
(kmyquest.CW as CWScript).CWDebugForceHold.setValue(4)
while (kmyquest.CW as CWScript).CWDebugForceAttacker.Value == 0 || (kmyquest.CW as CWScript).CWDebugForceHold.Value == 0
  utility.wait(1)
;   debug.trace("CWFunctions waiting for CWDebugForceAttacker/Hold to be non-zero")
endwhile

; debug.trace("CWFunctions calling stage on CW to put player in IMPERIAL faction and make Civil War active")
kmyquest.CW.SetStage(1)
while (kmyquest.CW as CWScript).countCampaigns == 0
utility.wait(1)
; debug.trace("CWFunctions waiting for campaign count to increment before starting seige quest")
endwhile
; debug.trace("CWFunctions starting siege quest")
kmyquest.CWSiegeStart.SendStoryEvent(kmyquest.WhiterunLocation)
while kmyquest.CWSiegeWhiterunDefendQST.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWSiegeWhiterunDefendQST.IsRunning()")
endwhile
;disable the Alikir Warriors outside of whiterun
kmyquest.MS08AlikirWarrior1Ref.Disable()
kmyquest.MS08AlikirWarrior2Ref.Disable()
Game.GetPlayer().MoveTo(kmyquest.CWSiegeWhiterunDefenseStartRef)
kmyquest.GameHour.SetValue(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;convert pools to soldier counts incase we later change the cost per soldier
int PercentThreshold = 5
int startingPoolX = 40
int currentPoolX = 30
	
;chunk the percentage into an integer we can compare to the last time
float thresholdCounter
thresholdCounter = currentPoolX / startingPoolX * 100 / PercentThreshold

debug.messagebox("RESULT:" + thresholdCounter )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
; debug.trace("CWFunctions setting everything owned by the Imperials")
; debug.trace("CWFunctions setting everything owned by the Imperials... please wait...")
kmyquest.CWDebugOn.setValue(1)
kmyquest.CWs.SetHoldOwnerByInt(1, 1)
kmyquest.CWs.SetHoldOwnerByInt(2, 1)
kmyquest.CWs.SetHoldOwnerByInt(3, 1)
kmyquest.CWs.SetHoldOwnerByInt(4, 1)
kmyquest.CWs.SetHoldOwnerByInt(5, 1)
kmyquest.CWs.SetHoldOwnerByInt(6, 1)
kmyquest.CWs.SetHoldOwnerByInt(7, 1)
kmyquest.CWs.SetHoldOwnerByInt(8, 1)
kmyquest.CWs.SetHoldOwnerByInt(9, 1)
; debug.trace("CWFunctions DONE setting everything owned by the Imperials.")
debug.messagebox("CWFunctions DONE setting everything owned by the Imperials.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
; debug.trace("CWFunctions setting Whiterun hold owned by the Stormcloaks")
; debug.trace("CWFunctions setting Whiterun owned by the Stormcloaks... please wait...")
kmyquest.CWDebugOn.setValue(1)
kmyquest.CWs.SetHoldOwnerByInt(4, 2)
; debug.trace("CWFunctions DONE setting Whiterun owned by the Stormcloaks.")
debug.messagebox("CWFunctions DONE setting Whiterun owned by the Stormcloaks.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
; debug.trace("CWFunctions setting Windhelm hold owned by the Imperials.")
; debug.trace("CWFunctions setting Windhelm owned by the Imperials... please wait...")
kmyquest.CWDebugOn.setValue(1)
kmyquest.CWs.SetHoldOwnerByInt(8, 1)
; debug.trace("CWFunctions DONE setting Windhelm owned by the Imperials.")
debug.messagebox("CWFunctions DONE setting Windhelm owned by the Imperials.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;QUICK START Civil War forcing ATTACKER and HOLD

while kmyquest.CWs.Init == 0
;    debug.trace("WAITING FOR CWScript != 0", 1)
   utility.wait(1)
endwhile
kmyquest.CWs.TutorialMissionComplete = 1
kmyquest.CWs.debugSkipSetOwnerCalls = 1
kmyquest.CWs.debugOn.value = 1
(kmyquest.CW as CWScript).CWDebugForceAttacker.setValue(2)
(kmyquest.CW as CWScript).CWDebugForceHold.setValue(4)
while (kmyquest.CW as CWScript).CWDebugForceAttacker.Value == 0 || (kmyquest.CW as CWScript).CWDebugForceHold.Value == 0
  utility.wait(1)
;   debug.trace("CWFunctions waiting for CWDebugForceAttacker/Hold to be non-zero")
endwhile

kmyquest.CWs.debugStartingCampaignPhase = 4

kmyquest.CW.setStage(1)

utility.wait(30)

kmyquest.CWs.CWDebugForceAttacker.setValue(0)
kmyquest.CWs.CWDebugForceHold.setValue(0)
kmyquest.CWs.debugStartingCampaignPhase = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;THIS QUEST IS FOR DEBUGGING ONLY THESE AREN'T FUNCTIONS CALLED BY GAME

;Convenient way to test the CWCampaignScript function that gets the current attack delta

CWScript myCW = (kmyquest.CW as CWScript)
CWCampaignScript myCWCampaign = (kmyquest.CWCampaign as CWCampaignScript)


Debug.MessageBox("Current Attack Delta: " + myCWCampaign.GetCurrentAttackDelta() + "; Starting Campaign AttackDelta: " + MyCW.AttackDelta )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;Quick Start Attack on Fort Quest

;QUICKSTART Fort Siege on SONS side
; debug.trace("CWFunctions setting vars")
(kmyquest.CW as CWScript).DebugOn.SetValue(1.00)
(kmyquest.CW as CWScript).CWDebugForceAttacker.setValue(2)
(kmyquest.CW as CWScript).CWDebugForceHold.setValue(4)
while (kmyquest.CW as CWScript).CWDebugForceAttacker.Value == 0 || (kmyquest.CW as CWScript).CWDebugForceHold.Value == 0
  utility.wait(1)
;   debug.trace("CWFunctions waiting for CWDebugForceAttacker/Hold to be non-zero")
endwhile

; debug.trace("CWFunctions calling stage on CW to put player in SONS faction and make Civil War active")
kmyquest.CW.SetStage(2)

while kmyquest.CWFortSiege.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWFortSiege.IsRunning()")
endwhile

; debug.trace("CWFunctions CWFortSiege quest isRunning! ")
debug.MessageBox("CWFunctions CWFortSiege quest isRunning! ")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;quick start the Whiterun city defense prepare city quest

setStage(101)
while kmyquest.CWSiegeWhiterunDefendQST.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWSiegeWhiterunDefendQST.IsRunning()")
endwhile

utility.wait(5)  ;waiting to hopefully allow NPCs time to init to positions before starting the quest

kmyquest.CWPrepareCityStart.SendStoryEvent(kmyquest.WhiterunLocation)

while kmyquest.CWPrepareCity.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWPrepareCity.IsRunning()")
endwhile

debug.MessageBox("CWDefend Quest Ready")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;quick start the Escape portion of a failed attack on Whiterun
setStage(101)
while kmyquest.CWSiegeWhiterunDefendQST.IsRunning() == false
utility.wait(1)
; debug.trace("CWFunctions waiting for CWSiegeWhiterunDefendQST.IsRunning()")
endwhile
kmyquest.CWSiegeWhiterunDefendQST.setStage(50)
utility.wait(3)
Game.GetPlayer().moveto(kmyquest.COCMarkerWhiterun)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
; debug.trace("CWFunctions setting Falkreath hold owned by the Stormcloaks")
; debug.trace("CWFunctions setting Falkreath owned by the Stormcloaks... please wait...")
kmyquest.CWDebugOn.setValue(1)
kmyquest.CWs.SetHoldOwnerByInt(5, 2)
; debug.trace("CWFunctions DONE setting Falkreath owned by the Stormcloaks.")
debug.messagebox("CWFunctions DONE setting Falkreath owned by the Stormcloaks.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
;THIS QUEST IS FOR DEBUGGING ONLY THESE AREN'T FUNCTIONS CALLED BY GAME

;sets CWScript PlayerAllegiance to 1 (ie Imperial)
kmyquest.CWs.setStage(1)

;kmyquest.CWs.WarIsActive = 1

kmyquest.CWs.AddEnemyFortsToBackToWar(ShowDebugMessage = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
; debug.trace("CWFunctions setting everything owned by the Stormcloaks")
; debug.trace("CWFunctions setting everything owned by the Stormcloaks... please wait...")
kmyquest.CWDebugOn.setValue(1)
kmyquest.CWs.SetHoldOwnerByInt(1, 2)
kmyquest.CWs.SetHoldOwnerByInt(2, 2)
kmyquest.CWs.SetHoldOwnerByInt(3, 2)
kmyquest.CWs.SetHoldOwnerByInt(4, 2)
kmyquest.CWs.SetHoldOwnerByInt(5, 2)
kmyquest.CWs.SetHoldOwnerByInt(6, 2)
kmyquest.CWs.SetHoldOwnerByInt(7, 2)
kmyquest.CWs.SetHoldOwnerByInt(8, 2)
kmyquest.CWs.SetHoldOwnerByInt(9, 2)
; debug.trace("CWFunctions DONE setting everything owned by the Stormcloaks.")
debug.messagebox("CWFunctions DONE setting everything owned by the Stormcloaks.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN AUTOCAST TYPE CWFunctions
Quest __temp = self as Quest
CWFunctions kmyQuest = __temp as CWFunctions
;END AUTOCAST
;BEGIN CODE
; debug.trace("CWFunctions setting Reach hold owned by the Stormcloaks")
; debug.trace("CWFunctions setting Reach owned by the Stormcloaks... please wait...")
kmyquest.CWDebugOn.setValue(1)
kmyquest.CWs.SetHoldOwnerByInt(2, 2)
; debug.trace("CWFunctions DONE setting Reach owned by the Stormcloaks.")
debug.messagebox("CWFunctions DONE setting Reach owned by the Stormcloaks.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
