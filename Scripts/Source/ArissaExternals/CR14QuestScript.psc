Scriptname CR14QuestScript extends CompanionsRadiantQuest  Conditional


ReferenceAlias Property Farkas auto  ; on C00
ReferenceAlias Property Vilkas auto  ; on C00
Keyword Property CRFarkas auto
Keyword Property CRVilkas auto

ReferenceAlias Property Dragon auto

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
; 	Debug.Trace("CRQ CR14: Starting CR14 from story script.")
	if     (akKeyword == CRFarkas)
		Questgiver.ForceRefTo(Farkas.GetReference())
	elseif (akKeyword == CRVilkas)
		Questgiver.ForceRefTo(Vilkas.GetReference())
	endif
	
	if (!IsRegistered)
		(ParentQuest as CompanionsHousekeepingScript).RegisterRadiantQuest(self)
	endif
EndEvent

Function Accepted()
	parent.Accepted()
	Dragon.GetReference().GetParentCell().Reset()
EndFunction

