Scriptname C05QuestScript extends CompanionsStoryQuest Conditional

Quest Property BeforePreviousQuest auto ;-)

ReferenceAlias Property Vilkas auto
ObjectReference Property FortEnableMarker1 auto
ObjectReference Property FortEnableMarker2 auto

ReferenceAlias Property EssentialSkjor auto ; on c00
ReferenceAlias Property EssentialKodlak auto ; on c00

Faction Property IsGuardFaction auto

bool Property PlayerOnCorrectSideOfDoor auto conditional

int Property RemainingSilverHand auto conditional

Quest Property GawkersQuest auto

ReferenceAlias Property FragmentSack auto
ReferenceAlias Property FragmentSackQuestItem auto ; on C00

; called when we're testing the quest and want to create its preconditions
Function Setup()
	;BeforePreviousQuest.SetStage(200)
	
	GawkersQuest.Start() ; normally started as part of the handoff from C04
		
	parent.Setup()
	
	EssentialSkjor.Clear()
	EssentialKodlak.Clear()
	(CentralQuest as CompanionsHousekeepingScript).Skjor.GetActorReference().Kill()
	(CentralQuest as CompanionsHousekeepingScript).Kodlak.GetActorReference().Kill()
EndFunction

Function Init()
	FragmentSack.GetReference().GetParentCell().Reset()
	FragmentSackQuestItem.ForceRefTo(FragmentSack.GetReference())
	Vilkas.GetActorReference().SetPlayerTeammate(true, false)
	(CentralQuest as CompanionsHousekeepingScript).SwapFollowers()
	(CentralQuest as CompanionsHousekeepingScript).Shutup(Vilkas.GetActorReference())
	(CentralQuest as CompanionsHousekeepingScript).CurrentFollower.ForceRefTo(Vilkas.GetReference())
	Vilkas.GetActorReference().RemoveFromFaction(IsGuardFaction)
	parent.Init()
EndFunction

Function Teardown()
	if (GawkersQuest.IsRunning())
		GawkersQuest.Stop()
	endif
	if (NextQuest.IsRunning() == false)
		(CentralQuest as CompanionsHousekeepingScript).StartStoryQuest(NextQuest)
	endif
	Vilkas.GetActorReference().SetPlayerTeammate(false, false)
	(CentralQuest as CompanionsHousekeepingScript).CleanupFollowerState()
	(CentralQuest as CompanionsHousekeepingScript).UnShutup(Vilkas.GetActorReference())
	(CentralQuest as CompanionsHousekeepingScript).CurrentFollower.Clear()
	Vilkas.GetActorReference().AddToFaction(IsGuardFaction)
	parent.Teardown()
EndFunction

Function SetupFort()
	FortEnableMarker1.Enable()
	FortEnableMarker2.Enable()
EndFunction

Function KilledSilverHand()
	RemainingSilverHand -= 1
	if (RemainingSilverHand <= 0)
		SetObjectiveCompleted(11, 1)
	endif
EndFunction
