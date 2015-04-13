Scriptname CR01QuestScript extends CompanionsRadiantQuest Conditional


ReferenceAlias Property Beast auto
ReferenceAlias Property RemoteTarget auto
ReferenceAlias Property HouseDoor auto

ReferenceAlias Property Homeowner01 auto
ReferenceAlias Property Homeowner02 auto
ReferenceAlias Property Homeowner03 auto
ReferenceAlias Property Homeowner04 auto
ReferenceAlias Property Homeowner05 auto
ReferenceAlias Property Homeowner06 auto
ReferenceAlias Property Homeowner07 auto
ReferenceAlias Property Homeowner08 auto
ReferenceAlias Property Homeowner09 auto
ReferenceAlias Property Homeowner10 auto


GlobalVariable Property MinorFavorPoints auto

Function Setup()
	Beast.GetReference().Disable()
	parent.Setup()
EndFunction

Function Accepted()
	; Beast.GetReference().MoveTo(RemoteTarget.GetReference())
	Beast.GetReference().Enable()
	HouseDoor.GetReference().Lock(false, true) ; make sure the door is open
	
	parent.Accepted()
EndFunction

Function Finished(bool _succeeded = true, bool _finished = true)
	parent.Finished(_succeeded, _finished)

;/ 	if (Homeowner01.GetActorReference() != None)
		Homeowner01.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif
	if (Homeowner02.GetActorReference() != None)
		Homeowner02.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif
	if (Homeowner03.GetActorReference() != None)
		Homeowner03.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif
	if (Homeowner04.GetActorReference() != None)
		Homeowner04.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif
	if (Homeowner05.GetActorReference() != None)
		Homeowner05.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif
	if (Homeowner06.GetActorReference() != None)
		Homeowner06.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif
	if (Homeowner07.GetActorReference() != None)
		Homeowner07.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif
	if (Homeowner08.GetActorReference() != None)
		Homeowner08.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif
	if (Homeowner09.GetActorReference() != None)
		Homeowner09.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif
	if (Homeowner10.GetActorReference() != None)
		Homeowner10.GetActorReference().ModFavorPointsWithGlobal(MinorFavorPoints)
	endif /;
EndFunction

Function Cleanup()
	Beast.GetReference().Delete()
	Beast.Clear()
	
	parent.Cleanup()
EndFunction

