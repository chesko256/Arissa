Scriptname CR06QuestScript extends CompanionsRadiantQuest conditional

ReferenceAlias Property Gewgaw auto
ReferenceAlias Property SpawnChest auto
ReferenceAlias Property BossChest auto

ReferenceAlias Property Skjor auto  ; on C00
ReferenceAlias Property Vilkas auto ; on C00
Keyword Property CRSkjor auto
Keyword Property CRVilkas auto

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
	if     (akKeyword == CRSkjor)
		Questgiver.ForceRefTo(Skjor.GetReference())
	elseif (akKeyword == CRVilkas)
		Questgiver.ForceRefTo(Vilkas.GetReference())
	endif

	if (!IsRegistered)
		(ParentQuest as CompanionsHousekeepingScript).RegisterRadiantQuest(self)
	endif
EndEvent

Function Accepted()
	BossChest.GetReference().GetParentCell().Reset()
	BossChest.GetReference().AddItem(Gewgaw.GetReference())
	parent.Accepted()
EndFunction

Function Cleanup()
	Game.GetPlayer().RemoveItem(Gewgaw.GetReference())
	SpawnChest.GetReference().RemoveAllItems()
	parent.Cleanup()
EndFunction


