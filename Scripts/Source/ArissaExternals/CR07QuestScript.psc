Scriptname CR07QuestScript extends CompanionsRadiantQuest conditional


ReferenceAlias Property Criminal auto


ReferenceAlias Property Skjor auto  ; on C00
ReferenceAlias Property Vilkas auto ; on C00
Keyword Property CRSkjor auto
Keyword Property CRVilkas auto

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
; 	Debug.Trace("CRQ CR06: Starting CR06 from story script.")
	if     (akKeyword == CRSkjor)
		Questgiver.ForceRefTo(Skjor.GetReference())
	elseif (akKeyword == CRVilkas)
		Questgiver.ForceRefTo(Vilkas.GetReference())
	endif
	
	if (!IsRegistered)
		(ParentQuest as CompanionsHousekeepingScript).RegisterRadiantQuest(self)
	endif
EndEvent


Function Setup()
	Criminal.GetReference().Disable()
	parent.Setup()
EndFunction

Function Accepted()
	Criminal.GetReference().Enable()
	parent.Accepted()
EndFunction
