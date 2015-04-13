;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_C00_0004B2D9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DeadSilverHand2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadSilverHand2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FragmentsOfWuuthrad
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FragmentsOfWuuthrad Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VilkasSwordQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VilkasSwordQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWatched
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWatched Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AelaShield
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AelaShield Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrialObserver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrialObserver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlenmorilHead2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GlenmorilHead2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vilkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentFollower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CurrentFollower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kodlak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kodlak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GallowsRockReservation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GallowsRockReservation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RadiantQuestgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RadiantQuestgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY YsgramorsTombReservation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_YsgramorsTombReservation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eorlund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eorlund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Athis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Athis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AelaShieldQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AelaShieldQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EorlundEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EorlundEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Njada
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Njada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadSilverHand4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadSilverHand4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkjorEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkjorEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadSilverHand5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadSilverHand5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadSilverHand3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadSilverHand3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlenmorilHead3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GlenmorilHead3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Torvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Torvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadKodlak1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadKodlak1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlenmorilHead4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GlenmorilHead4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skjor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KodlakEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KodlakEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlenmorilHead5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GlenmorilHead5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AelaEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AelaEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlenmorilHead1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GlenmorilHead1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadSilverHand1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadSilverHand1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FarkasEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FarkasEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VilkasSword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VilkasSword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadKodlak2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadKodlak2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VilkasEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VilkasEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DustmansCairnReservation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DustmansCairnReservation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
if (LastFarkasTourScene.IsPlaying())
	LastFarkasTourScene.Stop()
endif
if (ASScene.IsPlaying())
	ASScene.Stop()
endif

;for debug purposes
if (C00GiantAttack.IsRunning())
	C00GiantAttack.SetStage(200)
endif
if (C00JorrvaskrFight.IsRunning())
	C00JorrvaskrFight.Stop()
endif
FightTrigger1.Delete()
FightTrigger2.Delete()
;\debug
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE companionshousekeepingscript
Quest __temp = self as Quest
companionshousekeepingscript kmyQuest = __temp as companionshousekeepingscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50,1)

kmyQuest.PlayerMetFarkas = true

kmyQuest.PlayerJoin()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE companionshousekeepingscript
Quest __temp = self as Quest
companionshousekeepingscript kmyQuest = __temp as companionshousekeepingscript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(TrainingFaction)
Alias_Vilkas.GetActorRef().RemoveFromFaction(TrainingFaction)

SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

kmyQuest.PlayerMetVilkas = true
Alias_Vilkas.GetActorRef().SetNoFavorAllowed(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE companionshousekeepingscript
Quest __temp = self as Quest
companionshousekeepingscript kmyQuest = __temp as companionshousekeepingscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(50, 1)

kmyQuest.PlayerMetSkjor = true
kmyQuest.PlayerMetAela = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE companionshousekeepingscript
Quest __temp = self as Quest
companionshousekeepingscript kmyQuest = __temp as companionshousekeepingscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)

kmyQuest.PlayerMetEorlund = true
kmyQuest.EorlundShouldForcegreet = false

Alias_Aela.GetReference().MoveTo(AelaSpot)
Alias_Skjor.GetReference().MoveTo(SkjorSpot)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE companionshousekeepingscript
Quest __temp = self as Quest
companionshousekeepingscript kmyQuest = __temp as companionshousekeepingscript
;END AUTOCAST
;BEGIN CODE
if (CompanionsMiscObjective.IsRunning() && !CompanionsMiscObjective.GetStageDone(200))
      CompanionsMiscObjective.SetStage(200)
endif


SetObjectiveDisplayed(20, 1)

if (C00GiantAttack.IsRunning())
	C00GiantAttack.SetStage(200)
endif

kmyQuest.PlayerMetKodlak = true
KVArgueScene.Stop()
;Alias_Vilkas.GetActorRef().EvaluatePackage()
Alias_Eorlund.GetRef().MoveTo(EorlundSpot)

Game.GetPlayer().AddToFaction(TrainingFaction)
Game.GetPlayer().AddToFaction(HateFaction)
Alias_Vilkas.GetActorRef().AddToFaction(TrainingFaction)
Alias_Vilkas.GetActorRef().SetNoFavorAllowed(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; talk to kodlak
CompanionsMiscObjective.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE companionshousekeepingscript
Quest __temp = self as Quest
companionshousekeepingscript kmyQuest = __temp as companionshousekeepingscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetupCompanions()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property AelaSpot  Auto  

ObjectReference Property SkjorSpot  Auto  

Faction Property TrainingFaction  Auto  

ObjectReference Property EorlundSpot  Auto  

Quest Property C00GiantAttack  Auto  

Faction Property CompanionsFaction  Auto  

ObjectReference Property FightTrigger1  Auto  

ObjectReference Property FightTrigger2  Auto  


Scene Property LastFarkasTourScene  Auto  

Quest Property C00JorrvaskrFight  Auto  

Scene Property KVArgueScene  Auto  

Quest Property CompanionsMiscObjective  Auto  

Scene Property ASScene  Auto  

Faction Property HateFaction  Auto  
