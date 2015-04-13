;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname QF_DialogueSolitudeOpeningSce_000B2FD9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CaptainAldis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaptainAldis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Prisoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Prisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpenningSceneStartTrigger3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpenningSceneStartTrigger3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vivienne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vivienne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jala
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jala Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpeningSceneExitTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpeningSceneExitTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeshopsRaiment
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeshopsRaiment Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpenningSceneStartTrigger4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpenningSceneStartTrigger4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeGateForOpening
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeGateForOpening Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeshopsAngelines
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeshopsAngelines Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpenningSceneStartTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpenningSceneStartTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Noster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Noster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlatformGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlatformGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeGateExteriorPostOpening
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeGateExteriorPostOpening Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Evette
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evette Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lisette
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lisette Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sorex
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sorex Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ahtar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ahtar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerHeadtrackMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrisonerHeadtrackMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpenningSceneStartTrigger2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpenningSceneStartTrigger2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeshopsSkeever
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeshopsSkeever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Addvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Addvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Svari
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Svari Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpeningSceneInterruptTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpeningSceneInterruptTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Taarie
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Taarie Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Greta
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Greta Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Beirand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Beirand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpeningSceneExitTrigger2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpeningSceneExitTrigger2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeGatePostOpening
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeGatePostOpening Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeshopsBits
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeshopsBits Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Silana
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Silana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeGateExteriorForOpening
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeGateExteriorForOpening Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerCuffs
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrisonerCuffs Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
UnregisterForUpdateGameTime()
Setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Execution scene, stage set by ExecutionSceneTrigger.

ExecutionScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Alias_Prisoner.GetActorRef().EquipItem(Alias_PrisonerCuffs.GetRef(),1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE SolitudeOpeningScript
Quest __temp = self as Quest
SolitudeOpeningScript kmyQuest = __temp as SolitudeOpeningScript
;END AUTOCAST
;BEGIN CODE
Alias_CaptainAldis.GetActorRef().EvaluatePackage()
Alias_Addvar.GetActorRef().EvaluatePackage()
Alias_Greta.GetActorRef().EvaluatePackage()

;kmyquest.RegisterForUpdateGameTime(0.25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE SolitudeOpeningScript
Quest __temp = self as Quest
SolitudeOpeningScript kmyQuest = __temp as SolitudeOpeningScript
;END AUTOCAST
;BEGIN CODE
Alias_Vivienne.GetActorRef().EvaluatePackage()
Alias_Taarie.GetActorRef().EvaluatePackage()

;kmyquest.RegisterForUpdateGameTime(0.25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Set as Execution Scene end.
;Game.EnableFastTravel()
MS07.Setstage(3)
alias_prisoner.GetActorRef().Kill()
alias_prisoner.GetActorRef().SetCrimeFaction(CrimeFactionHaafingar)
alias_ahtar.GetRef().AddItem(ExecutionerAxe)
Alias_SolitudeGatePostOpening.GetRef().Enable()
Alias_SolitudeGateForOpening.GetRef().Disable()
Alias_SolitudeGateExteriorPostOpening.GetRef().Enable()
Alias_SolitudeGateExteriorForOpening.GetRef().Disable()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE SolitudeOpeningScript
Quest __temp = self as Quest
SolitudeOpeningScript kmyQuest = __temp as SolitudeOpeningScript
;END AUTOCAST
;BEGIN CODE
Alias_Beirand.GetActorRef().EvaluatePackage()
Alias_Lisette.GetActorRef().EvaluatePackage()
;Alias_Silana.GetActorRef().EvaluatePackage()



;kmyquest.RegisterForUpdateGameTime(0.25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE SolitudeOpeningScript
Quest __temp = self as Quest
SolitudeOpeningScript kmyQuest = __temp as SolitudeOpeningScript
;END AUTOCAST
;BEGIN CODE
;Execution is over, people are returning to their daily lives.
ExecutionScene.Stop()
Alias_OpeningSceneInterruptTrigger.GetRef().Disable()

If  !alias_prisoner.GetActorRef().IsDead()
     Alias_CaptainAldis.GetActorRef().startcombat(Alias_Prisoner.GetActorRef())
     Alias_Ahtar.GetActorRef().startcombat(Alias_Prisoner.GetActorRef())
     Alias_PlatformGuard.GetActorRef().startcombat(Alias_Prisoner.GetActorRef())
     Alias_Prisoner.GetActorRef().RemoveFromFaction(TownSolitudeFaction)
     SolitudeOpeningPrisonerFaction.SetEnemy(TownSolitudeFaction)
EndIf

Alias_Evette.GetActorRef().EvaluatePackage()
Alias_Jala.GetActorRef().EvaluatePackage()

kmyquest.RegisterForUpdateGameTime(0.1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Entering Solitude, setting up execution.

ExecutionSceneLeadIn.Start()

Alias_Lisette.GetActorRef().EvaluatePackage()
Alias_Beirand.GetActorRef().EvaluatePackage()
Alias_Noster.GetActorRef().EvaluatePackage()
Alias_Vivienne.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE SolitudeOpeningScript
Quest __temp = self as Quest
SolitudeOpeningScript kmyQuest = __temp as SolitudeOpeningScript
;END AUTOCAST
;BEGIN CODE
(alias_Prisoner.GetRef() as WIDeadBodyCleanupScript).CleanUpBody()
ExecutionScene.Start()
ExecutionScene.Stop()
Alias_OpeningSceneInterruptTrigger.GetRef().Disable()

Alias_Evette.GetActorRef().EvaluatePackage()
Alias_Jala.GetActorRef().EvaluatePackage()

kmyquest.RegisterForUpdateGameTime(0.1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
Alias_CaptainAldis.GetActorRef().startcombat(Alias_Prisoner.GetActorRef())
Alias_Ahtar.GetActorRef().startcombat(Alias_Prisoner.GetActorRef())
Alias_PlatformGuard.GetActorRef().startcombat(Game.GetPlayer())

Setstage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Scene Property ExecutionScene  Auto  

Quest Property MS07  Auto  

Scene Property ExecutionSceneLeadIn  Auto  


Weapon Property ExecutionerAxe  Auto  

Faction Property TownSolitudeFaction  Auto  

Faction Property SolitudeOpeningPrisonerFaction  Auto  

Faction Property CrimeFactionHaafingar  Auto  
