Scriptname CR12QuestScript extends CompanionsRadiantQuest Conditional

ReferenceAlias Property QuestgiverEssentialized auto
ReferenceAlias Property Totem auto

MiscObject Property TotemType1 auto
MiscObject Property TotemType2 auto
MiscObject Property TotemType3 auto

ObjectReference Property SpawnMarker auto

ReferenceAlias Property TreasureMarker auto

Quest Property CR12PostQuest auto

Faction Property IsGuardFaction auto
Faction Property PotentialFollowerFaction auto

Function Accepted()
	Questgiver.GetActorReference().SetPlayerTeammate(true)
	(ParentQuest as CompanionsHousekeepingScript).SwapFollowers()
	Questgiver.GetActorReference().RemoveFromFaction(IsGuardFaction)
	Questgiver.GetActorReference().RemoveFromFaction(PotentialFollowerFaction)
	QuestgiverEssentialized.ForceRefTo(Questgiver.GetReference())

	ObjectReference t = None
		
	if      ((ParentQuest as CompanionsHousekeepingScript).TotemsFound == 0)
		t = SpawnMarker.PlaceAtMe(TotemType1)
	elseif ((ParentQuest as CompanionsHousekeepingScript).TotemsFound == 1)
		t = SpawnMarker.PlaceAtMe(TotemType2)
	else
		t = SpawnMarker.PlaceAtMe(TotemType3)
	endif

	Totem.ForceRefTo(t)

	TreasureMarker.GetReference().AddItem(Totem.GetReference())
	TreasureMarker.GetReference().GetParentCell().Reset()

	parent.Accepted()

	Questgiver.GetActorReference().EvaluatePackage()
EndFunction

Function Cleanup()
	Game.GetPlayer().RemoveItem(Totem.GetReference())
	(ParentQuest as CompanionsHousekeepingScript).TotemsFound += 1
	CR12PostQuest.Start()
	Questgiver.GetActorReference().SetPlayerTeammate(false)
	(ParentQuest as CompanionsHousekeepingScript).CleanupFollowerState()
	Questgiver.GetActorReference().AddToFaction(IsGuardFaction)
	Questgiver.GetActorReference().AddToFaction(PotentialFollowerFaction)
	QuestgiverEssentialized.Clear()
	parent.Cleanup()
EndFunction
