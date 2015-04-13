;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 49
Scriptname QF_MS07_00023A64 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MS07LighthouseFireOff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07LighthouseFireOff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07JareeRa
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07JareeRa Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07DeejaIcerunnerMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07DeejaIcerunnerMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07SorexVinius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07SorexVinius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07IcerunnerLoot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07IcerunnerLoot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07LighthouseFire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07LighthouseFire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07SorexMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07SorexMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07JareeRaCampBrokenOarMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07JareeRaCampBrokenOarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07IceRunnerMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07IceRunnerMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07JareeRaDocksMeetingMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07JareeRaDocksMeetingMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07OpeningSceneTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07OpeningSceneTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07Deeja
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07Deeja Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07BanditGreeter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07BanditGreeter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07IcerunnerLootEnabler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07IcerunnerLootEnabler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07IcerunnerChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07IcerunnerChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07DeejaNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07DeejaNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07BrokenOarGrottoMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07BrokenOarGrottoMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07BrokenOarEntranceStageSetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07BrokenOarEntranceStageSetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS07LighthouseMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS07LighthouseMapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
setObjectiveCompleted(100)               ; Meet with Jaree-Ra

IcerunnerQST.Setstage(10)
alias_MS07Deeja.GetRef().moveto(alias_MS07DeejaIcerunnerMarker.GetRef())
alias_MS07Deeja.GetRef().Enable()
Alias_MS07Deeja.GetActorRef().GetActorBase().SetEssential(false)
Alias_MS07Deeja.GetActorRef().SetCrimeFaction(None)
Alias_MS07Deeja.GetActorRef().RemoveFromFaction(CrimeFactionHaafingar)
Alias_MS07Deeja.GetActorRef().AddItem(Alias_MS07DeejaNote.GetRef())

Alias_MS07IceRunnerMapMarker.GetRef().AddToMap()
setObjectiveDisplayed(125)                 ; Find Deeja at the wreck of the Icerunner
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
alias_MS07LighthouseFireOff.GetRef().enable()
alias_MS07LighthouseFire.GetRef().Disable()
setObjectiveCompleted(50)               ; Put out the Solitude Lighthouse fire
setObjectiveDisplayed(100)               ; Meet with Jaree-Ra
;move Jaree-Ra to docks

alias_MS07JareeRa.GetRef().moveto(alias_MS07JareeRaDocksMeetingMarker.GetRef())

alias_MS07Deeja.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setObjectiveDisplayed(10)              ; Listen to Jaree-Ra's offer in Solitude
MS07Rumor.setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;TEMP FOR TESTING
;Game.GetPlayer().moveto(Alias_MS07JareeRa.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
setObjectiveCompleted(10)               ; Listen to Jaree-Ra's offer in Solitude             
setObjectiveDisplayed(50)                 ; Put out the Solitude Lighthouse fire
MS07Rumor.setstage(20)
Alias_MS07LighthouseMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
MS07OpeningScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
setObjectiveCompleted(125)                    ; Find Deeja at the wreck of the Icerunner
setObjectiveCompleted(150)                    ; Defeat Deeja
setObjectiveDisplayed(175)                      ;Find out where Jaree-Ra's bandits took the loot
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
setObjectiveCompleted(225)                    ; Defeat Jaree-Ra
Alias_MS07DeejaNote.GetRef().Disable()
AchievementsQuest.IncSideQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
;TEMP - Set when the opening scene of Solitude has played.
;Intention - Set after the player has entered and exited Solitude
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
setObjectiveCompleted(200)                    ;Travel to Camp Broken Oar
setObjectiveDisplayed(225)                      ; Defeat Jaree-Ra

;Failsafe-- Clear the bandits off the Icerunner if we didn't do this earlier.
IcerunnerQST.Setstage(30)
IcerunnerQST.Setstage(255)

;if Stage 100 is done on dunCampBrokenOar.  If it is then simply enable dunBrokenOarRespawnEnableMarker(000BABC5) and dunBrokenOarLootEnableMarker(000BABBC) and send the player on his way.
;If Stage 100 isn't done then just enable dunBrokenOarLootEnableMarker(000BABBC).
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
setObjectiveCompleted(125)                    ; Find Deeja at the wreck of the Icerunner
setObjectiveDisplayed(150)                      ; Defeat Deeja

IcerunnerQST.Setstage(20)
MS07BanditSiblings.SetEnemy(PlayerFaction)
Alias_MS07Deeja.GetActorRef().startcombat(Game.GetPlayer())
;Alias_MS07Deeja.setessential(false)
Alias_MS07JareeRa.GetRef().moveto(alias_MS07JareeRaCampBrokenOarMarker.GetRef())
Alias_MS07JareeRa.GetActorRef().GetActorBase().SetEssential(false)
Alias_MS07JareeRa.GetActorRef().SetCrimeFaction(None)
Alias_MS07JareeRa.GetActorRef().RemoveFromFaction(CrimeFactionHaafingar)
Alias_MS07Deeja.GetREf().AddItem(Alias_MS07DeejaNote.GetRef())
Alias_MS07DeejaNote.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
setObjectiveCompleted(175)                    ; Find out where Jaree-Ra's bandits took the loot
setObjectiveDisplayed(200)                      ; Travel to Camp Broken Oar

alias_MS07IcerunnerLootEnabler.GetRef().Enable()

alias_MS07BrokenOarGrottoMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property SolitudeDocksDistrictMarker  Auto  

ObjectReference Property MS07BanditContact2WaitMarker  Auto  


ObjectReference Property MS07BanditLeaderMarker  Auto  

Faction Property MS07BanditSiblings  Auto  

Faction Property PlayerFaction  Auto  

Quest Property IcerunnerQST  Auto  

Scene Property MS07OpeningScene  Auto  

Faction Property CrimeFactionHaafingar  Auto  

Quest Property MS07Rumor  Auto  

AchievementsScript Property AchievementsQuest Auto
