Scriptname CR08QuestScript extends CompanionsRadiantQuest Conditional

ReferenceAlias Property Victim auto
ReferenceAlias Property ProtectedVictim auto
ReferenceAlias Property VictimMarker auto
LocationAlias Property VictimHome auto

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
	parent.Accepted()
	VictimMarker.GetReference().GetParentCell().Reset()
; 	Debug.Trace("CRQ CR08: Accepting quest, moving victim; quest at stage " + GetStage())
	Actor poorSap = Victim.GetActorReference()
	poorSap.MoveTo(VictimMarker.GetReference())
	poorSap.EvaluatePackage()

; 	Debug.Trace("CRQ CR08: Victim (" + poorSap + ") moved; now in: " + poorSap.GetParentCell())
	
	; we only want the abductee to be protected once we've actually taken on the quest
	ProtectedVictim.ForceRefTo(poorSap)
EndFunction

; gets called by story event quest
Function LocationChangeCheck(Location newLocation)
	if (!IsRunning())
		return
	endif
	
; 	Debug.Trace("CRQ CR08: Location check. New location: " + newLocation + "; Target: " + VictimHome.GetLocation())
	if (newLocation == VictimHome.GetLocation())
		SetStage(22)
	endif
EndFunction
