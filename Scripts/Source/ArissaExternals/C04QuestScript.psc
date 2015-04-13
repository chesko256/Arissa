Scriptname C04QuestScript extends CompanionsStoryQuest Conditional

int Property WitchesKilled auto
int Property TotalWitches auto

bool Property VilkasShouldForceGreet auto conditional
bool Property KodlakHasTask auto conditional
bool Property KodlakToldAboutWitches auto conditional
bool Property PlayerSittingDown auto conditional

ObjectReference Property VilkasWaitSpot auto

ReferenceAlias Property Kodlak auto
ReferenceAlias Property EssentialKodlak auto ; on C00
ReferenceAlias Property Aela auto
ReferenceAlias Property Farkas auto
ReferenceAlias Property Vilkas auto

ReferenceAlias Property SilverHand1 auto
ReferenceAlias Property SilverHand2 auto
ReferenceAlias Property SilverHand3 auto

ObjectReference Property WitchMarker auto
ReferenceAlias Property DA05Witch auto

Quest Property C03PostQuest auto
Quest Property JorrvaskrBadThingsQuest auto
ObjectReference Property KodlakDeadMarker auto
ObjectReference Property DeadKodlak auto

ObjectReference Property HagMarker  Auto  

Function Setup()
	parent.Setup()
	Actor skjorActor = (CentralQuest as CompanionsHousekeepingScript).Skjor.GetActorReference()
	skjorActor.Kill()
	skjorActor.Disable()
	(CentralQuest as CompanionsHousekeepingScript).PlayerHasBeastBlood = True
	(CentralQuest as CompanionsHousekeepingScript).PlayerIsWerewolf.SetValueInt(1)
	(CentralQuest as CompanionsHousekeepingScript).TempUnderforgeAccess = True
	C03PostQuest.Stop()
endFunction

Function Init()
	parent.Init()
	(CentralQuest as CompanionsHousekeepingScript).Shutup(Kodlak.GetActorReference())
EndFunction

Function SetupCoven()
	WitchMarker.Enable()
	HagMarker.Disable()
	; DA05Witch.GetReference().Disable()
EndFunction

Function KilledHagraven()
	WitchesKilled += 1
	if (WitchesKilled >= TotalWitches)
		SetObjectiveCompleted(25, 1)
	endif
EndFunction

Function StuffWentDownInJorrvaskr()
	; kill Kodlak :-(
	EssentialKodlak.Clear()
	Kodlak.GetActorReference().Kill()
	Kodlak.GetReference().Disable()
	
	; exterior and interior effects, plus enabling dead kodlak
	JorrvaskrBadThingsQuest.Start()

	; make sure the player can't loot Kodlak
	DeadKodlak.BlockActivation(true)
	
	; tell Vilkas to come say hey
	(CentralQuest as CompanionsHousekeepingScript).ShutDownRadiantQuestsFor(Vilkas.GetActorReference())
	Vilkas.GetReference().MoveTo(VilkasWaitSpot)
	VilkasShouldForceGreet = true
	Vilkas.GetActorReference().EvaluatePackage()
EndFunction

Function Teardown()
	if (IsObjectiveCompleted(25) == False)
		SetObjectiveDisplayed(25, 0)
	endif
	; DA05Witch.GetReference().Enable()
	(CentralQuest as CompanionsHousekeepingScript).StartStoryQuest(NextQuest)
	parent.Teardown()
EndFunction

